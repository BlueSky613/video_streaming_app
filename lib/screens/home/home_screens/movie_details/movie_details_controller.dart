import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';

class MovieDetailsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxBool watchListAdd = false.obs;
  RxBool videoPlayerShowing = false.obs;
  RxString selectedSubtitle = StringConstant.english.obs;
  RxString selectedVideoQuality = StringConstant.auto.obs;
  RxString selectedVideoSpeed = StringConstant.normal.obs;

  RxInt downloadStatus = SizeConstant.appSize0.toInt().obs;
  RxInt selectedLanguage = SizeConstant.appSize0.toInt().obs;
  RxInt selectedDownloadOption = SizeConstant.appSize0.toInt().obs;
  RxInt selectedTabIndex = SizeConstant.appSize0.toInt().obs;

  TabController? tabController;

  List languageList = [
    StringConstant.noAdditionalLanguage,
    StringConstant.english,
    StringConstant.dutch,
    StringConstant.cestina
  ];

  List downloadOptionList = [
    {
      StringConstant.namePicker: StringConstant.qualityName1,
      StringConstant.gb: StringConstant.qualityGb1
    },
    {
      StringConstant.namePicker: StringConstant.qualityName2,
      StringConstant.gb: StringConstant.qualityGb2
    },
    {
      StringConstant.namePicker: StringConstant.qualityName3,
      StringConstant.gb: StringConstant.qualityGb3
    },
    {
      StringConstant.namePicker: StringConstant.qualityName4,
      StringConstant.gb: StringConstant.qualityGb4
    },
  ];
  List tabEpisodeList = [
    StringConstant.seasonTxt(1),
    StringConstant.seasonTxt(2),
    StringConstant.seasonTxt(3),
    StringConstant.seasonTxt(4),
    StringConstant.seasonTxt(5),
  ];

  bottomTabTaped(int i) {
    selectedTabIndex.value = i;
    update();
  }

  List castList = [
    {
      StringConstant.namePicker: StringConstant.castName1,
      StringConstant.cast: AssetsConstant.castImg(1)
    },
    {
      StringConstant.namePicker: StringConstant.castName2,
      StringConstant.cast: AssetsConstant.castImg(2)
    },
    {
      StringConstant.namePicker: StringConstant.castName3,
      StringConstant.cast: AssetsConstant.castImg(3)
    },
    {
      StringConstant.namePicker: StringConstant.castName4,
      StringConstant.cast: AssetsConstant.castImg(4)
    },
    {
      StringConstant.namePicker: StringConstant.castName5,
      StringConstant.cast: AssetsConstant.castImg(5)
    },
  ];

  List audioLanguageList = [
    StringConstant.malayalam,
    StringConstant.kannada,
    StringConstant.hindi,
    StringConstant.telugu,
    StringConstant.tamil,
  ];

  List moreLikeList = [
    AssetsConstant.trendingRightNowImg(1),
    AssetsConstant.trendingRightNowImg(2),
    AssetsConstant.trendingRightNowImg(3),
    AssetsConstant.trendingRightNowImg(4),
    AssetsConstant.trendingRightNowImg(5),
    AssetsConstant.trendingRightNowImg(6),
    AssetsConstant.trendingRightNowImg(7),
    AssetsConstant.trendingRightNowImg(8),
  ];

  List episodeList = [
    {
      StringConstant.episodes: AssetsConstant.episodeImg(1),
      StringConstant.namePicker: StringConstant.episode1,
      StringConstant.duration: StringConstant.episodeDuration1
    },
    {
      StringConstant.episodes: AssetsConstant.episodeImg(2),
      StringConstant.namePicker: StringConstant.episode2,
      StringConstant.duration: StringConstant.episodeDuration2
    },
    {
      StringConstant.episodes: AssetsConstant.episodeImg(3),
      StringConstant.namePicker: StringConstant.episode3,
      StringConstant.duration: StringConstant.episodeDuration3
    },
    {
      StringConstant.episodes: AssetsConstant.episodeImg(4),
      StringConstant.namePicker: StringConstant.episode4,
      StringConstant.duration: StringConstant.episodeDuration4
    },
    {
      StringConstant.episodes: AssetsConstant.episodeImg(5),
      StringConstant.namePicker: StringConstant.episode5,
      StringConstant.duration: StringConstant.episodeDuration5
    },
  ];

  onTapLanguage(int i) {
    selectedLanguage.value = i;
    update();
  }

  onTapDownloadOption(int i) {
    selectedDownloadOption.value = i;
    update();
  }

  onTapSubtitle(String text) {
    selectedSubtitle.value = text;
    update();
  }

  onTapVideoQuality(String text) {
    selectedVideoQuality.value = text;
    update();
  }

  onTapVideoSpeed(String text) {
    selectedVideoSpeed.value = text;
    update();
  }

  List videoQualityList = [
    {
      StringConstant.namePicker: StringConstant.auto,
      StringConstant.videoQuality: StringConstant.recommended
    },
    {
      StringConstant.namePicker: StringConstant.fullHD,
      StringConstant.videoQuality: StringConstant.quality1080
    },
    {
      StringConstant.namePicker: StringConstant.high,
      StringConstant.videoQuality: StringConstant.quality720
    },
    {
      StringConstant.namePicker: StringConstant.medium,
      StringConstant.videoQuality: StringConstant.quality480
    },
  ];

  List speedList = [
    {
      StringConstant.namePicker: StringConstant.slowest,
      StringConstant.speed: StringConstant.point5x
    },
    {
      StringConstant.namePicker: StringConstant.slow,
      StringConstant.speed: StringConstant.point75x
    },
    {
      StringConstant.namePicker: StringConstant.normal,
      StringConstant.speed: StringConstant.point1x
    },
    {
      StringConstant.namePicker: StringConstant.fast,
      StringConstant.speed: StringConstant.point1point25x
    },
    {
      StringConstant.namePicker: StringConstant.fastest,
      StringConstant.speed: StringConstant.point1point5x
    },
  ];

  RxInt selectMobileCast = SizeConstant.appSizeMinus1.toInt().obs;

  onTapCastMobile(int i) {
    selectMobileCast.value = i;
    update();
  }

  List castMobileList = [
    StringConstant.oppoMobile,
    StringConstant.iphoneMobile,
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(
        initialIndex: selectedTabIndex.value,
        length: tabEpisodeList.length,
        vsync: this);
  }
}
