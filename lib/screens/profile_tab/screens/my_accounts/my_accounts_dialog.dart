import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/extension/extension.dart';
import 'package:prime_video_flutter_ui_kit/screens/bottom_bar/bottom_bar.dart';
import 'package:prime_video_flutter_ui_kit/screens/login/login_view.dart';
import 'package:prime_video_flutter_ui_kit/screens/welcome/welcome.dart';
import 'package:prime_video_flutter_ui_kit/widgets/button.dart';

Future signOutDialog(BuildContext context) async {
  TranslationController translationController = Get.put(TranslationController());
  return showModalBottomSheet(
      context: context,
      showDragHandle: false,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
            padding: const EdgeInsets.all(SizeConstant.appSize16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  StringConstant.signOut,
                  style: StyleConstants.heading24Style,
                ),
                const SizedBox(height: SizeConstant.appSize6),
                Text(
                  StringConstant.signOutDeleteDialogDetails,
                  textAlign: TextAlign.center,
                  style: StyleConstants.description2.copyWith(
                      fontWeight: FontWeight.w400,
                      color: ColorConstant.fontColorOpacity70),
                ),
                const SizedBox(height: SizeConstant.appSize38),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: PrimeElevatedButton(
                        elevation: SizeConstant.opacity0,
                        onPressed: () {
                          BottomBarController().dispose();
                          translationController.deleteToken();
                          Get.offAll(() => LoginView());
                        },
                        child: Text(
                          StringConstant.signOut.toCapitalize(),
                          style: StyleConstants.button,
                        ),
                      ),
                    ),
                    const SizedBox(width: SizeConstant.appSize14),
                    Expanded(
                        child: PrimeElevatedButton(
                      elevation: SizeConstant.opacity0,
                      onPressed: () => Get.back(),
                      backgroundColor: ColorConstant.greyButtonColor,
                      child: Text(
                        StringConstant.cancel,
                        style: StyleConstants.button,
                      ),
                    )),
                  ],
                )
              ],
            ),
          ));
}

Future deleteAccountDialog(BuildContext context) async {
  return showModalBottomSheet(
      context: context,
      showDragHandle: false,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
            padding: const EdgeInsets.all(SizeConstant.appSize16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  StringConstant.deleteAccount,
                  style: StyleConstants.heading24Style,
                ),
                const SizedBox(height: SizeConstant.appSize6),
                Text(
                  StringConstant.deleteAccountDialogDescription,
                  textAlign: TextAlign.center,
                  style: StyleConstants.description2.copyWith(
                      fontWeight: FontWeight.w400,
                      color: ColorConstant.fontColorOpacity70),
                ),
                const SizedBox(height: SizeConstant.appSize38),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: PrimeElevatedButton(
                        elevation: SizeConstant.opacity0,
                        onPressed: () {
                          BottomBarController().dispose();
                          Get.offAll(() => const WelcomeViewScreen());
                        },
                        child: Text(
                          StringConstant.deleteAccount,
                          style: StyleConstants.button,
                        ),
                      ),
                    ),
                    const SizedBox(width: SizeConstant.appSize14),
                    Expanded(
                        child: PrimeElevatedButton(
                      elevation: SizeConstant.opacity0,
                      onPressed: () => Get.back(),
                      backgroundColor: ColorConstant.greyButtonColor,
                      child: Text(
                        StringConstant.cancel,
                        style: StyleConstants.button,
                      ),
                    )),
                  ],
                )
              ],
            ),
          ));
}
