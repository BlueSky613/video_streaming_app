import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/screens/otp_screen/otp_screen.dart';
import 'package:prime_video_flutter_ui_kit/utils/utils.dart';

//ignore: must_be_immutable
class OtpView extends StatelessWidget {
  const OtpView({super.key, required this.mobileText});
  final String mobileText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true),
      body: _mainBody(context),
    );
  }

  Widget _mainBody(BuildContext context) {
    OtpController otpController = Get.put(OtpController());
    return Obx(
      () => ListView(
        padding: horizontalPadding(),
        shrinkWrap: true,
        children: [
          const SizedBox(height: SizeConstant.appSize28),
          Text(StringConstant.verifyMobileNumber,
              style: StyleConstants.heading20Size),
          const SizedBox(height: SizeConstant.appSize10),
          RichText(
              text: TextSpan(
                  text: StringConstant.verifyMobileDescriptionTxt,
                  style: StyleConstants.description4.copyWith(
                      color: ColorConstant.fontColorOpacity70,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis),
                  children: [
                TextSpan(
                    text: mobileText,
                    style: StyleConstants.description4.copyWith(
                        fontWeight: FontWeight.w700,
                        color: ColorConstant.fontColorOpacity100)),
              ])),
          const SizedBox(height: SizeConstant.appSize90),
          SizedBox(
            width: double.infinity,
            child: Pinput(
              validator: (value) {
                if (value!.isEmpty) {
                  return StringConstant.pleaseEnterOtp;
                }
                return null;
              },
              length: SizeConstant.appSize4.toInt(),
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              controller: otpController.pinController,
              focusNode: otpController.focusNode,
              errorPinTheme: otpController.errorPinTheme,
              defaultPinTheme: otpController.defaultPinTheme,
              cursor: otpController.cursor,
              preFilledWidget: otpController.preFilledWidget,
              separatorBuilder: (index) =>
                  const SizedBox(width: SizeConstant.appSize30),
              focusedPinTheme: otpController.defaultPinTheme,
              showCursor: true,
            ),
          ),
          const SizedBox(height: SizeConstant.appSize22),
          if (otpController.countdown.value ==
              SizeConstant.appSize0.toInt()) ...[
            GestureDetector(
              onTap: () => otpController.startCountdown(),
              child: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: SizeConstant.appSize5),
                child: Text(StringConstant.resendOTP,
                    textAlign: TextAlign.center,
                    style: StyleConstants.description2.copyWith(
                        color: ColorConstant.fontColorOpacity100,
                        fontWeight: FontWeight.w400)),
              ),
            ),
          ] else ...[
            Container(
              alignment: Alignment.centerRight,
              child: Text(
                otpController.formattedCountdown,
                style: StyleConstants.description2.copyWith(
                    color: ColorConstant.primaryColor,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ],
      ),
    );
  }
}
