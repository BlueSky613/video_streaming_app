import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/screens/bottom_bar/bottom_bar.dart';
import 'package:prime_video_flutter_ui_kit/screens/home/home.dart';
import 'package:prime_video_flutter_ui_kit/screens/home/home_screens/movie_details/movie_details.dart';
import 'package:prime_video_flutter_ui_kit/utils/size_config.dart';
import 'package:prime_video_flutter_ui_kit/utils/utilities.dart';
import 'package:prime_video_flutter_ui_kit/widgets/title_tile_widget.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:video_player/video_player.dart';

//ignore: must_be_immutable
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainBody(context),
    );
  }

  Widget customAppBar(context) {
    HomeController homeController = Get.put(HomeController());
    return Padding(
      padding: horizontalPadding().copyWith(
          bottom: SizeConstant.appSize10, top: SizeConstant.appSize28),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            AssetsConstant.homeProfileImg,
            scale: SizeConstant.appSize4,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () => Get.to(() => const GoPremiumView()),
                child: Image.asset(
                  AssetsConstant.goPremiumImg,
                  scale: SizeConstant.appSize4,
                ),
              ),
              const SizedBox(width: SizeConstant.appSize14),
              LanguageWidget(homeController: homeController)
            ],
          ),
        ],
      ),
    );
  }

  Widget _mainBody(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Obx(
      () => ListView(
        shrinkWrap: true,
        children: [
          customAppBar(context),
          const SizedBox(height: SizeConstant.appSize10),
          UpperListWidget(homeController: homeController),
          if (homeController.selectedUpperIndex.value ==
              SizeConstant.opacity0.toInt())
            ...forYouWidget(homeController)
          else if (homeController.selectedUpperIndex.value ==
              SizeConstant.appSize1.toInt())
            ...sportsWidget(homeController)
          else
            Container()
        ],
      ),
    );
  }
}

