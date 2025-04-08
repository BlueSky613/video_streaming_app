import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/models/models.dart';

class EpisodeDownloadController extends GetxController {
  RxBool isDeleteShowingEpisode = false.obs;

  onTapEpisodeEdit() {
    isDeleteShowingEpisode.toggle();
    update();
  }

  onTapEpisodeDelete(MovieModel name) {
    downloadEpisodeList.remove(name);
    update();
  }

  RxList<MovieModel> downloadEpisodeList = [
    MovieModel(
        icon: AssetsConstant.downloadEpisodeImg(1),
        movieName: StringConstant.downloadEpisodeName1,
        movieDescription: StringConstant.downloadEpisodeDesc1),
    MovieModel(
        icon: AssetsConstant.downloadEpisodeImg(2),
        movieName: StringConstant.downloadEpisodeName2,
        movieDescription: StringConstant.downloadEpisodeDesc2),
    MovieModel(
        icon: AssetsConstant.downloadEpisodeImg(3),
        movieName: StringConstant.downloadEpisodeName3,
        movieDescription: StringConstant.downloadEpisodeDesc3),
    MovieModel(
        icon: AssetsConstant.downloadEpisodeImg(4),
        movieName: StringConstant.downloadEpisodeName4,
        movieDescription: StringConstant.downloadEpisodeDesc4),
    MovieModel(
        icon: AssetsConstant.downloadEpisodeImg(5),
        movieName: StringConstant.downloadEpisodeName5,
        movieDescription: StringConstant.downloadEpisodeDesc5),
    MovieModel(
        icon: AssetsConstant.downloadEpisodeImg(6),
        movieName: StringConstant.downloadEpisodeName6,
        movieDescription: StringConstant.downloadEpisodeDesc6),
    MovieModel(
        icon: AssetsConstant.downloadEpisodeImg(7),
        movieName: StringConstant.downloadEpisodeName7,
        movieDescription: StringConstant.downloadEpisodeDesc7),
    MovieModel(
        icon: AssetsConstant.downloadEpisodeImg(8),
        movieName: StringConstant.downloadEpisodeName8,
        movieDescription: StringConstant.downloadEpisodeDesc8),
    MovieModel(
        icon: AssetsConstant.downloadEpisodeImg(9),
        movieName: StringConstant.downloadEpisodeName9,
        movieDescription: StringConstant.downloadEpisodeDesc9),
  ].obs;
}
