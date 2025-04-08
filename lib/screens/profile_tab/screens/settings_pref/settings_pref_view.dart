import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/screens/profile_tab/screens/screens.dart';
import 'package:prime_video_flutter_ui_kit/utils/utilities.dart';

class SettingsPrefView extends StatelessWidget {
  const SettingsPrefView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _mainBody(context),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        StringConstant.settingsAndPreferences,
        style: StyleConstants.heading20Size,
      ),
    );
  }

  Widget _mainBody(BuildContext context) {
    SettingsPrefController settingsPrefController =
        Get.put(SettingsPrefController());
    return Obx(
      () => ListView(
        shrinkWrap: true,
        padding: horizontalPadding(),
        children: [
          customTileWidget(
              leadingIcon: AssetsConstant.hdIcon,
              title: Text.rich(TextSpan(
                  text: StringConstant.videoQualityDotTxt,
                  style: StyleConstants.commonStyle.copyWith(
                      fontWeight: FontWeight.w500,
                      color: ColorConstant.fontColorOpacity100),
                  children: [
                    TextSpan(
                        text: StringConstant.auto,
                        style: StyleConstants.commonStyle.copyWith(
                            color: ColorConstant.fontColorOpacity60,
                            fontWeight: FontWeight.w400))
                  ])),
              trailing: GestureDetector(
                onTap: () => Get.to(() => const VideoQualityView()),
                child: Image.asset(
                  AssetsConstant.forwardIcon,
                  scale: SizeConstant.appSize4,
                ),
              )),
          const Divider(),
          customTileWidget(
              leadingIcon: AssetsConstant.subTitleIcon,
              title: Text(
                StringConstant.subtitles,
                style: StyleConstants.commonStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    color: ColorConstant.fontColorOpacity100),
              ),
              trailing: SizedBox(
                height: SizeConstant.appSize25,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: SizedBox(
                    child: Switch(
                      thumbIcon: const WidgetStatePropertyAll(Icon(
                        Icons.circle_rounded,
                        color: ColorConstant.whiteColor,
                      )),
                      value: settingsPrefController.subtitleShowing.value,
                      inactiveTrackColor: ColorConstant.switchInActiveColor,
                      onChanged: (item) =>
                          settingsPrefController.subtitleShowing.value = item,
                    ),
                  ),
                ),
              )),
          const Divider(),
          customTileWidget(
              leadingIcon: AssetsConstant.autoPlaySettingIcon,
              title: Text(
                StringConstant.autoPlay,
                style: StyleConstants.commonStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    color: ColorConstant.fontColorOpacity100),
              ),
              trailing: SizedBox(
                height: SizeConstant.appSize25,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: SizedBox(
                    child: Switch(
                      value: settingsPrefController.autoPlayShowing.value,
                      inactiveTrackColor: ColorConstant.switchInActiveColor,
                      thumbIcon: const WidgetStatePropertyAll(Icon(
                        Icons.circle_rounded,
                        color: ColorConstant.whiteColor,
                      )),
                      onChanged: (item) =>
                          settingsPrefController.autoPlayShowing.value = item,
                    ),
                  ),
                ),
              )),
          const Divider(),
          contentLanguagesWidget(context)
        ],
      ),
    );
  }

  Widget contentLanguagesWidget(BuildContext context) {
    return ListTile(
      dense: true,
      onTap: () => contentLanguageDialog(context),
      minTileHeight: SizeConstant.appSize45,
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(
        AssetsConstant.languageSettingIcon,
        scale: SizeConstant.appSize4,
      ),
      title: Text(
        StringConstant.contentLanguages,
        style: StyleConstants.commonStyle.copyWith(
            fontWeight: FontWeight.w500,
            color: ColorConstant.fontColorOpacity100),
      ),
      trailing: Text(
        StringConstant.getStarted,
        style: StyleConstants.commonStyle.copyWith(
            fontWeight: FontWeight.w400,
            color: ColorConstant.fontColorOpacity70),
      ),
    );
  }

  Widget customTileWidget(
      {void Function()? onTap,
      required String leadingIcon,
      required Widget title,
      required Widget trailing}) {
    return ListTile(
        dense: true,
        onTap: onTap,
        minTileHeight: SizeConstant.appSize45,
        contentPadding: EdgeInsets.zero,
        leading: Image.asset(leadingIcon,
            scale: AssetsConstant.subTitleIcon == leadingIcon
                ? SizeConstant.appSize4
                : SizeConstant.appSize3),
        title: title,
        trailing: trailing);
  }
}
