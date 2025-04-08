import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/screens/home/home.dart';
import 'package:prime_video_flutter_ui_kit/utils/utils.dart';

class HotRightNowView extends StatelessWidget {
  const HotRightNowView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _mainBody(context),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        StringConstant.hotRightNow,
        style: StyleConstants.heading20Size,
      ),
    );
  }

  Widget _mainBody(BuildContext context) {
    HotRightNowController hotRightNowController =
        Get.put(HotRightNowController());
    return GridView(
      padding: horizontalPadding(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: SizeConstant.appSize2.toInt(),
          mainAxisExtent: SizeConstant.appSize234,
          mainAxisSpacing: SizeConstant.appSize20,
          crossAxisSpacing: SizeConstant.appSize20),
      children:
          List.generate(hotRightNowController.hotRightNowList.length, (i) {
        var item = hotRightNowController.hotRightNowList[i];
        return Image.asset(
          item,
          fit: BoxFit.fill,
        );
      }),
    );
  }
}
