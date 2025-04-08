import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/screens/bottom_bar/bottom_bar.dart';
import 'package:prime_video_flutter_ui_kit/screens/profile_tab/screens/my_download/my_download.dart';
import 'package:prime_video_flutter_ui_kit/utils/utils.dart';
import 'package:prime_video_flutter_ui_kit/widgets/widgets.dart';

class MyDownloadView extends StatelessWidget {
  const MyDownloadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: _appBar(context),
          bottomNavigationBar: _bottomBar(context),
          body: _mainBody(context),
        ));
  }

  Widget? _bottomBar(BuildContext context) {
    MyDownloadController myDownloadController = Get.put(MyDownloadController());
    return myDownloadController.isShowing.value
        ? Padding(
            padding: horizontalPadding().copyWith(
                bottom: PrimeSizeConfig.displayHeight(context) *
                    SizeConstant.opacity0point03,
                top: PrimeSizeConfig.displayHeight(context) *
                    SizeConstant.opacity0point02),
            child: PrimeElevatedButton(
              onPressed: () => Get.offAll(() => BottomBarView()),
              child: Text(
                StringConstant.findMoreToDownloads,
                style: StyleConstants.button,
              ),
            ),
          )
        : null;
  }

  AppBar? _appBar(BuildContext context) {
    MyDownloadController myDownloadController = Get.put(MyDownloadController());
    return myDownloadController.isShowing.value
        ? AppBar(
            title: Text(
              StringConstant.downloads,
              style: StyleConstants.heading20Size,
            ),
            actions: [
              Padding(
                padding: horizontalPadding(),
                child: GestureDetector(
                  onTap: () {
                    myDownloadController.onTapEdit();
                  },
                  child: myDownloadController.isDeleteShowing.value
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
          )
        : null;
  }

  Widget _mainBody(BuildContext context) {
    MyDownloadController myDownloadController = Get.put(MyDownloadController());
    if (myDownloadController.isShowing.value) {
      return listWidget(context);
    } else {
      return noDownloadFound(context);
    }
  }

  Widget listWidget(BuildContext context) {
    MyDownloadController myDownloadController = Get.put(MyDownloadController());
    return ListView.separated(
        shrinkWrap: true,
        padding: horizontalPadding(),
        itemBuilder: (context, index) {
          var item = myDownloadController.downloadList[index];
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: SizeConstant.appSize86,
                width: SizeConstant.appSize170,
                child: Stack(
                  children: [
                    Image.asset(
                      item.icon,
                      fit: BoxFit.fitWidth,
                    ),
                    if (myDownloadController.isDeleteShowing.value &&
                        index != SizeConstant.opacity0.toInt()) ...[
                      GestureDetector(
                        onTap: () {
                          myDownloadController.onTapDelete(item);
                          ScaffoldMessenger.of(context).showSnackBar(
                              primeSnackBar(
                                  msg: StringConstant
                                      .successfullyRemoveFromDownloadMsg));
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
                ),
              ),
              const SizedBox(width: SizeConstant.appSize14),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.movieName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: SizeConstant.appSize2.toInt(),
                    style: StyleConstants.commonStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        color: ColorConstant.fontColorOpacity100),
                  ),
                  Text(
                    item.movieDescription,
                    overflow: TextOverflow.ellipsis,
                    style: StyleConstants.commonStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConstant.appSize12,
                        color: ColorConstant.fontColorOpacity60),
                  ),
                ],
              )),
              if (index == SizeConstant.appSize0.toInt()) ...[
                GestureDetector(
                  onTap: () => Get.to(() => const EpisodeView()),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: PrimeSizeConfig.displayHeight(context) *
                            SizeConstant.opacity0point04),
                    child: Image.asset(AssetsConstant.forwardIcon,
                        scale: SizeConstant.appSize4),
                  ),
                )
              ]
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: SizeConstant.appSize22,
            ),
        itemCount: myDownloadController.downloadList.length);
  }

  Widget noDownloadFound(BuildContext context) {
    return Center(
      child: Padding(
        padding: horizontalPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsConstant.downloadBigIcon,
              scale: SizeConstant.appSize4,
            ),
            const SizedBox(height: SizeConstant.appSize8),
            Text(
              StringConstant.downloadDescription,
              textAlign: TextAlign.center,
              style: StyleConstants.commonStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  color: ColorConstant.fontColorOpacity60),
            ),
            const SizedBox(height: SizeConstant.appSize24),
            Text(
              StringConstant.findVideoToDownload,
              textAlign: TextAlign.center,
              style: StyleConstants.description2.copyWith(
                  color: ColorConstant.fontColorOpacity100,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
