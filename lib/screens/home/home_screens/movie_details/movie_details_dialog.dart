import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/screens/home/home_screens/movie_details/movie_details.dart';
import 'package:prime_video_flutter_ui_kit/utils/utils.dart';
import 'package:prime_video_flutter_ui_kit/widgets/button.dart';

Future downloadDialog(BuildContext context) async {
  MovieDetailsController movieDetailsController =
      Get.put(MovieDetailsController());
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: SizeConstant.appSize18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: horizontalPadding(),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  StringConstant.additionalAudioLanguage,
                  textAlign: TextAlign.start,
                  style: StyleConstants.description1
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: SizeConstant.appSize10),
            const Divider(),
            const SizedBox(height: SizeConstant.appSize10),
            Padding(
              padding: horizontalPadding(),
              child: Column(
                children: [
                  Text(
                    StringConstant.downloadDetails,
                    style: StyleConstants.commonStyle.copyWith(
                        color: ColorConstant.fontColorOpacity100,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: SizeConstant.appSize10),
                  Column(
                    children: List.generate(
                        movieDetailsController.languageList.length, (i) {
                      var item = movieDetailsController.languageList[i];
                      return DownloadListTileWidget(
                        name: item,
                        itemIndex: i,
                      );
                    }),
                  ),
                  const SizedBox(height: SizeConstant.appSize10),
                  PrimeElevatedButton(
                    onPressed: () {
                      Get.back();
                      movieDetailsController.selectedDownloadOption.value =
                          SizeConstant.appSize0.toInt();
                      downloadOptionDialog(context);
                    },
                    child: Text(
                      StringConstant.okTxt.toUpperCase(),
                      style: StyleConstants.button,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}

//ignore: must_be_immutable
class DownloadListTileWidget extends StatelessWidget {
  DownloadListTileWidget(
      {super.key, required this.name, required this.itemIndex});
  String name;
  int itemIndex;
  MovieDetailsController movieDetailsController =
      Get.put(MovieDetailsController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListTile(
        onTap: () => movieDetailsController.onTapLanguage(itemIndex),
        minTileHeight: SizeConstant.appSize20,
        dense: true,
        contentPadding: EdgeInsets.zero,
        leading: Image.asset(
          movieDetailsController.selectedLanguage.value == itemIndex
              ? AssetsConstant.radioBlockRedIcon
              : AssetsConstant.radioBlockIcon,
          scale: SizeConstant.appSize4,
        ),
        title: Text(
          name,
          style: StyleConstants.description2.copyWith(
              color: ColorConstant.fontColorOpacity100,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

Future downloadOptionDialog(BuildContext context) async {
  MovieDetailsController movieDetailsController =
      Get.put(MovieDetailsController());
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: SizeConstant.appSize18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: horizontalPadding(),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  StringConstant.downloadOption,
                  textAlign: TextAlign.start,
                  style: StyleConstants.description1
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: horizontalPadding(),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  StringConstant.downloadOptionDetails,
                  textAlign: TextAlign.start,
                  style: StyleConstants.commonStyle.copyWith(
                      fontWeight: FontWeight.w400,
                      color: ColorConstant.fontColorOpacity50),
                ),
              ),
            ),
            const SizedBox(height: SizeConstant.appSize10),
            Padding(
              padding: horizontalPadding(),
              child: Column(
                children: [
                  Column(
                    children: List.generate(
                        movieDetailsController.downloadOptionList.length, (i) {
                      var item = movieDetailsController.downloadOptionList[i];
                      return DownloadOptionListTileWidget(
                        name: item[StringConstant.namePicker],
                        itemIndex: i,
                        subtitle: item[StringConstant.gb],
                      );
                    }),
                  ),
                  const SizedBox(height: SizeConstant.appSize10),
                  PrimeElevatedButton(
                    onPressed: () {
                      movieDetailsController.downloadStatus.value++;
                      Get.back();
                    },
                    child: Text(
                      StringConstant.startDownload,
                      style: StyleConstants.button
                          .copyWith(color: ColorConstant.fontColorOpacity100),
                    ),
                  ),
                  const SizedBox(height: SizeConstant.appSize10),
                  PrimeElevatedButton(
                    onPressed: () {
                      movieDetailsController.downloadStatus.value++;
                      Get.back();
                    },
                    borderColor: ColorConstant.greyButtonColor,
                    backgroundColor: ColorConstant.greyButtonColor,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AssetsConstant.checkboxWhiteIcon,
                          scale: SizeConstant.appSize5,
                        ),
                        const SizedBox(width: SizeConstant.appSize5),
                        Text(
                          StringConstant.setAsDefault,
                          style: StyleConstants.button.copyWith(
                              color: ColorConstant.fontColorOpacity100),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}

//ignore: must_be_immutable
class DownloadOptionListTileWidget extends StatelessWidget {
  DownloadOptionListTileWidget(
      {super.key,
      required this.name,
      required this.subtitle,
      required this.itemIndex});
  String name;
  String subtitle;
  int itemIndex;
  MovieDetailsController movieDetailsController =
      Get.put(MovieDetailsController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListTile(
        onTap: () => movieDetailsController.onTapDownloadOption(itemIndex),
        minTileHeight: SizeConstant.appSize20,
        dense: true,
        contentPadding: EdgeInsets.zero,
        leading: Image.asset(
          movieDetailsController.selectedDownloadOption.value == itemIndex
              ? AssetsConstant.radioBlockRedIcon
              : AssetsConstant.radioBlockIcon,
          scale: SizeConstant.appSize4,
        ),
        title: Text(
          name,
          style: StyleConstants.description2.copyWith(
              color: ColorConstant.fontColorOpacity100,
              fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          subtitle,
          style: StyleConstants.commonStyle.copyWith(
              color: ColorConstant.fontTxtColor.withOpacity(.6),
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

Future movieAllDetailsDialog(BuildContext context, String movieName) async {
  MovieDetailsController movieDetailsController =
      Get.put(MovieDetailsController());
  return showModalBottomSheet(
    showDragHandle: false,
    context: context,
    isScrollControlled: true,
    constraints: BoxConstraints(
        minWidth: PrimeSizeConfig.displayWidth(context),
        maxWidth: PrimeSizeConfig.displayWidth(context),
        maxHeight: PrimeSizeConfig.displayHeight(context) *
            SizeConstant.opacity0point8,
        minHeight: PrimeSizeConfig.displayHeight(context) *
            SizeConstant.opacity0point8),
    builder: (context) {
      return Padding(
        padding: horizontalPadding().copyWith(
          top: SizeConstant.appSize18,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    movieName,
                    style: StyleConstants.description1.copyWith(
                        color: ColorConstant.fontColorOpacity100,
                        fontWeight: FontWeight.w700),
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Image.asset(
                      AssetsConstant.closeIcon,
                      scale: SizeConstant.appSize4,
                    ),
                  )
                ],
              ),
              const SizedBox(height: SizeConstant.appSize10),
              const MovieWrapDetailWidget(),
              const SizedBox(height: SizeConstant.appSize20),
              Text(
                StringConstant.movieDetails2,
                style: StyleConstants.commonStyle.copyWith(
                    fontWeight: FontWeight.w400,
                    color: ColorConstant.whiteColor),
              ),
              const SizedBox(height: SizeConstant.appSize10),
              const Divider(),
              Text(
                StringConstant.cast,
                style: StyleConstants.description2.copyWith(
                    color: ColorConstant.fontColorOpacity100,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: SizeConstant.appSize10),
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: PrimeSizeConfig.displayHeight(context) > 700
                        ? SizeConstant.appSize178
                        : SizeConstant.appSize170,
                    crossAxisCount: SizeConstant.appSize3.toInt(),
                    crossAxisSpacing: SizeConstant.appSize15,
                    mainAxisSpacing: SizeConstant.appSize15),
                children:
                    List.generate(movieDetailsController.castList.length, (i) {
                  var item = movieDetailsController.castList[i];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        item[StringConstant.cast],
                        fit: BoxFit.fitHeight,
                      ),
                      const SizedBox(height: SizeConstant.appSize4),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          item[StringConstant.namePicker],
                          style: StyleConstants.commonStyle.copyWith(
                              color: ColorConstant.fontColorOpacity100,
                              fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                          maxLines: SizeConstant.appSize1.toInt(),
                        ),
                      )
                    ],
                  );
                }),
              ),
              const Divider(),
              Text(
                StringConstant.audioLanguages,
                style: StyleConstants.description2.copyWith(
                    color: ColorConstant.fontColorOpacity100,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: SizeConstant.appSize10),
              SizedBox(
                height: SizeConstant.appSize28,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                      movieDetailsController.audioLanguageList.length,
                      (i) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: SizeConstant.appSize14),
                            child: Text(
                              movieDetailsController.audioLanguageList[i],
                              style: StyleConstants.commonStyle.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: ColorConstant.fontColorOpacity80),
                            ),
                          )),
                ),
              ),
              const Divider(),
              Text(
                StringConstant.director,
                style: StyleConstants.description2.copyWith(
                    color: ColorConstant.fontColorOpacity100,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: SizeConstant.appSize10),
              SizedBox(
                height: SizeConstant.appSize170,
                width: SizeConstant.appSize115,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AssetsConstant.directorImg(SizeConstant.appSize1.toInt()),
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(height: SizeConstant.appSize4),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        StringConstant.directorName1,
                        style: StyleConstants.commonStyle.copyWith(
                            color: ColorConstant.fontColorOpacity100,
                            fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                        maxLines: SizeConstant.appSize1.toInt(),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              Text(
                StringConstant.producer,
                style: StyleConstants.description2.copyWith(
                    color: ColorConstant.fontColorOpacity100,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: SizeConstant.appSize10),
              SizedBox(
                height: SizeConstant.appSize170,
                width: SizeConstant.appSize115,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AssetsConstant.producerImg(SizeConstant.appSize1.toInt()),
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(height: SizeConstant.appSize4),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        StringConstant.producerName1,
                        style: StyleConstants.commonStyle.copyWith(
                            color: ColorConstant.fontColorOpacity100,
                            fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                        maxLines: SizeConstant.appSize1.toInt(),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: SizeConstant.appSize20),
            ],
          ),
        ),
      );
    },
  );
}

class MovieWrapDetailWidget extends StatelessWidget {
  const MovieWrapDetailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
        text: StringConstant.movieDuration2,
        style: StyleConstants.commonStyle.copyWith(
            fontWeight: FontWeight.w400,
            color: ColorConstant.fontColorOpacity100),
        children: [
          TextSpan(
              text: " \u2022 ",
              style: StyleConstants.commonStyle
                  .copyWith(color: ColorConstant.primaryColor)),
          TextSpan(
            text: StringConstant.movieDrama2,
            style: StyleConstants.commonStyle.copyWith(
                fontWeight: FontWeight.w400,
                color: ColorConstant.fontColorOpacity100),
          ),
          TextSpan(
              text: " \u2022 ",
              style: StyleConstants.commonStyle
                  .copyWith(color: ColorConstant.primaryColor)),
          TextSpan(
            text: StringConstant.movieDate2,
            style: StyleConstants.commonStyle.copyWith(
                fontWeight: FontWeight.w400,
                color: ColorConstant.fontColorOpacity100),
          ),
          TextSpan(
              text: " \u2022 ",
              style: StyleConstants.commonStyle
                  .copyWith(color: ColorConstant.primaryColor)),
          TextSpan(
            text: StringConstant.movieAge2,
            style: StyleConstants.commonStyle.copyWith(
                fontWeight: FontWeight.w400,
                color: ColorConstant.fontColorOpacity100),
          ),
        ]));
  }
}

Future settingVideoDialog(BuildContext context) async {
  return showModalBottomSheet(
    showDragHandle: false,
    context: context,
    isScrollControlled: true,
    builder: (context) => SingleChildScrollView(
      child: Container(
        padding: horizontalPadding().copyWith(
            top: SizeConstant.appSize18, bottom: SizeConstant.appSize18),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringConstant.settings,
                  style: StyleConstants.description1.copyWith(
                      color: ColorConstant.fontColorOpacity100,
                      fontWeight: FontWeight.w700),
                ),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Image.asset(
                    AssetsConstant.closeIcon,
                    scale: SizeConstant.appSize4,
                  ),
                )
              ],
            ),
            const SizedBox(height: SizeConstant.appSize20),
            CustomSettingTileWidget(
                onTap: () {
                  Get.back();
                  subtitleDialog(context);
                },
                icon: AssetsConstant.subTitleIcon,
                title: StringConstant.subtitles,
                subTitle: StringConstant.english),
            const Divider(),
            CustomSettingTileWidget(
                onTap: () {
                  Get.back();
                  videoQualityDialog(context);
                },
                icon: AssetsConstant.playSettingIcon,
                title: StringConstant.video,
                subTitle: StringConstant.auto),
            const Divider(),
            CustomSettingTileWidget(
                onTap: () {
                  Get.back();
                  speedDialog(context);
                },
                icon: AssetsConstant.playBackIcon,
                title: StringConstant.playBackSpeed,
                subTitle: StringConstant.normal),
          ],
        ),
      ),
    ),
  );
}

