import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/models/models.dart';

class GoPremiumController extends GetxController {
  RxInt selectedIndex = SizeConstant.appSize0.toInt().obs;

  List<SubscribeModel> subscribeList = [
    SubscribeModel(
        price: StringConstant.sbPlan1Price,
        duration: StringConstant.sbPlanDurationM,
        planValue: StringConstant.sbPremium,
        planResolution: StringConstant.upTo1080pResolution,
        deviceConnect: SizeConstant.appSize2.toInt().toString()),
    SubscribeModel(
        price: StringConstant.sbPlan2Price,
        duration: StringConstant.sbPlanDurationY,
        planValue: StringConstant.sbMobileOnly,
        planResolution: StringConstant.upTo720pResolution,
        deviceConnect: SizeConstant.appSize1.toInt().toString()),
    SubscribeModel(
        price: StringConstant.sbPlan3Price,
        duration: StringConstant.sbPlanDurationY,
        planValue: StringConstant.sbPremium,
        planResolution: StringConstant.upTo1080pResolution,
        deviceConnect: SizeConstant.appSize2.toInt().toString()),
  ];

  onTapedSubscribe(int index) {
    selectedIndex.value = index;
    update();
  }
}
