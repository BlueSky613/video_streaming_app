import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/models/models.dart';

class ContinueWatchingController extends GetxController {
  RxList<ContinueModel> continueWatchList = [
    ContinueModel(
        movieName: StringConstant.cWatchingMovieName1,
        movieDescription: StringConstant.cWatchingMovieDescription1,
        sliderValue: StringConstant.cWatchingMovieSlider1,
        subscription: StringConstant.cWatchingMovieSubscription1,
        icon: AssetsConstant.continueWatchImg(1)),
    ContinueModel(
        movieName: StringConstant.cWatchingMovieName2,
        movieDescription: StringConstant.cWatchingMovieDescription2,
        sliderValue: StringConstant.cWatchingMovieSlider2,
        subscription: StringConstant.cWatchingMovieSubscription2,
        icon: AssetsConstant.continueWatchingImg(2)),
    ContinueModel(
        movieName: StringConstant.cWatchingMovieName3,
        movieDescription: StringConstant.cWatchingMovieDescription3,
        sliderValue: StringConstant.cWatchingMovieSlider3,
        subscription: StringConstant.cWatchingMovieSubscription3,
        icon: AssetsConstant.continueWatchingImg(3)),
    ContinueModel(
        movieName: StringConstant.cWatchingMovieName4,
        movieDescription: StringConstant.cWatchingMovieDescription4,
        sliderValue: StringConstant.cWatchingMovieSlider4,
        subscription: StringConstant.cWatchingMovieSubscription4,
        icon: AssetsConstant.continueWatchingImg(4)),
  ].obs;
}
