import 'package:flutter/material.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/utils/utils.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: mainBody(context),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        StringConstant.privacyPolicyTxt,
        style: StyleConstants.heading20Size,
      ),
    );
  }

  Widget mainBody(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: horizontalPadding(),
      children: [
        customTextTile(StringConstant.termsDescription1),
        customBulletText(
            StringConstant.bulletTxt(1), StringConstant.termsPoint1),
        customBulletText(
            StringConstant.bulletTxt(2), StringConstant.termsPoint2),
        customBulletText(
            StringConstant.bulletTxt(3), StringConstant.termsPoint3),
        customBulletText(
            StringConstant.bulletTxt(4), StringConstant.termsPoint4),
        customBulletText(
            StringConstant.bulletTxt(5), StringConstant.termsPoint5),
        customBulletText(
            StringConstant.bulletTxt(6), StringConstant.termsPoint6),
        customTextTile(StringConstant.termsDescription2),
        customTextTile(StringConstant.termsDescription3),
        customTextTile(StringConstant.termsDescription4),
        customTextTile(StringConstant.termsDescription5),
        customBulletText(
            StringConstant.bulletTxt(1), StringConstant.termsPoint11),
        customBulletText(
            StringConstant.bulletTxt(2), StringConstant.termsPoint12),
        customBulletText(
            StringConstant.bulletTxt(3), StringConstant.termsPoint13),
        customBulletText(
            StringConstant.bulletTxt(4), StringConstant.termsPoint14),
        customBulletText(
            StringConstant.bulletTxt(5), StringConstant.termsPoint15),
        customBulletText(
            StringConstant.bulletTxt(6), StringConstant.termsPoint16),
        customTextTile(StringConstant.termsDescription6),
        customTextTile(StringConstant.termsDescription7),
        customTextTile(StringConstant.termsDescription8),
        customBulletText(StringConstant.dotBullet, StringConstant.termsPoint21),
        customBulletText(StringConstant.dotBullet, StringConstant.termsPoint22),
        customBulletText(StringConstant.dotBullet, StringConstant.termsPoint23),
        textRich(
            StringConstant.termsDescription9,
            StringConstant.termsDescription10,
            StringConstant.termsDescription11),
        const SizedBox(height: SizeConstant.appSize18)
      ],
    );
  }

  Widget textRich(String first, String second, String third) {
    return Text.rich(TextSpan(
        text: first,
        style: StyleConstants.commonStyle.copyWith(
            color: ColorConstant.fontColorOpacity100,
            fontWeight: FontWeight.w400),
        children: [
          TextSpan(
            text: second,
            style: StyleConstants.commonStyle.copyWith(
                decoration: TextDecoration.underline,
                color: ColorConstant.fontColorOpacity100,
                fontWeight: FontWeight.w400),
          ),
          TextSpan(
            text: third,
            style: StyleConstants.commonStyle.copyWith(
                color: ColorConstant.fontColorOpacity100,
                fontWeight: FontWeight.w400),
          ),
        ]));
  }

  Widget customBulletText(String title, String name) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: StyleConstants.commonStyle.copyWith(
              color: ColorConstant.fontColorOpacity100,
              fontWeight: FontWeight.w400),
        ),
        Expanded(
          child: Text(
            name,
            style: StyleConstants.commonStyle.copyWith(
                color: ColorConstant.fontColorOpacity100,
                fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }

  Widget customTextTile(String text) {
    return Text(
      text,
      style: StyleConstants.commonStyle.copyWith(
          color: ColorConstant.fontColorOpacity100,
          fontWeight: FontWeight.w400),
    );
  }
}
