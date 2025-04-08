import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/screens/bottom_bar/bottom_bar.dart';
import 'package:prime_video_flutter_ui_kit/utils/utils.dart';
import 'package:prime_video_flutter_ui_kit/widgets/widgets.dart';

import '../home_screens.dart';

//ignore: must_be_immutable
class ConfirmDetailsView extends StatelessWidget {
  ConfirmDetailsView({super.key, required this.item});
  int item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _mainBody(context),
      bottomNavigationBar: const BottomBarWidget(),
    );
  }

  Widget _mainBody(BuildContext context) {
    GoPremiumController goPremiumController = Get.put(GoPremiumController());
    ConfirmDetailsController confirmDetailsController =
        Get.put(ConfirmDetailsController());
    return ListView(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: horizontalPadding(),
      children: [
        const SizedBox(height: SizeConstant.appSize22),
        SubScribeTile(
            item: goPremiumController.subscribeList[item], index: item),
        const SizedBox(height: SizeConstant.appSize14),
        GestureDetector(
          onTap: () => Get.back(),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              StringConstant.changePlan,
              style: StyleConstants.commonStyle.copyWith(
                  color: ColorConstant.fontColorOpacity100,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const SizedBox(height: SizeConstant.appSize26),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(
              () => SizedBox(
                height: SizeConstant.appSize35,
                width: SizeConstant.appSize18,
                child: Checkbox(
                  value: confirmDetailsController.agreeValue.value,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onChanged: (item) =>
                      confirmDetailsController.agreeValue.value = item!,
                  visualDensity: VisualDensity.standard,
                  checkColor: ColorConstant.whiteColor,
                  activeColor: ColorConstant.checkboxColor,
                ),
              ),
            ),
            const SizedBox(width: SizeConstant.appSize8),
            // Image.asset(AssetsConstant.checkBoxIcon,
            //     scale: SizeConstant.appSize5),
            Text(
              StringConstant.iAgree,
              style: StyleConstants.description4.copyWith(),
            )
          ],
        ),
        bottomText()
      ],
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: Text(
        StringConstant.confirmYourDetails,
        style: StyleConstants.description2
            .copyWith(color: ColorConstant.fontColorOpacity100),
      ),
    );
  }

  Widget bottomText() {
    return RichText(
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
                  color: ColorConstant.fontColorOpacity100)),
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
                  color: ColorConstant.fontColorOpacity100)),
        ]));
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
              SizeConstant.opacity0point03),
      child: PrimeElevatedButton(
        onPressed: () => Get.offAll(() => BottomBarView()),
        child: Text(
          StringConstant.payNow,
          style: StyleConstants.button,
        ),
      ),
    );
  }
}
