import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/screens/home/home.dart';
import 'package:prime_video_flutter_ui_kit/utils/utils.dart';
import 'package:prime_video_flutter_ui_kit/widgets/widgets.dart';

//ignore: must_be_immutable
class GoPremiumView extends StatelessWidget {
  const GoPremiumView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _mainBody(context),
      bottomNavigationBar: _bottomBar(context),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: Text(
        StringConstant.subscribeTitle,
        style: StyleConstants.description2
            .copyWith(color: ColorConstant.fontColorOpacity100),
      ),
    );
  }

  _bottomBar(BuildContext context) {
    GoPremiumController goPremiumController = Get.put(GoPremiumController());
    return Padding(
      padding: horizontalPadding().copyWith(
          bottom: PrimeSizeConfig.displayHeight(context) *
              SizeConstant.opacity0point03),
      child: PrimeElevatedButton(
        onPressed: () => Get.to(() => ConfirmDetailsView(
              item: goPremiumController.selectedIndex.value,
            )),
        child: Text(
          StringConstant.subscribeNow,
          style: StyleConstants.button,
        ),
      ),
    );
  }

  Widget _mainBody(BuildContext context) {
    GoPremiumController goPremiumController = Get.put(GoPremiumController());
    return ListView(
      shrinkWrap: true,
      padding: horizontalPadding(),
      children: [
        const SizedBox(height: SizeConstant.appSize22),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              StringConstant.selectYourPlan,
              style: StyleConstants.description1,
            ),
            Text(
              StringConstant.mobileStaticText,
              style: StyleConstants.commonStyle.copyWith(
                  color: ColorConstant.fontColorOpacity100,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(height: SizeConstant.appSize10),
        ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var item = goPremiumController.subscribeList[index];
              return SubScribeTile(item: item, index: index);
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: SizeConstant.appSize10,
                ),
            itemCount: goPremiumController.subscribeList.length)
      ],
    );
  }
}