List<Widget> sportsWidget(HomeController homeController) {
  return [
    const SizedBox(height: SizeConstant.appSize28),
    SizedBox(
      height: SizeConstant.appSize155,
      child: ListView.separated(
          padding: horizontalPadding(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return SizedBox(
              width: PrimeSizeConfig.displayWidth(context) *
                  SizeConstant.opacity0point85,
              child: Image.asset(homeController.sportsPageViewList[i]),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: SizeConstant.appSize19,
              ),
          itemCount: homeController.sportsPageViewList.length),
    ),
    const SizedBox(height: SizeConstant.appSize26),
    Padding(
      padding: horizontalPadding(),
      child: SizedBox(
        height: SizeConstant.appSize37,
        child: TabBar(
            tabAlignment: TabAlignment.start,
            controller: homeController.sportsTabController,
            isScrollable: true,
            onTap: (value) => homeController.onTapSportsTab(value),
            tabs: List.generate(
                homeController.sportsTabList.length,
                (i) => Tab(
                      text: homeController.sportsTabList[i],
                    )).toList()),
      ),
    ),
    const SizedBox(height: SizeConstant.appSize20),
    TitleTileWidget(title: StringConstant.trendingInSports, onTapButton: () {}),
    const SizedBox(height: SizeConstant.appSize10),
    SizedBox(
      height: SizeConstant.appSize220,
      child: ListView.separated(
          padding: horizontalPadding(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return Image.asset(homeController.sportsTrendingList[i]);
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: SizeConstant.appSize19,
              ),
          itemCount: homeController.sportsTrendingList.length),
    ),
    const SizedBox(height: SizeConstant.appSize26),
    const TitleTileWidget(
        title: StringConstant.tournaments, buttonShowing: false),
    const SizedBox(height: SizeConstant.appSize10),
    SizedBox(
      height: SizeConstant.appSize220,
      child: ListView.separated(
          padding: horizontalPadding(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return Image.asset(homeController.sportsTournamentList[i]);
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: SizeConstant.appSize19,
              ),
          itemCount: homeController.sportsTournamentList.length),
    ),
    const SizedBox(height: SizeConstant.appSize26),
    const TitleTileWidget(
      title: StringConstant.newAndUpcoming,
      buttonShowing: false,
    ),
    const SizedBox(height: SizeConstant.appSize10),
    SizedBox(
      height: SizeConstant.appSize150,
      child: ListView.separated(
          padding: horizontalPadding(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return Image.asset(homeController.sportsUpcomingList[i]);
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: SizeConstant.appSize19,
              ),
          itemCount: homeController.sportsUpcomingList.length),
    ),
  ];
}

List<Widget> forYouWidget(HomeController homeController) {
  return [
    const SizedBox(height: SizeConstant.appSize28),
    PageViewWidget(homeController: homeController),
    const SizedBox(height: SizeConstant.appSize28),
    TitleTileWidget(
      title:
          TranslationController.to.translate(StringConstant.continueWatching),
      onTapButton: () => Get.to(() => const ContinueWatchingView()),
    ),
    const SizedBox(height: SizeConstant.appSize8),
    ContinueWatchingWidget(homeController: homeController),
    const SizedBox(height: SizeConstant.appSize16),
    TitleTileWidget(
      title:
          TranslationController.to.translate(StringConstant.trendingInSports),
      onTapButton: () => Get.to(() => const TrendingSportsView()),
    ),
    const SizedBox(height: SizeConstant.appSize8),
    TrendingSportListWidget(homeController: homeController),
    const SizedBox(height: SizeConstant.appSize26),
    TitleTileWidget(
      title:
          TranslationController.to.translate(StringConstant.trendingRightNow),
      onTapButton: () => Get.to(() => const TrendingNowView()),
    ),
    const SizedBox(height: SizeConstant.appSize8),
    TrendingRightNowWidget(homeController: homeController),
    const SizedBox(height: SizeConstant.appSize26),
    // TitleTileWidget(
    //   title: TranslationController.to.translate(StringConstant.hotRightNow),
    //   icon: Image.asset(
    //     AssetsConstant.premiumIcon,
    //     scale: SizeConstant.opacity4point5,
    //   ),
    //   onTapButton: () => Get.to(() => const HotRightNowView()),
    // ),
    // const SizedBox(height: SizeConstant.appSize8),
    // HotRightWidget(homeController: homeController),
    // const SizedBox(height: SizeConstant.appSize26),
    TitleTileWidget(
      title: TranslationController.to
          .translate(StringConstant.watchInYourLanguage),
      buttonShowing: false,
    ),
    const SizedBox(height: SizeConstant.appSize8),
    Padding(
      padding: horizontalPadding(),
      child: SizedBox(
        height: SizeConstant.appSize34,
        child: TabBar(
            tabAlignment: TabAlignment.start,
            controller: homeController.tabController,
            isScrollable: true,
            onTap: (value) => homeController.bottomTabTaped(value),
            tabs: List.generate(
                homeController.tabList.length,
                (i) => Tab(
                      text: homeController.tabList[i],
                    )).toList()),
      ),
    ),
    const SizedBox(height: SizeConstant.appSize10),
    HindiListWidget(homeController: homeController)
  ];
}

class HindiListWidget extends StatelessWidget {
  const HindiListWidget({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConstant.appSize140,
      child: ListView.separated(
          padding: horizontalPadding(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var item = homeController.hindiList[index];
            return Image.asset(item, fit: BoxFit.fill);
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: SizeConstant.appSize16,
              ),
          itemCount: homeController.hindiList.length),
    );
  }
}

class HotRightWidget extends StatelessWidget {
  const HotRightWidget({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConstant.appSize274,
      child: ListView.separated(
          padding: horizontalPadding(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var item = homeController.hotRightList[index];
            return SizedBox(
                width: PrimeSizeConfig.displayWidth(context) *
                    SizeConstant.opacity0point53,
                child: Image.asset(item, fit: BoxFit.fill));
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: SizeConstant.appSize16,
              ),
          itemCount: homeController.hotRightList.length),
    );
  }
}

class TrendingRightNowWidget extends StatelessWidget {
  const TrendingRightNowWidget({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConstant.appSize140,
      child: ListView.separated(
          padding: horizontalPadding(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var item = homeController.trendingRightNowList[index];
            return SizedBox(
                width: SizeConstant.appSize100,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(SizeConstant.appSize12),
                    child: Image.asset(item, fit: BoxFit.fill)));
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: SizeConstant.appSize12,
              ),
          itemCount: homeController.trendingRightNowList.length),
    );
  }
}

