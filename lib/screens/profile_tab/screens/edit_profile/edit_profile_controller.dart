import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';

class EditProfileController extends GetxController {
  RxString selectedFilePath = "".obs;

  TextEditingController nameController = TextEditingController();

  requestStoragePermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    if (statuses[Permission.storage]!.isDenied) {
      Permission.storage.request();
    } else if (statuses[Permission.storage]!.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  @override
  void onInit() {
    super.onInit();
    nameController.text = StringConstant.userName;
  }
}
