import 'package:flutter/material.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/utils/utils.dart';

class TitleTileWidget extends StatelessWidget {
  const TitleTileWidget(
      {super.key,
      this.icon,
      this.buttonShowing = true,
      required this.title,
      this.onTapButton,
      this.padding});
  final bool buttonShowing;
  final Widget? icon;
  final String title;
  final EdgeInsetsGeometry? padding;
  final void Function()? onTapButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding ?? horizontalPadding(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: StyleConstants.description1.copyWith(
                      color: ColorConstant.fontColorOpacity100,
                      fontWeight: FontWeight.w700),
                ),
                if (icon != null) ...[
                  const SizedBox(width: SizeConstant.appSize8),
                  icon!
                ]
              ],
            ),
            if (buttonShowing == true) ...[
              GestureDetector(
                onTap: onTapButton,
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: ColorConstant.whiteColor,
                  size: SizeConstant.appSize18,
                ),
              )
            ]
          ],
        ));
  }
}
