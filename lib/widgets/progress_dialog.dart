import 'package:flutter/material.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';

Future primeCircularProgress(BuildContext context) {
  return showDialog(
      barrierColor: Colors.black87,
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: Colors.transparent,
            content: Center(
                child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: SizeConstant.appSize51,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: ColorConstant.fontColorOpacity40,
                          width: SizeConstant.appSize4)),
                ),
                const SizedBox(
                  height: SizeConstant.appSize49,
                  width: SizeConstant.appSize49,
                  child: CircularProgressIndicator(
                      strokeCap: StrokeCap.round,
                      color: ColorConstant.primaryColor),
                ),
              ],
            )),
          ));
}
