import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/screens/bottom_bar/bottom_bar.dart';
import 'package:prime_video_flutter_ui_kit/screens/my_list_tab/my_list_tab.dart';
import 'package:prime_video_flutter_ui_kit/utils/utilities.dart';

class MyListTabView extends StatelessWidget {
  const MyListTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: _appBar(context),
        body: _mainBody(context),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    MyListTabController myListTabController = Get.put(MyListTabController());
    return AppBar(
      title: Padding(
        padding: horizontalPadding(),
        child: Text(
          StringConstant.myListTxt,
          style: StyleConstants.heading20Size,
        ),
      ),
      actions: [
        Padding(
          padding: horizontalPadding(),
          child: GestureDetector(
            onTap: () {
              myListTabController.onTapEdit();
            },
            child: myListTabController.isDeleteShowing.value
                ? Text(
                    StringConstant.doneTxt,
                    style: StyleConstants.description2.copyWith(
                        fontWeight: FontWeight.w400,
                        color: ColorConstant.fontColorOpacity100),
                  )
                : Image.asset(AssetsConstant.editIcon,
                    scale: SizeConstant.appSize4),
          ),
        )
      ],
    );
  }

  Widget _mainBody(BuildContext context) {
    MyListTabController myListTabController = Get.put(MyListTabController());
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (item, result) {
        BottomBarController bottomBarController =
            Get.put(BottomBarController());
        bottomBarController.selectedIndex.value = SizeConstant.appSize0.toInt();
        bottomBarController.pageController!
            .jumpToPage(SizeConstant.appSize0.toInt());
      },
      child: Obx(
        () => GridView(
          shrinkWrap: true,
          padding: horizontalPadding(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: SizeConstant.appSize2.toInt(),
              mainAxisSpacing: SizeConstant.appSize20,
              crossAxisSpacing: SizeConstant.appSize20,
              mainAxisExtent: SizeConstant.appSize105),
          children: List.generate(myListTabController.moreLikeList.length, (i) {
            var item = myListTabController.moreLikeList[i];
            return Stack(
              children: [
                Image.asset(
                  item,
                  fit: BoxFit.fitWidth,
                ),
                if (myListTabController.isDeleteShowing.value) ...[
                  GestureDetector(
                    onTap: () {
                      myListTabController.onTapDelete(item);
                    },
                    child: Container(
                      color: ColorConstant.deleteBgIconColor,
                      alignment: Alignment.center,
                      child: Image.asset(
                        AssetsConstant.deleteIcon,
                        scale: SizeConstant.appSize4,
                      ),
                    ),
                  )
                ]
              ],
            );
          }, growable: true),
        ),
      ),
    );
  }
}
