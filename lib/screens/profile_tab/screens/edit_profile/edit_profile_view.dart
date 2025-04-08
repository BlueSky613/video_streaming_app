import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/screens/profile_tab/screens/edit_profile/edit_profile.dart';
import 'package:prime_video_flutter_ui_kit/utils/utils.dart';
import 'package:prime_video_flutter_ui_kit/widgets/widgets.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: _appBar(context),
        body: _mainBody(context),
        bottomNavigationBar: _bottomBar(context),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        StringConstant.editDetails,
        style: StyleConstants.heading20Size,
      ),
    );
  }

  Widget _bottomBar(BuildContext context) {
    return Padding(
      padding: horizontalPadding().copyWith(
          bottom: PrimeSizeConfig.displayHeight(context) *
              SizeConstant.opacity0point03),
      child: PrimeElevatedButton(
        onPressed: () => Get.back(),
        child: Text(
          StringConstant.update,
          style: StyleConstants.button,
        ),
      ),
    );
  }

  Widget _mainBody(BuildContext context) {
    EditProfileController editProfileController =
        Get.put(EditProfileController());
    return SingleChildScrollView(
      padding: horizontalPadding(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: SizeConstant.appSize40),
          Center(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Hero(
                  tag: StringConstant.appTitle,
                  child: CircleAvatar(
                    maxRadius: SizeConstant.appSize60,
                    minRadius: SizeConstant.appSize60,
                    backgroundColor: ColorConstant.greyButtonColor,
                    backgroundImage: editProfileController
                            .selectedFilePath.value.isNotEmpty
                        ? FileImage(
                            File(editProfileController.selectedFilePath.value))
                        : const AssetImage(AssetsConstant.userProfileImg)
                            as ImageProvider,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    editProfileController.requestStoragePermission();
                    FilePickerService filePickerService = FilePickerService();
                    final file = await filePickerService.pickImage();
                    if (file != null) {
                      editProfileController.selectedFilePath.value = file.path;
                    }
                  },
                  child: Image.asset(
                    AssetsConstant.editBgIcon,
                    scale: SizeConstant.opacity5point5,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: SizeConstant.appSize50),
          Text(
            StringConstant.name,
            style: StyleConstants.description2.copyWith(
                fontWeight: FontWeight.w500,
                color: ColorConstant.fontColorOpacity60),
          ),
          PrimeTextField(
            hintText: StringConstant.name,
            controller: editProfileController.nameController,
          )
        ],
      ),
    );
  }
}