//ignore: must_be_immutable
class CustomSettingTileWidget extends StatelessWidget {
  CustomSettingTileWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.subTitle,
      this.onTap});
  void Function()? onTap;
  String icon;
  String title;
  String subTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      onTap: onTap,
      minTileHeight: SizeConstant.appSize40,
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(icon, scale: SizeConstant.appSize4),
      title: Text(
        title,
        style: StyleConstants.commonStyle.copyWith(
            fontWeight: FontWeight.w500,
            color: ColorConstant.fontColorOpacity100),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            subTitle,
            style: StyleConstants.commonStyle.copyWith(
                fontWeight: FontWeight.w400,
                color: ColorConstant.fontColorOpacity70),
          ),
          const SizedBox(width: SizeConstant.appSize12),
          Image.asset(AssetsConstant.forwardIcon, scale: SizeConstant.appSize4)
        ],
      ),
    );
  }
}

Future subtitleDialog(BuildContext context) {
  MovieDetailsController movieDetailsController =
      Get.put(MovieDetailsController());
  return showModalBottomSheet(
    context: context,
    enableDrag: false,
    isScrollControlled: true,
    builder: (context) {
      return SingleChildScrollView(
        child: Container(
          padding: horizontalPadding().copyWith(
              top: SizeConstant.appSize18, bottom: SizeConstant.appSize18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringConstant.subtitles,
                    style: StyleConstants.description1.copyWith(
                        color: ColorConstant.fontColorOpacity100,
                        fontWeight: FontWeight.w700),
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Image.asset(
                      AssetsConstant.closeIcon,
                      scale: SizeConstant.appSize4,
                    ),
                  )
                ],
              ),
              const SizedBox(height: SizeConstant.appSize16),
              Obx(
                () => GestureDetector(
                  onTap: () {
                    movieDetailsController.onTapSubtitle(StringConstant.off);
                  },
                  child: AnimatedContainer(
                    width: PrimeSizeConfig.displayWidth(context),
                    duration:
                        Duration(milliseconds: SizeConstant.appSize400.toInt()),
                    padding: horizontalPadding().copyWith(
                        top: SizeConstant.appSize12,
                        bottom: SizeConstant.appSize12),
                    decoration: (movieDetailsController
                                .selectedSubtitle.value ==
                            StringConstant.off)
                        ? BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(SizeConstant.appSize30),
                            color: ColorConstant.dialogSelectColor)
                        : null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstant.off,
                          style: StyleConstants.commonStyle.copyWith(
                              fontWeight: FontWeight.w500,
                              color: ColorConstant.fontColorOpacity100),
                        ),
                        if (movieDetailsController.selectedSubtitle.value ==
                            StringConstant.off) ...[
                          Image.asset(
                            AssetsConstant.checkboxWithoutBgIcon,
                            scale: SizeConstant.appSize5,
                          )
                        ]
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: SizeConstant.appSize10),
              Obx(
                () => GestureDetector(
                  onTap: () {
                    movieDetailsController
                        .onTapSubtitle(StringConstant.english);
                  },
                  child: AnimatedContainer(
                    duration:
                        Duration(milliseconds: SizeConstant.appSize400.toInt()),
                    width: PrimeSizeConfig.displayWidth(context),
                    padding: horizontalPadding().copyWith(
                        top: SizeConstant.appSize12,
                        bottom: SizeConstant.appSize12),
                    decoration: (movieDetailsController
                                .selectedSubtitle.value ==
                            StringConstant.english)
                        ? BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(SizeConstant.appSize30),
                            color: ColorConstant.dialogSelectColor)
                        : null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstant.english,
                          style: StyleConstants.commonStyle.copyWith(
                              fontWeight: FontWeight.w500,
                              color: ColorConstant.fontColorOpacity100),
                        ),
                        if (movieDetailsController.selectedSubtitle.value ==
                            StringConstant.english) ...[
                          Image.asset(
                            AssetsConstant.checkboxWithoutBgIcon,
                            scale: SizeConstant.appSize5,
                          )
                        ]
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}

Future videoQualityDialog(BuildContext context) {
  MovieDetailsController movieDetailsController =
      Get.put(MovieDetailsController());
  return showModalBottomSheet(
    context: context,
    enableDrag: false,
    isScrollControlled: true,
    builder: (context) {
      return SingleChildScrollView(
        child: Container(
          padding: horizontalPadding().copyWith(
              top: SizeConstant.appSize18, bottom: SizeConstant.appSize18),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringConstant.videoQuality,
                    style: StyleConstants.description1.copyWith(
                        color: ColorConstant.fontColorOpacity100,
                        fontWeight: FontWeight.w700),
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Image.asset(
                      AssetsConstant.closeIcon,
                      scale: SizeConstant.appSize4,
                    ),
                  )
                ],
              ),
              const SizedBox(height: SizeConstant.appSize16),
              Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                      movieDetailsController.videoQualityList.length, (i) {
                    var item = movieDetailsController.videoQualityList[i];
                    return GestureDetector(
                      onTap: () {
                        movieDetailsController
                            .onTapVideoQuality(item[StringConstant.namePicker]);
                      },
                      child: AnimatedContainer(
                        margin: const EdgeInsets.symmetric(
                            vertical: SizeConstant.appSize5),
                        width: PrimeSizeConfig.displayWidth(context),
                        duration: Duration(
                            milliseconds: SizeConstant.appSize400.toInt()),
                        padding: horizontalPadding().copyWith(
                            top: SizeConstant.appSize12,
                            bottom: SizeConstant.appSize12),
                        decoration: (movieDetailsController
                                    .selectedVideoQuality.value ==
                                item[StringConstant.namePicker])
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    SizeConstant.appSize30),
                                color: ColorConstant.dialogSelectColor)
                            : null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  item[StringConstant.namePicker],
                                  style: StyleConstants.commonStyle.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: ColorConstant.fontColorOpacity100),
                                ),
                                const SizedBox(width: SizeConstant.appSize8),
                                Text(
                                  item[StringConstant.videoQuality],
                                  style: StyleConstants.commonStyle.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: ColorConstant.fontColorOpacity50),
                                ),
                              ],
                            ),
                            if (movieDetailsController
                                    .selectedVideoQuality.value ==
                                item[StringConstant.namePicker]) ...[
                              Image.asset(
                                AssetsConstant.checkboxWithoutBgIcon,
                                scale: SizeConstant.appSize5,
                              )
                            ]
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future speedDialog(BuildContext context) {
  MovieDetailsController movieDetailsController =
      Get.put(MovieDetailsController());
  return showModalBottomSheet(
    context: context,
    enableDrag: false,
    isScrollControlled: true,
    builder: (context) {
      return SingleChildScrollView(
        child: Container(
          padding: horizontalPadding().copyWith(
              top: SizeConstant.appSize18, bottom: SizeConstant.appSize18),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringConstant.speed,
                    style: StyleConstants.description1.copyWith(
                        color: ColorConstant.fontColorOpacity100,
                        fontWeight: FontWeight.w700),
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Image.asset(
                      AssetsConstant.closeIcon,
                      scale: SizeConstant.appSize4,
                    ),
                  )
                ],
              ),
              const SizedBox(height: SizeConstant.appSize16),
              Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                      movieDetailsController.speedList.length, (i) {
                    var item = movieDetailsController.speedList[i];
                    return GestureDetector(
                      onTap: () {
                        movieDetailsController
                            .onTapVideoSpeed(item[StringConstant.namePicker]);
                      },
                      child: AnimatedContainer(
                        margin: const EdgeInsets.symmetric(
                            vertical: SizeConstant.appSize5),
                        width: PrimeSizeConfig.displayWidth(context),
                        duration: Duration(
                            milliseconds: SizeConstant.appSize400.toInt()),
                        padding: horizontalPadding().copyWith(
                            top: SizeConstant.appSize12,
                            bottom: SizeConstant.appSize12),
                        decoration:
                            (movieDetailsController.selectedVideoSpeed.value ==
                                    item[StringConstant.namePicker])
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        SizeConstant.appSize30),
                                    color: ColorConstant.dialogSelectColor)
                                : null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  item[StringConstant.namePicker],
                                  style: StyleConstants.commonStyle.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: ColorConstant.fontColorOpacity100),
                                ),
                                const SizedBox(width: SizeConstant.appSize8),
                                Text(
                                  item[StringConstant.speed],
                                  style: StyleConstants.commonStyle.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: ColorConstant.fontColorOpacity50),
                                ),
                              ],
                            ),
                            if (movieDetailsController
                                    .selectedVideoSpeed.value ==
                                item[StringConstant.namePicker]) ...[
                              Image.asset(
                                AssetsConstant.checkboxWithoutBgIcon,
                                scale: SizeConstant.appSize5,
                              )
                            ]
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future castAlertDialog(BuildContext context) {
  return showDialog(
    context: context,
    useSafeArea: true,
    builder: (context) {
      Future.delayed(Duration(seconds: SizeConstant.appSize3.toInt()), () {
        Get.back();
        noDeviceAvailableDialog(context);
      });
      return Dialog(
        insetPadding: EdgeInsets.symmetric(
            horizontal: PrimeSizeConfig.displayWidth(context) *
                SizeConstant.opacity0point05),
        child: Padding(
          padding: const EdgeInsets.all(SizeConstant.appSize18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringConstant.castToDevice,
                    style: StyleConstants.description1.copyWith(
                        color: ColorConstant.fontColorOpacity100,
                        fontWeight: FontWeight.w700),
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Image.asset(
                      AssetsConstant.closeIcon,
                      scale: SizeConstant.appSize4,
                    ),
                  )
                ],
              ),
              const SizedBox(height: SizeConstant.appSize25),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConstant.lookingForDevices,
                    style: StyleConstants.commonStyle
                        .copyWith(color: ColorConstant.fontColorOpacity60),
                  ),
                  const SizedBox(height: SizeConstant.appSize8),
                  const LinearProgressIndicator()
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future noDeviceAvailableDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(
            horizontal: PrimeSizeConfig.displayWidth(context) *
                SizeConstant.opacity0point05),
        child: Padding(
          padding: horizontalPadding().copyWith(top: SizeConstant.appSize18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                StringConstant.noDeviceAvailable,
                style: StyleConstants.description1.copyWith(
                    color: ColorConstant.fontColorOpacity100,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                StringConstant.noDeviceDescription,
                style: StyleConstants.commonStyle.copyWith(
                    color: ColorConstant.fontColorOpacity60,
                    fontWeight: FontWeight.w500),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      Get.back();
                      castToDeviceAlertDialog(context);
                    },
                    child: Text(
                      StringConstant.okTxt.toUpperCase(),
                      style: StyleConstants.commonStyle
                          .copyWith(color: ColorConstant.fontColorOpacity100),
                    )),
              )
            ],
          ),
        ),
      );
    },
  );
}

