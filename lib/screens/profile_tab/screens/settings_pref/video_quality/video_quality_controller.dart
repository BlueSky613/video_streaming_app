import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';

class VideoQualityController extends GetxController {
  RxInt selectedIndex = SizeConstant.appSize0.toInt().obs;
  List videoQualityList = [
    {
      StringConstant.name: StringConstant.auto,
      StringConstant.videoQuality: StringConstant.bracket720p
    },
    {
      StringConstant.name: StringConstant.dataSaver,
      StringConstant.videoQuality: StringConstant.bracket360p
    },
  ];

  onTapListTile(int i) {
    selectedIndex.value = i;
    update();
  }
}
