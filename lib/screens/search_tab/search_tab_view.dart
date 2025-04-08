import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/screens/bottom_bar/bottom_bar.dart';
import 'package:prime_video_flutter_ui_kit/screens/search_tab/search_tab.dart';
import 'package:prime_video_flutter_ui_kit/utils/size_config.dart';
import 'package:prime_video_flutter_ui_kit/utils/utilities.dart';
import 'package:prime_video_flutter_ui_kit/widgets/textfield.dart';

class SearchTabView extends StatelessWidget {
  const SearchTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: _appBar(context),
        body: _mainBody(context),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    SearchTabController searchTabController = Get.put(SearchTabController());
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: SizeConstant.appSize52 + SizeConstant.appSize18,
      title: Padding(
        padding: horizontalPadding().copyWith(top: SizeConstant.appSize18),
        child: PrimeTextField(
          controller: searchTabController.searchController,
          focusNode: searchTabController.searchNode,
          isRounded: true,
          fillColor: ColorConstant.whiteColor,
          filled: true,
          onChanged: (txt) => searchTabController.searchTextValue.value = txt,
          prefix: GestureDetector(
            onTap: () {
              searchTabController.searchList.value = <String>[
                StringConstant.searchMovie1,
                StringConstant.searchMovie2,
                StringConstant.searchMovie3,
              ];
              if (searchTabController.searchTextValue.value.isEmpty) {
                BottomBarController bottomBarController =
                    Get.put(BottomBarController());
                bottomBarController.selectedIndex.value =
                    SizeConstant.appSize0.toInt();
                bottomBarController.pageController!
                    .jumpToPage(SizeConstant.appSize0.toInt());
              } else {
                searchTabController.searchTextValue.value = "";
                searchTabController.searchController.clear();
                searchTabController.searchNode.unfocus();
              }
            },
            child: Image.asset(
              AssetsConstant.backIcon,
              scale: SizeConstant.appSize5,
            ),
          ),
          suffix: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  height: PrimeSizeConfig.displayHeight(context) *
                      SizeConstant.opacity0point05,
                  width: SizeConstant.appSize1,
                  color: ColorConstant.backgroundColor),
              const SizedBox(width: SizeConstant.appSize8),
              GestureDetector(
                onTap: () {
                  searchTabController.searchTextValue.value = "";
                  searchTabController.searchController.clear();
                  searchTabController.searchNode.unfocus();
                  searchTabController.searchList.value = <String>[
                    StringConstant.searchMovie1,
                    StringConstant.searchMovie2,
                    StringConstant.searchMovie3,
                  ];
                },
                child: searchTabController.searchTextValue.value.isEmpty
                    ? Center(
                        child: Image.asset(AssetsConstant.micIcon,
                            scale: SizeConstant.appSize4),
                      )
                    : Center(
                        child: Image.asset(AssetsConstant.closeSearchIcon,
                            scale: SizeConstant.appSize4),
                      ),
              )
            ],
          ),
          hintText: StringConstant.searchHintTxt,
          style: StyleConstants.description2.copyWith(
              fontWeight: FontWeight.w400,
              color: ColorConstant.backgroundColor),
        ),
      ),
    );
  }

  Widget _mainBody(BuildContext context) {
    SearchTabController searchTabController = Get.put(SearchTabController());
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (item, result) {
        BottomBarController bottomBarController =
            Get.put(BottomBarController());
        bottomBarController.selectedIndex.value = SizeConstant.appSize0.toInt();
        bottomBarController.pageController!
            .jumpToPage(SizeConstant.appSize0.toInt());
      },
      child: Stack(
        children: [
          SingleChildScrollView(
              padding: horizontalPadding(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: SizeConstant.appSize22),
                  if (searchTabController.searchTextValue.value.isEmpty) ...[
                    Text(
                      StringConstant.todayTopSearches,
                      style: StyleConstants.description2.copyWith(
                          fontWeight: FontWeight.w600,
                          color: ColorConstant.fontColorOpacity100),
                    ),
                    GridView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: SizeConstant.appSize3.toInt(),
                          mainAxisSpacing: SizeConstant.appSize10,
                          crossAxisSpacing: SizeConstant.appSize10,
                          mainAxisExtent: SizeConstant.appSize150),
                      children: List.generate(
                          searchTabController.topSearchList.length, (i) {
                        var item = searchTabController.topSearchList[i];
                        return Image.asset(
                          item,
                          fit: BoxFit.fitWidth,
                        );
                      }, growable: true),
                    ),
                  ] else ...[
                    Text(
                      StringConstant.topSearches,
                      style: StyleConstants.description2.copyWith(
                          fontWeight: FontWeight.w600,
                          color: ColorConstant.fontColorOpacity100),
                    ),
                    const SizedBox(height: SizeConstant.appSize26),
                    SizedBox(
                      height: SizeConstant.appSize25,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          Text(
                            StringConstant.filterBy,
                            style: StyleConstants.commonStyle.copyWith(
                                fontWeight: FontWeight.w500,
                                color: ColorConstant.fontColorOpacity60),
                          ),
                          TabBar(
                              isScrollable: true,
                              indicatorSize: TabBarIndicatorSize.tab,
                              tabAlignment: TabAlignment.start,
                              controller: searchTabController.tabController,
                              tabs: List.generate(
                                  searchTabController.tabList.length,
                                  (i) => Tab(
                                        text: searchTabController.tabList[i],
                                      )))
                        ],
                      ),
                    ),
                    const SizedBox(height: SizeConstant.appSize10),
                    GridView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: SizeConstant.appSize3.toInt(),
                          mainAxisSpacing: SizeConstant.appSize10,
                          crossAxisSpacing: SizeConstant.appSize10,
                          mainAxisExtent: SizeConstant.appSize150),
                      children: List.generate(
                          searchTabController.movieList.length, (i) {
                        var item = searchTabController.movieList[i];
                        return Image.asset(
                          item,
                          fit: BoxFit.fitWidth,
                        );
                      }, growable: true),
                    ),
                  ]
                ],
              )),
          if (searchTabController.searchTextValue.isNotEmpty) ...[
            StackWidget(searchTabController: searchTabController)
          ]
        ],
      ),
    );
  }
}

