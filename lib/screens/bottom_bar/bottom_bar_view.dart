import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/screens/bottom_bar/bottom_bar.dart';

//ignore: must_be_immutable
class BottomBarView extends StatelessWidget {
  BottomBarView({super.key});

  BottomBarController bottomBarController = Get.put(BottomBarController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: _mainBody(context),
        bottomNavigationBar: _bottomBar(context),
      ),
    );
  }

  _mainBody(BuildContext context) {
    return PageView(
        controller: bottomBarController.pageController,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: List.generate(
            bottomBarController.bottomList.length,
            (i) =>
                bottomBarController.bottomList[i].page ??
                const SizedBox.shrink()));
  }

  Widget _bottomBar(BuildContext context) {
    TranslationController translationController =
        Get.put(TranslationController());
    return Padding(
      padding: const EdgeInsets.all(SizeConstant.appSize10),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeConstant.appSize15)),
        child: AnimatedContainer(
            duration: Duration(milliseconds: SizeConstant.appSize400.toInt()),
            height: SizeConstant.appSize75,
            padding:
                const EdgeInsets.symmetric(horizontal: SizeConstant.appSize8),
            decoration: BoxDecoration(
                color: ColorConstant.bottomBarBgColor,
                borderRadius: BorderRadius.circular(SizeConstant.appSize15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
                  List.generate(bottomBarController.bottomList.length, (i) {
                var item = bottomBarController.bottomList[i];
                return InkWell(
                  onTap: () {
                    bottomBarController.pageController!.jumpToPage(i);
                    bottomBarController.selectTaBPressed(i);
                  },
                  child: AnimatedContainer(
                    duration:
                        Duration(milliseconds: SizeConstant.appSize400.toInt()),
                    padding: const EdgeInsets.all(SizeConstant.appSize8),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(item.icon,
                              scale: SizeConstant.appSize4,
                              color:
                                  bottomBarController.selectedIndex.value == i
                                      ? ColorConstant.fontColorOpacity100
                                      : ColorConstant.fontColorOpacity50),
                          const SizedBox(width: SizeConstant.appSize4),
                          Text(
                            translationController.translate(item.name),
                            style: StyleConstants.description4.copyWith(
                                fontWeight: FontWeight.w500,
                                color:
                                    bottomBarController.selectedIndex.value == i
                                        ? ColorConstant.fontColorOpacity100
                                        : ColorConstant.fontColorOpacity50),
                          ),
                        ]),
                  ),
                );
              }),
            )),
      ),
    );
  }
}
