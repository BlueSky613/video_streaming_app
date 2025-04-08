import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/screens/bottom_bar/bottom_bar.dart';
import 'package:prime_video_flutter_ui_kit/widgets/progress_dialog.dart';

class OtpController extends GetxController {
  TextEditingController pinController = TextEditingController();
  final focusNode = FocusNode();

  final errorPinTheme = PinTheme(
    width: SizeConstant.appSize50,
    height: SizeConstant.appSize54,
    textStyle: StyleConstants.description1
        .copyWith(fontWeight: FontWeight.w400, color: ColorConstant.redColor),
    decoration: const BoxDecoration(),
  );

  final defaultPinTheme = PinTheme(
    width: SizeConstant.appSize56,
    height: SizeConstant.appSize56,
    textStyle: StyleConstants.headingOTPTestStyle,
    decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(color: ColorConstant.fontColorOpacity40))),
  );

  final cursor = Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        width: SizeConstant.appSize56,
        height: SizeConstant.appSize3,
        decoration: BoxDecoration(
          color: ColorConstant.fontColorOpacity40,
          borderRadius: BorderRadius.circular(SizeConstant.appSize8),
        ),
      ),
    ],
  );
  final preFilledWidget = Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        width: SizeConstant.appSize56,
        height: SizeConstant.appSize1,
        decoration: BoxDecoration(
          color: ColorConstant.fontColorOpacity40,
          borderRadius: BorderRadius.circular(SizeConstant.appSize8),
        ),
      ),
    ],
  );

  RxInt countdown = SizeConstant.appSize60.toInt().obs;
  Timer? timer;

  BuildContext get context => Get.context as BuildContext;

  @override
  void onInit() {
    super.onInit();
    startCountdown();
    Future.delayed(Duration(seconds: SizeConstant.appSize3.toInt()), () {
      pinController.text = (1000 + Random().nextInt(9000)).toString();
      if (pinController.text.isNotEmpty) {
        primeCircularProgress(context);
      }
      update();
    });
    Future.delayed(Duration(seconds: SizeConstant.appSize5.toInt()), () {
      Get.back();
      Get.offAll(() => BottomBarView());
      update();
    });
  }

  void startCountdown() {
    countdown.value = SizeConstant.appSize30.toInt();
    timer = Timer.periodic(Duration(seconds: SizeConstant.appSize1.toInt()),
        (timer) {
      if (countdown.value > SizeConstant.appSize0.toInt()) {
        countdown.value--;
      } else {
        timer.cancel();
      }
    });
    update();
  }

  String get formattedCountdown {
    int minutes = countdown.value ~/ SizeConstant.appSize60.toInt();
    int seconds = countdown.value % SizeConstant.appSize60.toInt();
    return '${_formatTimeComponent(minutes)}:${_formatTimeComponent(seconds)}';
  }

  String _formatTimeComponent(int time) {
    return time < SizeConstant.appSize10.toInt() ? '0$time' : '$time';
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }
}
