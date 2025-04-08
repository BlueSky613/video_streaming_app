import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/screens/profile_tab/screens/my_download/episode_download/episode_download.dart';
import 'package:prime_video_flutter_ui_kit/utils/utils.dart';
import 'package:prime_video_flutter_ui_kit/widgets/snackbar.dart';

class EpisodeView extends StatelessWidget {
  const EpisodeView({super.key});

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
    EpisodeDownloadController episodeDownloadController =
        Get.put(EpisodeDownloadController());
    return AppBar(
      title: Text(
        StringConstant.downloadMovieName1,
        style: StyleConstants.heading20Size,
      ),
      actions: [
        Padding(
          padding: horizontalPadding(),
          child: GestureDetector(
            onTap: () {
              episodeDownloadController.onTapEpisodeEdit();
            },
            child: episodeDownloadController.isDeleteShowingEpisode.value
                ? Text(
                    StringConstant.doneTxt,
                    style: StyleConstants.description2.copyWith(
                        fontWeight: FontWeight.w400,
                        color: ColorConstant.fontColorOpacity100),
                  )
                : Image.asset(AssetsConstant.editIcon,
                    scale: SizeConstant.appSize4),
          ),
        )
      ],
    );
  }

  Widget _mainBody(BuildContext context) {
    EpisodeDownloadController episodeDownloadController =
        Get.put(EpisodeDownloadController());
    return Padding(
      padding: horizontalPadding(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringConstant.seasonTxt(5),
            style: StyleConstants.commonStyle.copyWith(
                color: ColorConstant.fontColorOpacity100,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: SizeConstant.appSize18),
          Expanded(
            child: ListView.separated(
                padding: const EdgeInsets.only(bottom: SizeConstant.appSize18),
                itemBuilder: (context, index) {
                  var item =
                      episodeDownloadController.downloadEpisodeList[index];
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: SizeConstant.appSize86,
                        width: SizeConstant.appSize170,
                        child: Stack(
                          children: [
                            Image.asset(
                              item.icon,
                              fit: BoxFit.fitWidth,
                            ),
                            if (episodeDownloadController
                                .isDeleteShowingEpisode.value) ...[
                              GestureDetector(
                                onTap: () {
                                  episodeDownloadController
                                      .onTapEpisodeDelete(item);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      primeSnackBar(
                                          msg: StringConstant
                                              .successfullyRemoveFromDownloadMsg));
                                },
                                child: Container(
                                  color: ColorConstant.deleteBgIconColor,
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    AssetsConstant.deleteIcon,
                                    scale: SizeConstant.appSize4,
                                  ),
                                ),
                              ),
                            ] else ...[
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Image.asset(
                                      AssetsConstant.playIcon,
                                      scale: SizeConstant.appSize4,
                                    ),
                                    if (index ==
                                        SizeConstant.opacity0.toInt()) ...[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 3.0),
                                        child: Slider(
                                            thumbColor: Colors.white,
                                            value: SizeConstant.appSize30,
                                            onChanged: (value) {},
                                            min: SizeConstant.opacity0,
                                            max: SizeConstant.appSize100),
                                      )
                                    ]
                                  ],
                                ),
                              ),
                            ]
                          ],
                        ),
                      ),
                      const SizedBox(width: SizeConstant.appSize14),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            item.movieName,
                            overflow: TextOverflow.ellipsis,
                            maxLines: SizeConstant.appSize2.toInt(),
                            style: StyleConstants.commonStyle.copyWith(
                                fontWeight: FontWeight.w600,
                                color: ColorConstant.fontColorOpacity100),
                          ),
                          Text(
                            item.movieDescription,
                            overflow: TextOverflow.ellipsis,
                            style: StyleConstants.commonStyle.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: SizeConstant.appSize12,
                                color: ColorConstant.fontColorOpacity60),
                          ),
                        ],
                      )),
                    ],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: SizeConstant.appSize22,
                    ),
                itemCount:
                    episodeDownloadController.downloadEpisodeList.length),
          ),
        ],
      ),
    );
  }
}