class StackWidget extends StatelessWidget {
  const StackWidget({
    super.key,
    required this.searchTabController,
  });

  final SearchTabController searchTabController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        margin: const EdgeInsets.symmetric(
            horizontal: SizeConstant.appSize16,
            vertical: SizeConstant.appSize10),
        padding: const EdgeInsets.all(SizeConstant.appSize16),
        duration: Duration(milliseconds: SizeConstant.appSize400.toInt()),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConstant.appSize10),
            color: ColorConstant.bottomBarBgColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          //  shrinkWrap: true,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  StringConstant.recentSearches,
                  style: StyleConstants.commonStyle
                      .copyWith(color: ColorConstant.fontColorOpacity100),
                ),
                GestureDetector(
                  onTap: () => searchTabController.clearAllOnTaped(),
                  child: Text(
                    StringConstant.clearAll,
                    style: StyleConstants.commonStyle
                        .copyWith(color: ColorConstant.fontColorOpacity100),
                  ),
                )
              ],
            ),
            if (searchTabController.searchList.isNotEmpty) ...[
              const SizedBox(height: SizeConstant.appSize14),
            ],
            ListView.separated(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      minTileHeight: SizeConstant.appSize40,
                      title: Text(
                        searchTabController.searchList[index],
                        style: StyleConstants.commonStyle.copyWith(
                            color: ColorConstant.fontColorOpacity60,
                            fontWeight: FontWeight.w400),
                      ),
                      trailing: GestureDetector(
                        onTap: () => searchTabController.onCloseTaped(index),
                        child: Image.asset(
                          AssetsConstant.closeIcon,
                          scale: SizeConstant.appSize6,
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: searchTabController.searchList.length)
          ],
        ),
      ),
    );
  }
}
