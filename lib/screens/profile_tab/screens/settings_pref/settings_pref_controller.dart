import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/assets_constant.dart';

class SettingsPrefController extends GetxController {
  RxBool subtitleShowing = true.obs;
  RxBool autoPlayShowing = true.obs;

  List languageList = [
    AssetsConstant.languagesImg(1),
    AssetsConstant.languagesImg(2),
    AssetsConstant.languagesImg(3),
    AssetsConstant.languagesImg(4),
    AssetsConstant.languagesImg(5),
    AssetsConstant.languagesImg(6),
    AssetsConstant.languagesImg(7),
    AssetsConstant.languagesImg(8),
  ];
}