class TrendingSportListWidget extends StatelessWidget {
  const TrendingSportListWidget({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConstant.appSize140,
      child: ListView.separated(
          padding: horizontalPadding(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            var item = homeController.trendingSportList[i];
            return SizedBox(
                width: SizeConstant.appSize100,
                child: Image.asset(
                  item,
                  fit: BoxFit.fill,
                ));
          },
          separatorBuilder: (context, index) =>
              const SizedBox(width: SizeConstant.appSize12),
          itemCount: homeController.trendingSportList.length),
    );
  }
}

class ContinueWatchingWidget extends StatelessWidget {
  const ContinueWatchingWidget({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: PrimeSizeConfig.displayHeight(context) > 900
          ? SizeConstant.appSize240
          : PrimeSizeConfig.displayHeight(context) > SizeConstant.appSize750
          ? SizeConstant.appSize225
          : SizeConstant.appSize210,
      child: Obx(
            () => ListView.separated(
          padding: horizontalPadding(),
          separatorBuilder: (context, index) => const SizedBox(
            width: SizeConstant.appSize16,
          ),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: homeController.continueWatchList.length,
          itemBuilder: (context, i) {
            var item = homeController.continueWatchList[i];
            return GestureDetector(
              onTap: () {
                if (i != SizeConstant.appSize2.toInt()) {
                  Get.to(() => MovieDetailsView(
                    videoImg: item.icon,
                    movieName: i == SizeConstant.appSize1.toInt()
                        ? StringConstant.cwMovieName2Name
                        : item.movieName,
                    movieDetails: i == SizeConstant.appSize0.toInt()
                        ? StringConstant.cWatchingMovieDetails1
                        : StringConstant.cwMovieDetails2,
                  ));
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(SizeConstant.appSize12),
                    child: AnimatedContainer(
                      duration: Duration(
                          milliseconds: SizeConstant.appSize400.toInt()),
                      width: PrimeSizeConfig.displayWidth(context) *
                          SizeConstant.opacity0point7,
                      height: PrimeSizeConfig.displayHeight(context) *
                          SizeConstant.opacity0point2,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill, image: AssetImage(item.icon))),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                ColorConstant.cwGradient1,
                                ColorConstant.cwGradient1,
                                ColorConstant.cwGradient2
                              ]),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.all(SizeConstant.appSize10),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  (item.subscription.isNotEmpty)
                                      ? Image.asset(
                                    AssetsConstant.premiumIcon,
                                    scale: SizeConstant.appSize4,
                                  )
                                      : const SizedBox(),
                                  GestureDetector(
                                    onTap: () =>
                                        continueWatchingDialog(context, item),
                                    child: Image.asset(
                                      AssetsConstant.menuIcon,
                                      scale: SizeConstant.appSize4,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.all(SizeConstant.appSize10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    AssetsConstant.playIcon,
                                    scale: SizeConstant.appSize4,
                                  ),
                                  Slider(
                                      thumbColor: Colors.white,
                                      value: double.parse(item.sliderValue),
                                      onChanged: (value) {},
                                      min: SizeConstant.opacity0,
                                      max: SizeConstant.appSize100)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: SizeConstant.appSize8),
                  Text(
                    item.movieName,
                    style: StyleConstants.description2.copyWith(
                        fontWeight: FontWeight.w600,
                        color: ColorConstant.fontColorOpacity100),
                  ),
                  Text(
                    item.movieDescription,
                    style: StyleConstants.commonStyle.copyWith(
                        color: ColorConstant.fontColorOpacity100,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Obx(() {
        if (!homeController.isInitialized.value) {
          return Center(child: CircularProgressIndicator());
        }
        return PageView.builder(
          controller: homeController.pageController,
          itemCount: homeController.pageList.length,
          onPageChanged: (index) {
            homeController.playVideo(index);
          },
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(13),
                      child: VideoPlayer(
                        homeController.videoControllers[index],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }),
    );
  }
}

class UpperListWidget extends StatelessWidget {
  const UpperListWidget({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConstant.appSize34,
      child: ListView.separated(
        padding: horizontalPadding(),
        separatorBuilder: (context, index) =>
            const SizedBox(width: SizeConstant.appSize8),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: homeController.upperList.length,
        itemBuilder: (context, i) {
          var item = homeController.upperList[i];
          return Obx(
            () => GestureDetector(
              onTap: () => homeController.upperListOnTaped(i),
              child: AnimatedContainer(
                duration:
                    Duration(milliseconds: SizeConstant.appSize400.toInt()),
                padding: const EdgeInsets.symmetric(
                    horizontal: SizeConstant.appSize10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: homeController.selectedUpperIndex.value == i
                        ? ColorConstant.chipBGColor
                        : null,
                    borderRadius:
                        BorderRadius.circular(SizeConstant.appSize40)),
                child: Text(
                  TranslationController.to.translate(item),
                  style: StyleConstants.description2.copyWith(
                      fontWeight: FontWeight.w500,
                      color: ColorConstant.fontColorOpacity100),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    TranslationController translationController =
        Get.put(TranslationController());
    return Obx(
      () => GestureDetector(
        onTap: () => homeController.languageOnTaped(),
        child: SuperTooltip(
          barrierColor: Colors.transparent,
          elevation: SizeConstant.appSize8,
          hideTooltipOnTap: false,
          touchThroughAreaShape: ClipAreaShape.rectangle,
          controller: homeController.controller,
          content: AnimatedContainer(
              duration: Duration(milliseconds: SizeConstant.appSize400.toInt()),
              height: SizeConstant.appSize100,
              width: PrimeSizeConfig.displayWidth(context) *
                  SizeConstant.opacity0point65,
              child: GridView(
                padding: const EdgeInsets.all(SizeConstant.appSize12),
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: SizeConstant.appSize5,
                    crossAxisSpacing: SizeConstant.appSize5,
                    mainAxisExtent: SizeConstant.appSize90,
                    crossAxisCount: SizeConstant.appSize3.toInt()),
                shrinkWrap: true,
                children:
                    List.generate(homeController.languageList.length, (index) {
                  var item = homeController.languageList[index];
                  return GestureDetector(
                    onTap: () async {
                      homeController.selectedLanguageIndex.value = index;
                      translationController.changeLanguage(
                          translationController.languages[index]);
                      await homeController.controller.hideTooltip();
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        homeController.selectedLanguageIndex.value == index
                            ? const Icon(
                                Icons.check,
                                color: ColorConstant.fontColorOpacity100,
                                size: SizeConstant.appSize18,
                              )
                            : const SizedBox(width: SizeConstant.appSize18),
                        const SizedBox(
                          width: SizeConstant.appSize5,
                        ),
                        Text(
                          item,
                          style: StyleConstants.commonStyle.copyWith(
                              color:
                                  homeController.selectedLanguageIndex.value ==
                                          index
                                      ? ColorConstant.fontColorOpacity100
                                      : ColorConstant.fontColorOpacity60),
                        ),
                      ],
                    ),
                  );
                }),
              )),
          child: Row(
            children: [
              Text(
                translationController.languageShortCodes[
                    homeController.selectedLanguageIndex.value],
              ),
              const SizedBox(
                width: SizeConstant.appSize5,
              ),
              RotatedBox(
                quarterTurns: homeController.isShowing.value == true
                    ? SizeConstant.appSize10.toInt()
                    : SizeConstant.appSize0.toInt(),
                child: Image.asset(
                  AssetsConstant.dropDownIcon,
                  scale: SizeConstant.appSize4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
