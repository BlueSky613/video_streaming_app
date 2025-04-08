import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/extension/extension.dart';
import 'package:prime_video_flutter_ui_kit/models/models.dart';
import 'package:prime_video_flutter_ui_kit/screens/bottom_bar/bottom_bar.dart';
import 'package:prime_video_flutter_ui_kit/screens/login/login_view.dart';
import 'package:prime_video_flutter_ui_kit/widgets/button.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  RxBool isShowing = false.obs;
  final controller = SuperTooltipController();
  List<VideoPlayerController> videoControllers = [];
  RxBool isPlaying = false.obs;
  RxBool isFirstPlay = false.obs;
  TabController? tabController;
  RxBool isInitialized = false.obs;
  Timer? autoSlideTimer;
  PageController? pageController;
  TranslationController translationController =
      Get.put(TranslationController());

  RxInt selectedLanguageIndex = SizeConstant.appSize1.toInt().obs;
  RxInt selectedUpperIndex = SizeConstant.appSize0.toInt().obs;
  RxInt selectedPageIndex = SizeConstant.appSize1.toInt().obs;
  RxInt selectedTabIndex = SizeConstant.appSize0.toInt().obs;

  List languageList = [
    StringConstant.hindi,
    StringConstant.english,
    StringConstant.german,
    StringConstant.chinese,
    StringConstant.french,
    StringConstant.arabic
  ];

  List<String> languageShortCodes = [
    'HI',
    'EN',
    'DE',
    'ZH',
    'FR',
    'AR',
  ];

  List upperList = [
    StringConstant.forYou,
    StringConstant.sports,
    StringConstant.movies,
    StringConstant.live,
    StringConstant.anime,
    StringConstant.comingSoon,
    StringConstant.tvShow,
  ];

  // List pageList = [
  //   AssetsConstant.homePageViewImg(1),
  //   AssetsConstant.homePageViewImg(2),
  //   AssetsConstant.homePageViewImg(3),
  // ];
  List pageList = [
    AssetsConstant.sampleVideo,
    AssetsConstant.sample1Video,
    AssetsConstant.sample2Video,
  ];

  List trendingSportList = [
    AssetsConstant.trSportImg(1),
    AssetsConstant.trSportImg(2),
    AssetsConstant.trSportImg(3),
    AssetsConstant.trSportImg(4),
  ];

  List trendingRightNowList = [
    AssetsConstant.trnImg(1),
    AssetsConstant.trnImg(2),
    AssetsConstant.trnImg(3),
    AssetsConstant.trnImg(4),
  ];

  List hotRightList = [
    AssetsConstant.hotRightImg(1),
    AssetsConstant.hotRightImg(2),
    AssetsConstant.hotRightImg(3),
    AssetsConstant.hotRightImg(4),
    AssetsConstant.hotRightImg(5),
    AssetsConstant.hotRightImg(6),
  ];

  List hindiList = [
    AssetsConstant.hindiImg(1),
    AssetsConstant.hindiImg(2),
    AssetsConstant.hindiImg(3),
    AssetsConstant.hindiImg(4),
    AssetsConstant.hindiImg(5),
  ];

  void initializeAllVideos() {
    for (var videoPath in pageList) {
      videoControllers.add(
        VideoPlayerController.asset(videoPath)
          ..initialize().then((_) {
            videoControllers.last.setVolume(0.0);
            if (videoControllers
                .every((controller) => controller.value.isInitialized)) {
              isInitialized.value = true;
              videoControllers[1].play();
              videoControllers[1].setVolume(0.0);
            }
          }),
      );
    }
  }

  void playVideo(int index) {
    for (int i = 0; i < videoControllers.length; i++) {
      if (i == index) {
        videoControllers[i].play();
        videoControllers[i].setLooping(true);
        videoControllers[i].setVolume(0.0);
      } else {
        videoControllers[i].pause();
      }
    }
    selectedPageIndex.value = index;
  }

  void showDialogAfterDelay() {
    Future.delayed(Duration(seconds: 30), () {
      showDialog(
        context: Get.context as BuildContext,
        builder: (context) {
          return AlertDialog(
            title: Text('Time\'s Up!'),
            content: Text('30 seconds have passed since the video started.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    });
  }

  @override
  void dispose() {
    for (var controller in videoControllers) {
      controller.dispose();
    }
    videoControllers.clear();
    autoSlideTimer?.cancel();
    pageController?.dispose();
    super.dispose();
  }

  RxList<ContinueModel> continueWatchList = [
    ContinueModel(
        movieName: StringConstant.cwMovieName1,
        movieDescription: StringConstant.cwMovieDescription1,
        sliderValue: StringConstant.cwMovieSlider1,
        subscription: StringConstant.cwMovieSubscription1,
        icon: AssetsConstant.continueWatchImg(1)),
    ContinueModel(
        movieName: StringConstant.cwMovieName2,
        movieDescription: StringConstant.cwMovieDescription2,
        sliderValue: StringConstant.cwMovieSlider2,
        subscription: StringConstant.cwMovieSubscription2,
        icon: AssetsConstant.continueWatchImg(2)),
    ContinueModel(
        movieName: StringConstant.cwMovieName3,
        movieDescription: StringConstant.cwMovieDescription3,
        sliderValue: StringConstant.cwMovieSlider3,
        subscription: StringConstant.cwMovieSubscription3,
        icon: AssetsConstant.continueWatchImg(3)),
  ].obs;

  List tabList = [
    StringConstant.hindi,
    StringConstant.english,
    StringConstant.tamil,
    StringConstant.telugu,
    StringConstant.gujarati,
    StringConstant.marathi
  ];

  languageOnTaped() async {
    isShowing.toggle();
    update();
    if (isShowing.value) {
      await controller.showTooltip();
    } else {
      await controller.hideTooltip();
    }
  }

  upperListOnTaped(int i) {
    selectedUpperIndex.value = i;
    update();
  }

  bottomTabTaped(int i) {
    selectedTabIndex.value = i;
    update();
  }

  ///Sports tab data

  TabController? sportsTabController;
  RxInt selectedSportsTab = SizeConstant.appSize0.toInt().obs;

  onTapSportsTab(int i) {
    selectedSportsTab.value = i;
    update();
  }

  List sportsTabList = [
    StringConstant.allSports,
    StringConstant.cricket,
    StringConstant.football,
    StringConstant.otherSports,
    StringConstant.tennis,
    StringConstant.ufc,
    StringConstant.wwe,
  ];
  List sportsPageViewList = [
    AssetsConstant.sportsPageImg(1),
    AssetsConstant.sportsPageImg(2),
  ];

  List sportsTrendingList = [
    AssetsConstant.sportsTournamentImg(1),
    AssetsConstant.sportsTournamentImg(2),
    AssetsConstant.sportsTournamentImg(3),
    AssetsConstant.sportsTournamentImg(4),
    AssetsConstant.sportsTournamentImg(5),
    AssetsConstant.sportsTournamentImg(6),
  ];

  List sportsTournamentList = [
    AssetsConstant.sportsUpcomingImg(1),
    AssetsConstant.sportsUpcomingImg(2),
    AssetsConstant.sportsUpcomingImg(3),
    AssetsConstant.sportsUpcomingImg(4),
    AssetsConstant.sportsUpcomingImg(5),
    AssetsConstant.sportsUpcomingImg(6),
  ];
  List sportsUpcomingList = [
    AssetsConstant.sportsUpcomingTournamentImg(1),
    AssetsConstant.sportsUpcomingTournamentImg(2),
    AssetsConstant.sportsUpcomingTournamentImg(3),
    AssetsConstant.sportsUpcomingTournamentImg(4),
    AssetsConstant.sportsUpcomingTournamentImg(5),
  ];

  @override
  void onInit() {
    super.onInit();
    String? token = translationController.getToken();
    initializeAllVideos();
    pageController = PageController(
        initialPage: selectedPageIndex.value, viewportFraction: .9);
    autoSlideTimer = Timer.periodic(Duration(seconds: 6), (timer) {
      int nextPage = (selectedPageIndex.value + 1) % pageList.length;
      pageController?.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
      playVideo(nextPage);
    });
    tabController = TabController(
        length: tabList.length,
        vsync: this,
        initialIndex: selectedTabIndex.value);
    sportsTabController = TabController(
        length: sportsTabList.length,
        vsync: this,
        initialIndex: selectedSportsTab.value);
    if (token != null && token != "") {
    } else {
      Future.delayed(Duration(seconds: 30), () {
        showDialog(
            context: Get.context as BuildContext,
            builder: (context) => Dialog(
                  backgroundColor: ColorConstant.backgroundColor,
                  child: Container(
                    height: 250,
                    padding: EdgeInsets.only(right: 20, left: 20),
                    margin: EdgeInsets.only(right: 20, left: 20),
                    decoration: BoxDecoration(
                      color: ColorConstant.backgroundColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          StringConstant.loginTxt,
                          style: StyleConstants.heading24Style,
                        ),
                        const SizedBox(height: SizeConstant.appSize15),
                        Text(
                          StringConstant.loginRequired,
                          textAlign: TextAlign.center,
                          style: StyleConstants.description2.copyWith(
                              fontWeight: FontWeight.w400,
                              color: ColorConstant.fontColorOpacity70),
                        ),
                        const SizedBox(height: SizeConstant.appSize38),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: PrimeElevatedButton(
                                elevation: SizeConstant.opacity0,
                                onPressed: () {
                                  pageController?.dispose();
                                  Get.offAll(() => LoginView());
                                },
                                child: Text(
                                  StringConstant.loginTxt.toCapitalize(),
                                  style: StyleConstants.button,
                                ),
                              ),
                            ),
                            const SizedBox(width: SizeConstant.appSize14),
                            Expanded(
                                child: PrimeElevatedButton(
                              elevation: SizeConstant.opacity0,
                              onPressed: () => Get.back(),
                              backgroundColor: ColorConstant.greyButtonColor,
                              child: Text(
                                StringConstant.cancel,
                                style: StyleConstants.button,
                              ),
                            )),
                          ],
                        )
                      ],
                    ),
                  ),
                ));
      });
    }
  }
}
