import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';

class EditDetailsController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  RxString selectedCode = StringConstant.indiaCode.obs;
  FocusNode mobileFocusNode = FocusNode();

  Rx<DateTime> initialDate = DateTime.now().obs;

  List genderList = [
    StringConstant.male,
    StringConstant.female,
    StringConstant.other
  ];

  RxString selectedGender = StringConstant.female.obs;

  onTapedGender(String name) {
    selectedGender.value = name;
    update();
  }

  dialogSelectCodePressed(String item) {
    update([selectedCode.value = item]);
    Get.back();
  }

  @override
  void onInit() {
    super.onInit();
    nameController.text = StringConstant.userName;
    mobileController.text = StringConstant.mobileStaticText;
    dobController.text = StringConstant.dobUser;
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    dobController.dispose();
  }
}
