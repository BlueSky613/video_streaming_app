import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';

class SearchTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxString searchTextValue = "".obs;
  TextEditingController searchController = TextEditingController();
  FocusNode searchNode = FocusNode();

  TabController? tabController;

  List movieList = [
    AssetsConstant.movieSearchImg(1),
    AssetsConstant.movieSearchImg(2),
    AssetsConstant.movieSearchImg(3),
    AssetsConstant.movieSearchImg(4),
    AssetsConstant.movieSearchImg(5),
    AssetsConstant.movieSearchImg(6),
    AssetsConstant.movieSearchImg(7),
    AssetsConstant.movieSearchImg(8),
    AssetsConstant.movieSearchImg(9),
    AssetsConstant.movieSearchImg(10),
  ];

  List topSearchList = [
    AssetsConstant.movieTopSearchImg(1),
    AssetsConstant.movieTopSearchImg(2),
    AssetsConstant.movieTopSearchImg(3),
    AssetsConstant.movieTopSearchImg(4),
    AssetsConstant.movieTopSearchImg(5),
    AssetsConstant.movieTopSearchImg(6),
    AssetsConstant.movieTopSearchImg(7),
    AssetsConstant.movieTopSearchImg(8),
    AssetsConstant.movieTopSearchImg(9),
    AssetsConstant.movieTopSearchImg(10),
    AssetsConstant.movieTopSearchImg(11),
    AssetsConstant.movieTopSearchImg(12),
    AssetsConstant.movieTopSearchImg(13),
    AssetsConstant.movieTopSearchImg(14),
    AssetsConstant.movieTopSearchImg(15),
  ];

  RxInt selectedTabIndex = SizeConstant.appSize0.toInt().obs;
  onTapTab(int i) {
    selectedTabIndex.value = i;
    update();
  }

  List tabList = [
    StringConstant.allTxt,
    StringConstant.videosTxt,
    StringConstant.showsTxt,
    StringConstant.moviesTxt,
  ];

  RxInt selectedSearchMovie = SizeConstant.appSize0.toInt().obs;

  RxList<String> searchList = [
    StringConstant.searchMovie1,
    StringConstant.searchMovie2,
    StringConstant.searchMovie3,
  ].obs;

  onCloseTaped(int i) {
    searchList.removeAt(selectedSearchMovie.value);
    update();
  }

  clearAllOnTaped() {
    searchList.clear();
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(
        length: tabList.length,
        vsync: this,
        initialIndex: selectedTabIndex.value);
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
    searchNode.dispose();
  }
}
