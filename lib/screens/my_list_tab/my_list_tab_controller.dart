import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';

class MyListTabController extends GetxController {
  RxBool isDeleteShowing = false.obs;
  RxList moreLikeList = [
    AssetsConstant.trendingRightNowHImg(1),
    AssetsConstant.trendingRightNowHImg(2),
    AssetsConstant.trendingRightNowHImg(3),
    AssetsConstant.trendingRightNowHImg(4),
    AssetsConstant.trendingRightNowHImg(5),
    AssetsConstant.trendingRightNowHImg(6),
    AssetsConstant.trendingRightNowHImg(7),
    AssetsConstant.trendingRightNowHImg(8),
    AssetsConstant.trendingRightNowHImg(9),
  ].obs;

  onTapEdit() {
    isDeleteShowing.toggle();
    update();
  }

  onTapDelete(String name) {
    moreLikeList.remove(name);
    update();
  }
}
