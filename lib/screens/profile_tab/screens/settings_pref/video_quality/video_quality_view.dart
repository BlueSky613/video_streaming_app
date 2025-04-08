import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/screens/profile_tab/screens/settings_pref/video_quality/video_quality.dart';
import 'package:prime_video_flutter_ui_kit/utils/utilities.dart';

class VideoQualityView extends StatelessWidget {
  const VideoQualityView({super.key});

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
        StringConstant.videoQuality,
        style: StyleConstants.heading20Size,
      ),
    );
  }

  Widget _mainBody(BuildContext context) {
    VideoQualityController videoQualityController =
        Get.put(VideoQualityController());
    return ListView(
      shrinkWrap: true,
      padding: horizontalPadding(),
      children: [
        const SizedBox(
          height: SizeConstant.appSize38,
        ),
        Text(
          StringConstant.chooseTheVideoQuality,
          style: StyleConstants.commonStyle.copyWith(
              color: ColorConstant.fontColorOpacity100,
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: SizeConstant.appSize22,
        ),
        ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var item = videoQualityController.videoQualityList[index];
              return Obx(
                () => ListTile(
                  onTap: () => videoQualityController.onTapListTile(index),
                  dense: true,
                  tileColor: videoQualityController.selectedIndex.value == index
                      ? ColorConstant.subscribeBgColor
                      : null,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConstant.appSize12),
                      side:
                          BorderSide(color: ColorConstant.fontColorOpacity30)),
                  contentPadding: EdgeInsets.zero,
                  minLeadingWidth: SizeConstant.appSize38,
                  leading: videoQualityController.selectedIndex.value == index
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: SizeConstant.appSize18),
                          child: Image.asset(
                            AssetsConstant.checkboxWithoutBgIcon,
                            scale: SizeConstant.appSize5,
                            color: ColorConstant.whiteColor,
                          ),
                        )
                      : const SizedBox(
                          width: SizeConstant.appSize5,
                        ),
                  title: Text.rich(TextSpan(
                      text: item[StringConstant.name],
                      style: StyleConstants.description1
                          .copyWith(fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(
                          text: " ${item[StringConstant.videoQuality]}",
                          style: StyleConstants.commonStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              color: ColorConstant.fontColorOpacity60),
                        )
                      ])),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: SizeConstant.appSize14,
                ),
            itemCount: videoQualityController.videoQualityList.length)
      ],
    );
  }
}
