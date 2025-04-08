import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/screens/home/home_screens/movie_details/movie_details.dart';
import 'package:prime_video_flutter_ui_kit/utils/size_config.dart';
import 'package:prime_video_flutter_ui_kit/utils/utilities.dart';
import 'package:prime_video_flutter_ui_kit/widgets/widgets.dart';
import 'package:share_plus/share_plus.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView(
      {super.key,
      required this.videoImg,
      required this.movieName,
      this.episodeShowing = false,
      required this.movieDetails});
  final String videoImg;
  final String movieName;
  final String movieDetails;
  final bool episodeShowing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainBody(context),
    );
  }

  Widget _mainBody(BuildContext context) {
    MovieDetailsController movieDetailsController =
        Get.put(MovieDetailsController());
    RxBool subscribeShowing = false.obs;
    RxBool watchBtnShowing = false.obs;
    return SafeArea(
      top: true,
      child: Obx(
        () => ListView(
          shrinkWrap: true,
          children: [
            VideoView(
                key: ValueKey(movieDetailsController.videoPlayerShowing.value),
                videoImg: videoImg,
                url:
                    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
                isShowing: movieDetailsController.videoPlayerShowing.value,
                subscriberShowing: subscribeShowing.value
                //   movieName == StringConstant.cwMovieName2Name ? true : false,
                ),
            const SizedBox(height: SizeConstant.appSize18),
            Padding(
              padding: horizontalPadding(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieName,
                    style: StyleConstants.description1
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  if (movieName == StringConstant.movieName1) ...[
                    const MovieDetailWidget(),
                  ] else if (movieName == StringConstant.cwMovieName1) ...[
                    const MovieDetail2Widget()
                  ] else if (movieName ==
                      StringConstant.downloadMovieName4) ...[
                    const MovieDetail3Widget()
                  ] else if (movieName == StringConstant.cwMovieName2) ...[
                    const MovieDetail4Widget()
                  ],
                  if (watchBtnShowing.isFalse) ...[
                    const SizedBox(height: SizeConstant.appSize26),
                    PrimeElevatedButton(
                      onPressed: () {
                        if (movieName == StringConstant.cwMovieName2Name) {
                          subscribeShowing.value = true;
                        }
                        if (movieName != StringConstant.cwMovieName2 &&
                            movieName != StringConstant.cwMovieName2Name) {
                          movieDetailsController.videoPlayerShowing.toggle();
                        }
                        watchBtnShowing.toggle();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.play_arrow_rounded,
                            size: SizeConstant.appSize30,
                            color: ColorConstant.fontColorOpacity100,
                          ),
                          Text(
                            StringConstant.watch,
                            style: StyleConstants.button.copyWith(
                              color: ColorConstant.fontColorOpacity100,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                  const SizedBox(height: SizeConstant.appSize20),
                  AnimatedContainer(
                    duration:
                        Duration(milliseconds: SizeConstant.appSize400.toInt()),
                    width: PrimeSizeConfig.displayWidth(context),
                    padding: const EdgeInsets.all(SizeConstant.appSize12),
                    decoration: BoxDecoration(
                        color: ColorConstant.cardBgColor,
                        borderRadius:
                            BorderRadius.circular(SizeConstant.appSize10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            movieAllDetailsDialog(
                                context, StringConstant.movieName1);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SingleChildScrollView(
                                child: Text(
                                  movieDetails,
                                  maxLines: SizeConstant.appSize4.toInt(),
                                  overflow: TextOverflow.ellipsis,
                                  style: StyleConstants.commonStyle.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: ColorConstant.fontColorOpacity100),
                                ),
                              ),
                              Text(
                                StringConstant.seeMoreTxt,
                                overflow: TextOverflow.ellipsis,
                                style: StyleConstants.commonStyle.copyWith(
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.underline,
                                    color: ColorConstant.primaryColor),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: SizeConstant.appSize10),
                        const Divider(),
                        const SizedBox(height: SizeConstant.appSize10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            customIcon(
                                icon: movieDetailsController.watchListAdd.value
                                    ? AssetsConstant.checkboxWithoutBgIcon
                                    : AssetsConstant.addDeIcon,
                                title: StringConstant.watchList,
                                scaleChange:
                                    movieDetailsController.watchListAdd.value,
                                onTap: () {
                                  movieDetailsController.watchListAdd.toggle();

                                  if (movieDetailsController
                                          .watchListAdd.value ==
                                      true) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        primeSnackBar(
                                            msg: StringConstant
                                                .successAddedToWatchlist));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        primeSnackBar(
                                            msg: StringConstant
                                                .removeAddedToWatchlist));
                                  }
                                }),
                            customIcon(
                                onTap: () {
                                  Share.share(
                                      'check out my App https://example.com');
                                },
                                icon: AssetsConstant.shareIcon,
                                title: StringConstant.share),
                            customIcon(
                                onTap: () {
                                  if (movieDetailsController
                                          .downloadStatus.value ==
                                      SizeConstant.appSize0.toInt()) {
                                    movieDetailsController.selectedLanguage
                                        .value = SizeConstant.appSize0.toInt();
                                    downloadDialog(context);
                                  } else if (movieDetailsController
                                          .downloadStatus.value ==
                                      SizeConstant.appSize1.toInt()) {
                                    movieDetailsController
                                        .downloadStatus.value++;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        primeSnackBar(
                                            msg: StringConstant
                                                .videoSuccessfullyDownloaded));
                                  } else {
                                    movieDetailsController.downloadStatus
                                        .value = SizeConstant.appSize0.toInt();
                                  }
                                },
                                colorChange:
                                    movieDetailsController.downloadStatus.value,
                                icon: movieDetailsController
                                            .downloadStatus.value ==
                                        SizeConstant.appSize2.toInt()
                                    ? AssetsConstant.checkboxWithoutBgIcon
                                    : movieDetailsController
                                                .downloadStatus.value ==
                                            SizeConstant.appSize1.toInt()
                                        ? AssetsConstant.pauseIcon
                                        : AssetsConstant.downloadIcon,
                                title: movieDetailsController
                                            .downloadStatus.value ==
                                        SizeConstant.appSize2.toInt()
                                    ? StringConstant.downloaded
                                    : movieDetailsController
                                                .downloadStatus.value ==
                                            SizeConstant.appSize1.toInt()
                                        ? StringConstant.downloading
                                        : StringConstant.download),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: SizeConstant.appSize10),
                  const Divider(),
                  const SizedBox(height: SizeConstant.appSize10),
                  if (episodeShowing == true) ...[
                    const TitleTileWidget(
                      title: StringConstant.episodes,
                      buttonShowing: false,
                      padding: EdgeInsets.zero,
                    ),
                    const SizedBox(height: SizeConstant.appSize10),
                    SizedBox(
                      height: SizeConstant.appSize34,
                      child: TabBar(
                          tabAlignment: TabAlignment.start,
                          controller: movieDetailsController.tabController,
                          isScrollable: true,
                          onTap: (value) =>
                              movieDetailsController.bottomTabTaped(value),
                          tabs: List.generate(
                              movieDetailsController.tabEpisodeList.length,
                              (i) => Tab(
                                    text: movieDetailsController
                                        .tabEpisodeList[i],
                                  )).toList()),
                    ),
                    const SizedBox(height: SizeConstant.appSize20),
                    SizedBox(
                      height: PrimeSizeConfig.displayHeight(context) >
                              SizeConstant.appSize750
                          ? SizeConstant.appSize200
                          : SizeConstant.appSize176,
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            var item =
                                movieDetailsController.episodeList[index];
                            return SizedBox(
                              width: PrimeSizeConfig.displayWidth(context) *
                                  SizeConstant.opacity0point6,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(item[StringConstant.episodes]),
                                  const SizedBox(height: SizeConstant.appSize4),
                                  Text(
                                    item[StringConstant.namePicker],
                                    maxLines: SizeConstant.appSize1.toInt(),
                                    style: StyleConstants.description2.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color:
                                            ColorConstant.fontColorOpacity100),
                                  ),
                                  Text(
                                    item[StringConstant.duration],
                                    style: StyleConstants.commonStyle.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color:
                                            ColorConstant.fontColorOpacity60),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                width: SizeConstant.appSize18,
                              ),
                          itemCount: movieDetailsController.episodeList.length),
                    ),
                    const SizedBox(height: SizeConstant.appSize10),
                  ],
                  const TitleTileWidget(
                    title: StringConstant.moreLikeThis,
                    buttonShowing: false,
                    padding: EdgeInsets.zero,
                  ),
                  const SizedBox(height: SizeConstant.appSize10),
                  _moreLikeWidget(context)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget customIcon(
      {required String icon,
      required String title,
      void Function()? onTap,
      bool scaleChange = false,
      int? colorChange}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(icon,
              scale: scaleChange
                  ? SizeConstant.opacity3point36
                  : SizeConstant.appSize4,
              height: colorChange != null &&
                      colorChange == SizeConstant.appSize1.toInt()
                  ? SizeConstant.appSize20
                  : null,
              width: colorChange != null &&
                      colorChange == SizeConstant.appSize1.toInt()
                  ? SizeConstant.appSize45
                  : null,
              color: colorChange != null &&
                      colorChange == SizeConstant.appSize2.toInt()
                  ? ColorConstant.greenColor
                  : null,
              fit: colorChange != null &&
                      colorChange == SizeConstant.appSize1.toInt()
                  ? BoxFit.cover
                  : null),
          const SizedBox(height: SizeConstant.appSize8),
          Text(
            title,
            style: StyleConstants.commonStyle.copyWith(
                fontWeight: FontWeight.w400,
                color: ColorConstant.fontColorOpacity100),
          ),
        ],
      ),
    );
  }

  Widget _moreLikeWidget(BuildContext context) {
    MovieDetailsController movieDetailsController =
        Get.put(MovieDetailsController());
    return GridView(
      shrinkWrap: true,
      padding: const EdgeInsets.only(
          bottom: SizeConstant.appSize20, top: SizeConstant.appSize8),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: SizeConstant.appSize2.toInt(),
          mainAxisSpacing: SizeConstant.appSize20,
          crossAxisSpacing: SizeConstant.appSize20,
          mainAxisExtent: SizeConstant.appSize234),
      children: List.generate(movieDetailsController.moreLikeList.length, (i) {
        var item = movieDetailsController.moreLikeList[i];
        return Image.asset(
          item,
          fit: BoxFit.fitWidth,
        );
      }),
    );
  }
}

class MovieDetailWidget extends StatelessWidget {
  const MovieDetailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
        text: StringConstant.movieEpisode1,
        style: StyleConstants.commonStyle.copyWith(
            fontWeight: FontWeight.w400,
            color: ColorConstant.fontColorOpacity50),
        children: [
          TextSpan(
              text: "  \u2022  ",
              style: StyleConstants.commonStyle
                  .copyWith(color: ColorConstant.primaryColor)),
          TextSpan(
            text: StringConstant.movieDate1,
            style: StyleConstants.commonStyle.copyWith(
                fontWeight: FontWeight.w400,
                color: ColorConstant.fontColorOpacity50),
          ),
          TextSpan(
              text: "  \u2022  ",
              style: StyleConstants.commonStyle
                  .copyWith(color: ColorConstant.primaryColor)),
          TextSpan(
            text: StringConstant.movieAge1,
            style: StyleConstants.commonStyle.copyWith(
                fontWeight: FontWeight.w400,
                color: ColorConstant.fontColorOpacity50),
          ),
        ]));
  }
}

