import 'package:flutter/material.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/utils/size_config.dart';

class PrimeElevatedButton extends StatelessWidget {
  const PrimeElevatedButton(
      {super.key,
      this.onPressed,
      this.child,
      this.width,
      this.height,
      this.backgroundColor,
      this.elevation,
      this.borderColor});

  /// Callback function triggered when the button is pressed.
  final void Function()? onPressed;

  /// The content of the button.
  final Widget? child;

  /// The width of the button. If not specified, it takes the intrinsic width.
  final double? width;

  /// The height of the button. If not specified, it takes the intrinsic height.
  final double? height;

  /// The background color of the button.
  final Color? backgroundColor;

  ///Button elevation add on button style
  final double? elevation;

  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? PrimeSizeConfig.displayWidth(context),
      height: height ?? SizeConstant.appSize42,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          overlayColor: WidgetStatePropertyAll(
              backgroundColor ?? ColorConstant.fontColorOpacity12),
          elevation: WidgetStatePropertyAll(elevation),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              side: borderColor != null
                  ? BorderSide(color: borderColor!)
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(SizeConstant.appSize10))),
          backgroundColor: WidgetStatePropertyAll(
              backgroundColor ?? ColorConstant.primaryColor),
        ),
        child: child,
      ),
    );
  }
}