Future castToDeviceAlertDialog(BuildContext context) async {
  MovieDetailsController movieDetailsController =
      Get.put(MovieDetailsController());
  return showDialog(
    context: context,
    builder: (context) {
      return Obx(
        () => Dialog(
          insetPadding: EdgeInsets.symmetric(
              horizontal: PrimeSizeConfig.displayWidth(context) *
                  SizeConstant.opacity0point05),
          child: Padding(
            padding: horizontalPadding().copyWith(top: SizeConstant.appSize18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  StringConstant.castToDevice,
                  style: StyleConstants.description1.copyWith(
                      color: ColorConstant.fontColorOpacity100,
                      fontWeight: FontWeight.w700),
                ),
                const Divider(),
                Column(
                  children: List.generate(
                      movieDetailsController.castMobileList.length, (i) {
                    var item = movieDetailsController.castMobileList[i];
                    return CastMobileWidget(
                      name: item,
                      itemIndex: i,
                    );
                  }),
                ),
                if (movieDetailsController.selectMobileCast.value !=
                    SizeConstant.appSizeMinus1.toInt()) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () => Get.back(),
                          child: Text(
                            StringConstant.cancel,
                            style: StyleConstants.commonStyle.copyWith(
                                color: ColorConstant.fontColorOpacity70,
                                fontSize: SizeConstant.appSize16),
                          )),
                      TextButton(
                          onPressed: () => Get.back(),
                          child: Text(
                            StringConstant.connect,
                            style: StyleConstants.commonStyle.copyWith(
                                color: ColorConstant.fontColorOpacity100,
                                fontSize: SizeConstant.appSize16),
                          ))
                    ],
                  )
                ] else ...[
                  const SizedBox(height: SizeConstant.appSize18)
                ]
              ],
            ),
          ),
        ),
      );
    },
  );
}

//ignore: must_be_immutable
class CastMobileWidget extends StatelessWidget {
  CastMobileWidget({super.key, required this.name, required this.itemIndex});
  String name;
  int itemIndex;
  MovieDetailsController movieDetailsController =
      Get.put(MovieDetailsController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListTile(
        onTap: () => movieDetailsController.onTapCastMobile(itemIndex),
        minTileHeight: SizeConstant.appSize20,
        dense: true,
        contentPadding: EdgeInsets.zero,
        leading: Image.asset(
          movieDetailsController.selectMobileCast.value == itemIndex
              ? AssetsConstant.radioBlockRedIcon
              : AssetsConstant.radioBlockIcon,
          scale: SizeConstant.appSize4,
        ),
        title: Text(
          name,
          style: StyleConstants.description2.copyWith(
              color: ColorConstant.fontColorOpacity100,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
