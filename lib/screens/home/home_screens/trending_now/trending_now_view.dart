import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/screens/home/home.dart';
import 'package:prime_video_flutter_ui_kit/screens/home/home_screens/movie_details/movie_details.dart';
import 'package:prime_video_flutter_ui_kit/utils/utils.dart';

class TrendingNowView extends StatelessWidget {
  const TrendingNowView({super.key});

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
        StringConstant.trendingRightNow,
        style: StyleConstants.heading20Size,
      ),
    );
  }

  Widget _mainBody(BuildContext context) {
    TrendingNowController trendingNowController =
        Get.put(TrendingNowController());
    return GridView(
      padding: horizontalPadding(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: SizeConstant.appSize2.toInt(),
          mainAxisSpacing: SizeConstant.appSize20,
          crossAxisSpacing: SizeConstant.appSize20,
          mainAxisExtent: SizeConstant.appSize234),
      children:
          List.generate(trendingNowController.trendingNowList.length, (i) {
        var item = trendingNowController.trendingNowList[i];
        return GestureDetector(
          onTap: () {
            if (i == SizeConstant.opacity0.toInt()) {
              Get.to(() => const MovieDetailsView(
                    videoImg: AssetsConstant.trnRightNowFirstImg,
                    movieName: StringConstant.downloadMovieName4,
                    movieDetails: StringConstant.downloadMovieDetails4,
                  ));
            }
          },
          child: Image.asset(
            item,
            fit: BoxFit.fill,
          ),
        );
      }),
    );
  }
}
