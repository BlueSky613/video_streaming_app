import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/screens/profile_tab/screens/screens.dart';
import 'package:prime_video_flutter_ui_kit/utils/size_config.dart';
import 'package:prime_video_flutter_ui_kit/utils/utilities.dart';
import 'package:prime_video_flutter_ui_kit/widgets/button.dart';

Future contentLanguageDialog(BuildContext context) {
  SettingsPrefController settingsPrefController =
      Get.put(SettingsPrefController());
  return showDialog(
      context: context,
      useSafeArea: true,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(
              horizontal: PrimeSizeConfig.displayWidth(context) *
                  SizeConstant.opacity0point05),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: horizontalPadding().copyWith(
                top: SizeConstant.appSize18, bottom: SizeConstant.appSize15),
            shrinkWrap: true,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Image.asset(
                    AssetsConstant.closeIcon,
                    scale: SizeConstant.appSize4,
                  ),
                ),
              ),
              Text(
                StringConstant.getBetterSuggestions,
                textAlign: TextAlign.center,
                style: StyleConstants.heading24Style,
              ),
              const SizedBox(height: SizeConstant.appSize6),
              Text(
                StringConstant.selectYourPreferredLanguage,
                textAlign: TextAlign.center,
                style: StyleConstants.description2
                    .copyWith(color: ColorConstant.fontColorOpacity70),
              ),
              const SizedBox(height: SizeConstant.appSize10),
              const Divider(),
              const SizedBox(height: SizeConstant.appSize10),
              GridView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: SizeConstant.appSize3.toInt(),
                    mainAxisSpacing: SizeConstant.appSize16,
                    mainAxisExtent: SizeConstant.appSize80,
                    crossAxisSpacing: SizeConstant.appSize10),
                children: List.generate(
                    growable: true,
                    settingsPrefController.languageList.length,
                    (i) => Image.asset(
                          settingsPrefController.languageList[i],
                          fit: BoxFit.contain,
                        )),
              ),
              const SizedBox(height: SizeConstant.appSize28),
              PrimeElevatedButton(
                onPressed: () => Get.back(),
                child: Text(
                  StringConstant.save,
                  style: StyleConstants.button,
                ),
              )
            ],
          ),
        );
      });
}
