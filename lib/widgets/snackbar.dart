import 'package:flutter/material.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';

SnackBar primeSnackBar(
        {EdgeInsetsGeometry? margin,
        double? height,
        double? width,
        Color? borderColor,
        required String msg}) =>
    SnackBar(
        elevation: SizeConstant.opacity0,
        backgroundColor: Colors.transparent,
        content: Container(
          alignment: Alignment.center,
          height: height ?? SizeConstant.appSize37,
          width: width ?? SizeConstant.appSize271,
          margin: margin ??
              const EdgeInsets.symmetric(
                  horizontal: SizeConstant.appSize18,
                  vertical: SizeConstant.appSize10),
          decoration: BoxDecoration(
              color: ColorConstant.fontColorOpacity100,
              borderRadius: BorderRadius.circular(SizeConstant.appSize10)),
          child: Text(
            msg,
            style: StyleConstants.commonStyle.copyWith(
                fontWeight: FontWeight.w500,
                color: ColorConstant.snackBarTextColor),
          ),
        ));
