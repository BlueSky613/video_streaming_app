import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/screens/bottom_bar/bottom_bar.dart';
import 'package:prime_video_flutter_ui_kit/screens/otp_screen/otp_screen.dart';
import 'package:prime_video_flutter_ui_kit/widgets/widgets.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController mobileController = TextEditingController();
  RxString selectedCode = StringConstant.indiaCode.obs;
  FocusNode mobileFocusNode = FocusNode();
  TranslationController translationController = Get.put(TranslationController());
  RxBool isChecked = false.obs;

  RxBool disabledShowing = false.obs;

  @override
  void dispose() {
    super.dispose();
    mobileFocusNode.unfocus();
    mobileController.dispose();
  }

  dialogSelectCodePressed(String item) {
    update([selectedCode.value = item]);
    Get.back();
  }

  continueBtnPressed(BuildContext context) {
    if (loginKey.currentState!.validate()) {
      if (disabledShowing.value) {
        primeCircularProgress(context);
        Future.delayed(Duration(seconds: SizeConstant.appSize3.toInt()), () {
          translationController.saveToken("12345ABCDEF");
          Get.back();
          Get.to(() => OtpView(mobileText: mobileController.text));
        });
      }
    }
  }
}