class MovieDetail2Widget extends StatelessWidget {
  const MovieDetail2Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
        text: StringConstant.twoHoursSixMin,
        style: StyleConstants.commonStyle.copyWith(
            fontWeight: FontWeight.w400,
            color: ColorConstant.fontColorOpacity50),
        children: [
          TextSpan(
              text: "  \u2022  ",
              style: StyleConstants.commonStyle
                  .copyWith(color: ColorConstant.primaryColor)),
          TextSpan(
            text: StringConstant.familyDrama,
            style: StyleConstants.commonStyle.copyWith(
                fontWeight: FontWeight.w400,
                color: ColorConstant.fontColorOpacity50),
          ),
          TextSpan(
              text: "  \u2022  ",
              style: StyleConstants.commonStyle
                  .copyWith(color: ColorConstant.primaryColor)),
          TextSpan(
            text: StringConstant.year2024,
            style: StyleConstants.commonStyle.copyWith(
                fontWeight: FontWeight.w400,
                color: ColorConstant.fontColorOpacity50),
          ),
          TextSpan(
              text: "  \u2022  ",
              style: StyleConstants.commonStyle
                  .copyWith(color: ColorConstant.primaryColor)),
          TextSpan(
            text: StringConstant.movieAge1,
            style: StyleConstants.commonStyle.copyWith(
                fontWeight: FontWeight.w400,
                color: ColorConstant.fontColorOpacity50),
          ),
        ]));
  }
}

