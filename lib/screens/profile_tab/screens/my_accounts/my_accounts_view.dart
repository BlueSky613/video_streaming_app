import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/screens/profile_tab/screens/my_accounts/my_acounts.dart';
import 'package:prime_video_flutter_ui_kit/utils/utils.dart';
import 'edit_details/edit_details_view.dart';

class MyAccountsView extends StatelessWidget {
  const MyAccountsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _mainBody(context),
      bottomNavigationBar: bottomBar(context),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        StringConstant.myAccount,
        style: StyleConstants.heading20Size,
      ),
    );
  }

  Widget bottomBar(BuildContext context) {
    return Padding(
      padding: horizontalPadding().copyWith(
          bottom: PrimeSizeConfig.displayHeight(context) *
              SizeConstant.opacity0point03),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => signOutDialog(context),
            child: Row(
              children: [
                Image.asset(AssetsConstant.signOutIcon,
                    scale: SizeConstant.appSize4),
                const SizedBox(width: SizeConstant.appSize10),
                Text(
                  StringConstant.signOut,
                  style: StyleConstants.description1.copyWith(
                      color: ColorConstant.fontColorOpacity100,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          const SizedBox(height: SizeConstant.appSize18),
          GestureDetector(
            onTap: () => deleteAccountDialog(context),
            child: Row(
              children: [
                const SizedBox(width: SizeConstant.appSize5),
                Image.asset(
                  AssetsConstant.deleteRedIcon,
                  scale: SizeConstant.appSize4,
                ),
                const SizedBox(width: SizeConstant.appSize10),
                Text(
                  StringConstant.deleteAccount,
                  style: StyleConstants.description1.copyWith(
                      color: ColorConstant.redColor,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _mainBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: SizeConstant.appSize40,
        ),
        CircleAvatar(
          maxRadius: SizeConstant.appSize60,
          minRadius: SizeConstant.appSize60,
          backgroundColor: ColorConstant.greyButtonColor,
          backgroundImage:
              const AssetImage(AssetsConstant.userProfileImg) as ImageProvider,
        ),
        const SizedBox(height: SizeConstant.appSize10),
        GestureDetector(
          onTap: () => Get.to(() => const EditDetailsView()),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AssetsConstant.editIcon,
                  scale: SizeConstant.appSize4),
              const SizedBox(width: SizeConstant.appSize10),
              Text(
                StringConstant.editDetails,
                style: StyleConstants.description2.copyWith(
                    fontWeight: FontWeight.w400,
                    color: ColorConstant.fontColorOpacity100),
              )
            ],
          ),
        ),
        Column(
          children: [
            const SizedBox(height: SizeConstant.appSize40),
            Container(
              width: PrimeSizeConfig.displayWidth(context),
              margin: const EdgeInsets.symmetric(
                  horizontal: SizeConstant.appSize18),
              padding: const EdgeInsets.all(SizeConstant.appSize16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(SizeConstant.appSize10),
                  color: ColorConstant.bottomBarBgColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConstant.accountDetails,
                    style: StyleConstants.description1.copyWith(
                        color: ColorConstant.fontColorOpacity100,
                        fontWeight: FontWeight.w500),
                  ),
                  const Divider(),
                  customTextileWidget(StringConstant.userNameWithName),
                  customTextileWidget(StringConstant.userMobileWithPhoneNumber),
                  customTextileWidget(StringConstant.userEmailWithEmailId),
                  customTextileWidget(StringConstant.userDobWithDob),
                  customTextileWidget(StringConstant.userGenderWithGender),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget customTextileWidget(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: SizeConstant.appSize2),
      child: Text(
        text,
        style: StyleConstants.commonStyle.copyWith(
            color: ColorConstant.fontColorOpacity60,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
