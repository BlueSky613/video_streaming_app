import 'package:get/get.dart';

class ConfirmDetailsController extends GetxController {
  RxBool agreeValue = true.obs;

  onChangedTap(bool value) {
    agreeValue.value = value;
    update();
  }
}