class MovieDetail3Widget extends StatelessWidget {
  const MovieDetail3Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
        text: StringConstant.twoHoursSixMin,
        style: StyleConstants.commonStyle.copyWith(
            fontWeight: FontWeight.w400,
            color: ColorConstant.fontColorOpacity50),
        children: [
          TextSpan(
              text: "  \u2022  ",
              style: StyleConstants.commonStyle
                  .copyWith(color: ColorConstant.primaryColor)),
          TextSpan(
            text: StringConstant.comedyDrama,
            style: StyleConstants.commonStyle.copyWith(
                fontWeight: FontWeight.w400,
                color: ColorConstant.fontColorOpacity50),
          ),
          TextSpan(
              text: "  \u2022  ",
              style: StyleConstants.commonStyle
                  .copyWith(color: ColorConstant.primaryColor)),
          TextSpan(
            text: StringConstant.year2023,
            style: StyleConstants.commonStyle.copyWith(
                fontWeight: FontWeight.w400,
                color: ColorConstant.fontColorOpacity50),
          ),
          TextSpan(
              text: "  \u2022  ",
              style: StyleConstants.commonStyle
                  .copyWith(color: ColorConstant.primaryColor)),
          TextSpan(
            text: StringConstant.movieAge1,
            style: StyleConstants.commonStyle.copyWith(
                fontWeight: FontWeight.w400,
                color: ColorConstant.fontColorOpacity50),
          ),
        ]));
  }
}

