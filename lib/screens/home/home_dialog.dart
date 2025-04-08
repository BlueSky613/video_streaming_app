import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/models/models.dart';
import 'package:prime_video_flutter_ui_kit/screens/home/home.dart';
import 'package:prime_video_flutter_ui_kit/screens/home/home_screens/movie_details/movie_details.dart';
import 'package:prime_video_flutter_ui_kit/utils/utilities.dart';

Future continueWatchingDialog(BuildContext context, ContinueModel item) async {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: horizontalPadding(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.movieName,
                    style: StyleConstants.description1
                        .copyWith(fontWeight: FontWeight.w600),
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
            ),
            const Divider(),
            const SizedBox(height: SizeConstant.appSize10),
            Padding(
              padding: horizontalPadding(),
              child: ListTile(
                onTap: () {
                  HomeController homeController = Get.put(HomeController());
                  homeController.continueWatchList.remove(item);
                  Get.back();
                },
                contentPadding: EdgeInsets.zero,
                leading: Image.asset(AssetsConstant.deleteIcon,
                    scale: SizeConstant.appSize4),
                title: Text(StringConstant.removeFromWatching,
                    style: StyleConstants.description2
                        .copyWith(color: ColorConstant.fontColorOpacity100)),
              ),
            ),
            Padding(
              padding: horizontalPadding(),
              child: ListTile(
                onTap: () {
                  Get.back();
                  Get.to(() => MovieDetailsView(
                      videoImg: item.icon,
                      movieName: item.movieName,
                      movieDetails:
                          item.movieName == StringConstant.cWatchingMovieName1
                              ? StringConstant.cWatchingMovieDetails1
                              : StringConstant.cwMovieDetails2));
                },
                contentPadding: EdgeInsets.zero,
                leading: Image.asset(AssetsConstant.playIcon,
                    scale: SizeConstant.appSize4),
                title: Text(StringConstant.playMovies(item.movieName),
                    style: StyleConstants.description2
                        .copyWith(color: ColorConstant.fontColorOpacity100)),
              ),
            ),
          ],
        ),
      );
    },
  );
}
