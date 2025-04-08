import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/models/continue_model.dart';
import 'package:prime_video_flutter_ui_kit/screens/home/home_screens/movie_details/movie_details.dart';
import 'package:prime_video_flutter_ui_kit/utils/utils.dart';

import 'continue_watching.dart';

class ContinueWatchingView extends StatelessWidget {
  const ContinueWatchingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _mainBody(context),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        StringConstant.continueWatching,
        style: StyleConstants.heading20Size,
      ),
    );
  }

  Widget _mainBody(BuildContext context) {
    ContinueWatchingController continueWatchingController =
        Get.put(ContinueWatchingController());
    return ListView.separated(
        padding: horizontalPadding().copyWith(bottom: SizeConstant.appSize18),
        itemBuilder: (context, index) {
          var item = continueWatchingController.continueWatchList[index];
          return GestureDetector(
              onTap: () {
                if (index == SizeConstant.opacity0.toInt()) {
                  Get.to(() => MovieDetailsView(
                        videoImg: item.icon,
                        movieName: item.movieName,
                        movieDetails: index == SizeConstant.appSize0.toInt()
                            ? StringConstant.cWatchingMovieDetails1
                            : StringConstant.cwMovieDetails2,
                      ));
                }
              },
              child: ContinueWatchingTileWidget(item: item));
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: SizeConstant.appSize26,
            ),
        itemCount: continueWatchingController.continueWatchList.length);
  }
}

class ContinueWatchingTileWidget extends StatelessWidget {
  const ContinueWatchingTileWidget({
    super.key,
    required this.item,
  });

  final ContinueModel item;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(SizeConstant.appSize12),
      child: AnimatedContainer(
        duration: Duration(milliseconds: SizeConstant.appSize400.toInt()),
        width:
            PrimeSizeConfig.displayWidth(context) * SizeConstant.opacity0point7,
        height: PrimeSizeConfig.displayHeight(context) *
            SizeConstant.opacity0point3,
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
                  ColorConstant.cwGradient1,
                  ColorConstant.cwGradient1,
                  ColorConstant.cwGradient1,
                  ColorConstant.cwGradient2,
                  ColorConstant.cwGradient2,
                ]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(SizeConstant.appSize10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    (item.subscription.isNotEmpty)
                        ? Image.asset(
                            AssetsConstant.premiumIcon,
                            scale: SizeConstant.appSize4,
                          )
                        : const SizedBox(),
                    Image.asset(
                      AssetsConstant.menuIcon,
                      scale: SizeConstant.appSize4,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(SizeConstant.appSize10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    const SizedBox(height: SizeConstant.appSize5),
                    Slider(
                        thumbColor: Colors.white,
                        value: double.parse(item.sliderValue),
                        onChanged: (value) {},
                        min: SizeConstant.opacity0,
                        max: SizeConstant.appSize100),
                    const SizedBox(height: SizeConstant.appSize8),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
