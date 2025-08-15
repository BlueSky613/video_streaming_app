import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/helper/helper.dart';
import 'package:prime_video_flutter_ui_kit/screens/login/login.dart';
import 'package:prime_video_flutter_ui_kit/screens/profile_tab/screens/privacy_policy/privacy_policy.dart';
import 'package:prime_video_flutter_ui_kit/screens/profile_tab/screens/terms_of_use/terms_of_use_view.dart';
import 'package:prime_video_flutter_ui_kit/utils/utilities.dart';
import 'package:prime_video_flutter_ui_kit/widgets/widgets.dart';

//ignore: must_be_immutable
class LoginView extends StatelessWidget {
  LoginView({super.key});
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false),
        body: _mainBody(context));
  }

  _mainBody(BuildContext context) {
    return Obx(
      () => Form(
        key: loginController.loginKey,
        child: ListView(
          padding: horizontalPadding(),
          shrinkWrap: true,
          children: [
            Text(StringConstant.loginTxt, style: StyleConstants.heading20Size),
            const SizedBox(height: SizeConstant.appSize55),
            Text(StringConstant.enterYourMobileNumber,
                style: StyleConstants.description2
                    .copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(height: SizeConstant.appSize34),
            PrimeTextField(
              focusNode: loginController.mobileFocusNode,
              controller: loginController.mobileController,
              hintText: StringConstant.mobileNumber,
              keyboardType: TextInputType.phone,
              showCounter: false,
              onChanged: (value) {
                if (value.length == 12) {
                  loginController.disabledShowing.value = true;
                } else {
                  loginController.disabledShowing.value = false;
                }
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return StringConstant.pleaseEnterMobile;
                }
                return null;
              },
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(
                    SizeConstant.appSize10.toInt()),
                PhoneNumberFormatter(),
              ],
              prefix: GestureDetector(
                onTap: () => countryPickerDialog(context),
                child: Text("${loginController.selectedCode}  ",
                    maxLines: SizeConstant.appSize1.toInt(),
                    overflow: TextOverflow.ellipsis,
                    style: StyleConstants.description2.copyWith(
                        fontWeight: FontWeight.w600,
                        color: ColorConstant.fontColorOpacity100)),
              ),
            ),
            const SizedBox(height: SizeConstant.appSize64),
            PrimeElevatedButton(
              onPressed: () => loginController.continueBtnPressed(context),
              backgroundColor: loginController.disabledShowing.value && loginController.isChecked.value
                  ? null
                  : ColorConstant.primaryColor
                      .withOpacity(SizeConstant.opacity0point3),
              child: Text(StringConstant.continueTxt,
                  style: StyleConstants.button.copyWith(
                      color: loginController.disabledShowing.value && loginController.isChecked.value
                          ? ColorConstant.fontTxtColor
                          : ColorConstant.fontColorOpacity40)),
            ),
            const SizedBox(height: SizeConstant.appSize42),
            BottomWidget(),
          ],
        ),
      ),
    );
  }
}

class BottomWidget extends StatelessWidget {
  LoginController loginController = Get.put(LoginController());
   BottomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            loginController.isChecked.value = !loginController.isChecked.value;
          },
          child: Obx(() => !loginController.isChecked.value? Image.asset(
              AssetsConstant.checkbox2,
            color: ColorConstant.whiteColor,
            height: SizeConstant.appSize26,
            width: SizeConstant.appSize26,
          ): Image.asset(
            AssetsConstant.checkboxWhiteIcon,
            height: SizeConstant.appSize24,
            width: SizeConstant.appSize24,
          )),
        ),
        SizedBox(
          width: SizeConstant.appSize10,
        ),
        Expanded(
          child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                  text: StringConstant.loginDescriptionTxt1,
                  style: StyleConstants.description4.copyWith(
                    color: ColorConstant.fontColorOpacity70,
                  ),
                  children: [
                    TextSpan(
                        text: StringConstant.termsOfUse,
                        style: StyleConstants.description4.copyWith(
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                            color: ColorConstant.fontColorOpacity100,
                        ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(() => TermsOfUseView());
                        },
                    ),
                    TextSpan(
                      text: StringConstant.loginDescriptionTxt2,
                      style: StyleConstants.description4.copyWith(
                        color: ColorConstant.fontColorOpacity70,
                      ),
                    ),
                    TextSpan(
                        text: StringConstant.privacyPolicy,
                        style: StyleConstants.description4.copyWith(
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                            color: ColorConstant.fontColorOpacity100),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(() => PrivacyPolicyView());
                        },
                    ),
                  ])),
        ),
      ],
    );
  }
}