class MovieDetail4Widget extends StatelessWidget {
  const MovieDetail4Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
        text: StringConstant.oneHrs50min,
        style: StyleConstants.commonStyle.copyWith(
            fontWeight: FontWeight.w400,
            color: ColorConstant.fontColorOpacity50),
        children: [
          TextSpan(
              text: "  \u2022  ",
              style: StyleConstants.commonStyle
                  .copyWith(color: ColorConstant.primaryColor)),
          TextSpan(
            text: StringConstant.fantasyRomance,
            style: StyleConstants.commonStyle.copyWith(
                fontWeight: FontWeight.w400,
                color: ColorConstant.fontColorOpacity50),
          ),
          TextSpan(
              text: "  \u2022  ",
              style: StyleConstants.commonStyle
                  .copyWith(color: ColorConstant.primaryColor)),
          TextSpan(
            text: StringConstant.year2012,
            style: StyleConstants.commonStyle.copyWith(
                fontWeight: FontWeight.w400,
                color: ColorConstant.fontColorOpacity50),
          ),
          TextSpan(
              text: "  \u2022  ",
              style: StyleConstants.commonStyle
                  .copyWith(color: ColorConstant.primaryColor)),
          TextSpan(
            text: StringConstant.movieAge1,
            style: StyleConstants.commonStyle.copyWith(
                fontWeight: FontWeight.w400,
                color: ColorConstant.fontColorOpacity50),
          ),
        ]));
  }
}
