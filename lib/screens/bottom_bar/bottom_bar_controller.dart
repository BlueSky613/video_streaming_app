import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/models/models.dart';
import 'package:prime_video_flutter_ui_kit/screens/bottom_bar/bottom_bar.dart';
import 'package:prime_video_flutter_ui_kit/screens/home/home.dart';
import 'package:prime_video_flutter_ui_kit/screens/my_list_tab/my_list_tab.dart';
import 'package:prime_video_flutter_ui_kit/screens/profile_tab/profile_tab.dart';
import 'package:prime_video_flutter_ui_kit/screens/search_tab/search_tab.dart';

class BottomBarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxInt selectedIndex = SizeConstant.appSize0.toInt().obs;

  PageController? pageController;
  TranslationController translationController =
      Get.put(TranslationController());
  List<TabBarModel> bottomList = [];

  selectTaBPressed(int index) {
    selectedIndex.value = index;
    update();
    if (selectedIndex.value != SizeConstant.opacity0.toInt()) {
      HomeController homeController = Get.put(HomeController());
      homeController.continueWatchList.value = [
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
      ];
    } else if (selectedIndex.value != SizeConstant.appSize1.toInt()) {
      SearchTabController searchTabController = Get.put(SearchTabController());
      searchTabController.searchController.clear();
      searchTabController.searchTextValue.value = "";
      searchTabController.searchNode.unfocus();
      searchTabController.selectedTabIndex.value =
          SizeConstant.appSize0.toInt();
      searchTabController.searchList.value = <String>[
        StringConstant.searchMovie1,
        StringConstant.searchMovie2,
        StringConstant.searchMovie3,
      ];
    } else if (selectedIndex.value != SizeConstant.appSize2.toInt()) {
      MyListTabController myListTabController = Get.put(MyListTabController());
      myListTabController.isDeleteShowing.value = false;
      myListTabController.moreLikeList = [
        AssetsConstant.trendingRightNowHImg(1),
        AssetsConstant.trendingRightNowHImg(2),
        AssetsConstant.trendingRightNowHImg(3),
        AssetsConstant.trendingRightNowHImg(4),
        AssetsConstant.trendingRightNowHImg(5),
        AssetsConstant.trendingRightNowHImg(6),
        AssetsConstant.trendingRightNowHImg(7),
        AssetsConstant.trendingRightNowHImg(8),
        AssetsConstant.trendingRightNowHImg(9),
      ].obs;
    }
  }

  @override
  void onInit() {
    super.onInit();
    bottomList = [
      TabBarModel(
          icon: AssetsConstant.homeSlIcon,
          name: StringConstant.homeTxt,
          page: const HomeView()),
      TabBarModel(
          icon: AssetsConstant.searchDeIcon,
          name: StringConstant.searchTxt,
          page: const SearchTabView()),
      TabBarModel(
          icon: AssetsConstant.addDeIcon,
          name: StringConstant.myListTxt,
          page: const MyListTabView()),
      TabBarModel(
          icon: AssetsConstant.userDeIcon,
          name: StringConstant.profileTxt,
          page: const ProfileTabView()),
    ];
    pageController = PageController(initialPage: selectedIndex.value);
  }
}
