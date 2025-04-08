import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/screens/login/login.dart';
import 'package:prime_video_flutter_ui_kit/utils/utils.dart';
import 'package:prime_video_flutter_ui_kit/widgets/button.dart';

class WelcomeViewScreen extends StatelessWidget {
  const WelcomeViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _mainBody(context),
      bottomNavigationBar: const BottomBarWidget(),
    );
  }

  Widget _mainBody(BuildContext context) {
    return SizedBox(
      height:
          PrimeSizeConfig.displayHeight(context) * SizeConstant.opacity0point9,
      child: Stack(
        children: [
          Image.asset(
            AssetsConstant.welcomeImg,
            fit: BoxFit.fill,
            width: PrimeSizeConfig.displayWidth(context),
            height: PrimeSizeConfig.displayHeight(context),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: SizeConstant.appSize100,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [
                    SizeConstant.opacity0,
                    SizeConstant.opacity0point75,
                    SizeConstant.appSize1
                  ],
                      colors: [
                    ColorConstant.backgroundColor
                        .withOpacity(SizeConstant.opacity0),
                    ColorConstant.backgroundColor
                        .withOpacity(SizeConstant.appSize1),
                    ColorConstant.backgroundColor
                        .withOpacity(SizeConstant.appSize1),
                  ])),
            ),
          )
        ],
      ),
    );
  }
}

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: horizontalPadding().copyWith(
          bottom: PrimeSizeConfig.displayHeight(context) *
              SizeConstant.opacity0point05),
      child: PrimeElevatedButton(
        onPressed: () => Get.to(() => LoginView()),
        child: Text(
          StringConstant.getStarted,
          style: StyleConstants.button,
        ),
      ),
    );
  }
}
