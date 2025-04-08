import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/models/models.dart';
import 'package:prime_video_flutter_ui_kit/screens/home/home.dart';
import 'package:prime_video_flutter_ui_kit/utils/utils.dart';

//ignore: must_be_immutable
class SubScribeTile extends StatelessWidget {
  SubScribeTile({super.key, required this.item, required this.index});
  SubscribeModel item;
  int index;
  GoPremiumController goPremiumController = Get.put(GoPremiumController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () => goPremiumController.onTapedSubscribe(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          width: PrimeSizeConfig.displayWidth(context),
          padding: goPremiumController.selectedIndex.value == index
              ? const EdgeInsets.all(SizeConstant.appSize2)
              : null,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SizeConstant.appSize14),
              gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [ColorConstant.gradient1, ColorConstant.gradient2])),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            padding: const EdgeInsets.all(SizeConstant.appSize20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeConstant.appSize14),
                color: ColorConstant.subscribeBgColor,
                border: Border.all(
                    color: ColorConstant.fontColorOpacity100.withOpacity(0.3))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                        text: TextSpan(
                            text: item.price,
                            style: StyleConstants.heading20Size,
                            children: [
                          TextSpan(
                              text: item.duration,
                              style: StyleConstants.description4.copyWith(
                                  color: ColorConstant.fontColorOpacity60,
                                  fontWeight: FontWeight.w500))
                        ])),
                    Row(
                      children: [
                        goPremiumController.selectedIndex.value == index
                            ? Image.asset(AssetsConstant.radioBgIcon,
                                scale: SizeConstant.appSize4)
                            : Image.asset(AssetsConstant.radioIcon,
                                scale: SizeConstant.appSize4),
                        const SizedBox(width: SizeConstant.appSize6),
                        Text(
                          item.planValue,
                          style: StyleConstants.commonStyle.copyWith(
                              color: ColorConstant.fontColorOpacity100,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: SizeConstant.appSize10),
                const Divider(),
                const SizedBox(height: SizeConstant.appSize10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringConstant.sbDescriptionTxt,
                      style: StyleConstants.description4.copyWith(
                          color: ColorConstant.fontColorOpacity60,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      item.deviceConnect,
                      style: StyleConstants.description2.copyWith(
                          color: ColorConstant.fontColorOpacity100,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringConstant.maxVideoQuality,
                      style: StyleConstants.description4.copyWith(
                          color: ColorConstant.fontColorOpacity60,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      item.planResolution,
                      style: StyleConstants.description2.copyWith(
                          color: ColorConstant.fontColorOpacity100,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
