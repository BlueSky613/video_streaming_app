import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/models/models.dart';

class MyDownloadController extends GetxController {
  RxBool isDeleteShowing = false.obs;

  RxBool isShowing = false.obs;
  RxList<MovieModel> downloadList = [
    MovieModel(
        icon: AssetsConstant.downloadImg(1),
        movieName: StringConstant.downloadMovieName1,
        movieDescription: StringConstant.downloadMovieDesc1),
    MovieModel(
        icon: AssetsConstant.downloadImg(2),
        movieName: StringConstant.downloadMovieName2,
        movieDescription: StringConstant.downloadMovieDesc2),
    MovieModel(
        icon: AssetsConstant.downloadImg(3),
        movieName: StringConstant.downloadMovieName3,
        movieDescription: StringConstant.downloadMovieDesc3),
    MovieModel(
        icon: AssetsConstant.downloadImg(4),
        movieName: StringConstant.downloadMovieName4,
        movieDescription: StringConstant.downloadMovieDesc4),
    MovieModel(
        icon: AssetsConstant.downloadImg(5),
        movieName: StringConstant.downloadMovieName5,
        movieDescription: StringConstant.downloadMovieDesc5),
    MovieModel(
        icon: AssetsConstant.downloadImg(6),
        movieName: StringConstant.downloadMovieName6,
        movieDescription: StringConstant.downloadMovieDesc6),
    MovieModel(
        icon: AssetsConstant.downloadImg(7),
        movieName: StringConstant.downloadMovieName7,
        movieDescription: StringConstant.downloadMovieDesc7),
    MovieModel(
        icon: AssetsConstant.downloadImg(8),
        movieName: StringConstant.downloadMovieName8,
        movieDescription: StringConstant.downloadMovieDesc8),
    MovieModel(
        icon: AssetsConstant.downloadImg(9),
        movieName: StringConstant.downloadMovieName9,
        movieDescription: StringConstant.downloadMovieDesc9),
  ].obs;

  onTapEdit() {
    isDeleteShowing.toggle();
    update();
  }

  onTapDelete(MovieModel name) {
    downloadList.remove(name);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    Future.delayed(
        Duration(
          seconds: SizeConstant.appSize2.toInt(),
        ),
        () => isShowing.value = true);
  }
}
