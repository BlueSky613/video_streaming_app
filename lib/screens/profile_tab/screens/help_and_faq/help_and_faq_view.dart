import 'package:flutter/material.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/utils/utilities.dart';

class HelpAndFaqView extends StatelessWidget {
  const HelpAndFaqView({super.key});

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
        StringConstant.helpAndFaqs,
        style: StyleConstants.heading20Size,
      ),
    );
  }

  Widget _mainBody(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: horizontalPadding(),
      children: [
        Text(
          StringConstant.frequentlyAskedQuestion,
          style: StyleConstants.description2.copyWith(
              color: ColorConstant.fontColorOpacity100,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: SizeConstant.appSize26),
        titleText(StringConstant.bulletTxt(1), StringConstant.helpTitleTxt1),
        const SizedBox(height: SizeConstant.appSize18),
        expansionTileWidget(
            StringConstant.questionBulletTxt(1), StringConstant.help1TitleQ1),
        expansionTileWidget(
            StringConstant.questionBulletTxt(2), StringConstant.help1TitleQ2),
        expansionTileWidget(
            StringConstant.questionBulletTxt(3), StringConstant.help1TitleQ3),
        expansionTileWidget(
            StringConstant.questionBulletTxt(4), StringConstant.help1TitleQ4),
        const SizedBox(height: SizeConstant.appSize26),
        titleText(StringConstant.bulletTxt(2), StringConstant.helpTitleTxt2),
        const SizedBox(height: SizeConstant.appSize18),
        expansionTileWidget(
            StringConstant.questionBulletTxt(1), StringConstant.help2TitleQ1),
        expansionTileWidget(
            StringConstant.questionBulletTxt(2), StringConstant.help2TitleQ2),
        const SizedBox(height: SizeConstant.appSize26),
        titleText(StringConstant.bulletTxt(3), StringConstant.helpTitleTxt3),
        const SizedBox(height: SizeConstant.appSize18),
        expansionTileWidget(
            StringConstant.questionBulletTxt(1), StringConstant.help3TitleQ1),
        expansionTileWidget(
            StringConstant.questionBulletTxt(2), StringConstant.help3TitleQ2),
        expansionTileWidget(
            StringConstant.questionBulletTxt(3), StringConstant.help3TitleQ3),
        expansionTileWidget(
            StringConstant.questionBulletTxt(4), StringConstant.help3TitleQ4),
        expansionTileWidget(
            StringConstant.questionBulletTxt(5), StringConstant.help3TitleQ5),
        expansionTileWidget(
            StringConstant.questionBulletTxt(6), StringConstant.help3TitleQ6),
        const SizedBox(height: SizeConstant.appSize18),
      ],
    );
  }

  Widget expansionTileWidget(String questionBullet, String question) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: SizeConstant.appSize6),
      child: ExpansionTile(
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConstant.appSize8),
          side: BorderSide(color: ColorConstant.fontColorOpacity20),
        ),
        iconColor: ColorConstant.fontColorOpacity100,
        leading: Text(
          questionBullet.trim(),
          style: StyleConstants.commonStyle.copyWith(
              color: ColorConstant.fontColorOpacity100,
              fontWeight: FontWeight.w400),
        ),
        dense: true,
        collapsedIconColor: ColorConstant.fontColorOpacity100,
        collapsedBackgroundColor: ColorConstant.subscribeBgColor,
        backgroundColor: ColorConstant.subscribeBgColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeConstant.appSize8),
            side: BorderSide(color: ColorConstant.fontColorOpacity20)),
        title: Text(
          question,
          style: StyleConstants.commonStyle.copyWith(
              color: ColorConstant.fontColorOpacity100,
              fontWeight: FontWeight.w400),
        ),
        childrenPadding: const EdgeInsets.all(SizeConstant.appSize8),
        tilePadding:
            const EdgeInsets.symmetric(horizontal: SizeConstant.appSize8),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          Text(
            StringConstant.helpTitleAnswer,
            style: StyleConstants.commonStyle.copyWith(
                color: ColorConstant.fontColorOpacity60,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }

  Widget titleText(String bulletName, String name) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(bulletName.trimLeft(),
            style: StyleConstants.commonStyle.copyWith(
                fontWeight: FontWeight.w500,
                color: ColorConstant.fontColorOpacity60)),
        Expanded(
          child: Text(name,
              style: StyleConstants.commonStyle.copyWith(
                  fontWeight: FontWeight.w500,
                  color: ColorConstant.fontColorOpacity60)),
        ),
      ],
    );
  }
}
