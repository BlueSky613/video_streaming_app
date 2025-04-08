import 'package:flutter/material.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';

class PrimeFontFamily {
  static const String outfit = "Outfit";
}

class StyleConstants {
  static TextStyle commonStyle = TextStyle(
      fontFamily: PrimeFontFamily.outfit,
      fontSize: 14,
      color: ColorConstant.fontColorOpacity80,
      fontWeight: FontWeight.normal);

  static TextStyle heading1 = TextStyle(
      fontFamily: PrimeFontFamily.outfit,
      fontSize: 30,
      color: ColorConstant.fontColorOpacity80,
      fontWeight: FontWeight.bold);

  static TextStyle heading24Style = const TextStyle(
      fontFamily: PrimeFontFamily.outfit,
      fontSize: 24,
      color: ColorConstant.fontColorOpacity100,
      fontWeight: FontWeight.w700);

  static TextStyle heading22Style = const TextStyle(
      fontFamily: PrimeFontFamily.outfit,
      fontSize: 22,
      color: ColorConstant.fontColorOpacity100,
      fontWeight: FontWeight.w700);

  static TextStyle headingOTPTestStyle = const TextStyle(
      fontFamily: PrimeFontFamily.outfit,
      fontSize: 28,
      color: ColorConstant.fontColorOpacity100,
      fontWeight: FontWeight.w700);

  static TextStyle heading20Size = const TextStyle(
      fontFamily: PrimeFontFamily.outfit,
      fontSize: 20,
      color: ColorConstant.fontColorOpacity100,
      fontWeight: FontWeight.w700);

  static TextStyle heading2 = TextStyle(
      fontFamily: PrimeFontFamily.outfit,
      fontSize: 18,
      color: ColorConstant.fontColorOpacity80,
      fontWeight: FontWeight.bold);

  static TextStyle description1 = const TextStyle(
      fontFamily: PrimeFontFamily.outfit,
      fontSize: 18,
      color: ColorConstant.fontColorOpacity100,
      fontWeight: FontWeight.w500);

  static TextStyle description2 = TextStyle(
      fontFamily: PrimeFontFamily.outfit,
      fontSize: 16,
      color: ColorConstant.fontColorOpacity80,
      fontWeight: FontWeight.w500);

  static TextStyle description3 = TextStyle(
      fontFamily: PrimeFontFamily.outfit,
      fontSize: 14,
      color: ColorConstant.fontColorOpacity80,
      fontWeight: FontWeight.normal);

  static TextStyle description4 = TextStyle(
      fontFamily: PrimeFontFamily.outfit,
      fontSize: 12,
      color: ColorConstant.fontColorOpacity80,
      fontWeight: FontWeight.w500);

  static TextStyle button = TextStyle(
      fontFamily: PrimeFontFamily.outfit,
      fontSize: 14,
      color: ColorConstant.fontColorOpacity80,
      fontWeight: FontWeight.w700);

  static InputDecoration kTextFieldDecoration(
          {String? hintText,
          Widget? prefix,
          Widget? suffix,
          bool? showCounter,
          double? borderRadius,
          bool? filled,
          Color? fillColor}) =>
      InputDecoration(
        prefixIcon: prefix,
        suffixIcon: suffix,
        isDense: true,
        filled: filled,
        fillColor: fillColor,
        counterText: (showCounter ?? false) ? null : '',
        label: Text(
          hintText ?? '',
          maxLines: SizeConstant.appSize1.toInt(),
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: SizeConstant.appSize16,
              fontWeight: FontWeight.w400,
              color: ColorConstant.backgroundColor.withOpacity(.42)
              //  color: ColorConstant.fontColorOpacity80,
              ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintStyle: TextStyle(
          fontSize: SizeConstant.appSize16,
          fontWeight: FontWeight.w400,
          color: ColorConstant.backgroundColor.withOpacity(.42),
        ),
        errorStyle: const TextStyle(
          color: ColorConstant.redColor,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 12.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorConstant.fontColorOpacity80, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 12.0)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: ColorConstant.redColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 12.0)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: ColorConstant.redColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 12.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorConstant.fontColorOpacity80, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 12.0)),
        ),
      );

  /// Returns a standardized [InputDecoration] for square-shaped text fields.
  static InputDecoration kSqTextFieldDecoration(
          {String? hintText,
          Widget? prefix,
          Widget? suffix,
          bool? showCounter,
          bool? filled,
          Color? fillColor}) =>
      InputDecoration(
        prefixIcon: prefix,
        suffixIcon: suffix,
        counterText: (showCounter ?? false) ? null : '',
        filled: filled,
        fillColor: fillColor,
        label: Text(
          hintText ?? '',
          style: TextStyle(
            color: ColorConstant.fontColorOpacity80,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintStyle: TextStyle(
          color: ColorConstant.fontColorOpacity80,
        ),
        errorStyle: const TextStyle(
          color: ColorConstant.redColor,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(2.0),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            //color: ColorConstant.kLightBorder,
            color: Colors.grey,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(2.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorConstant.fontColorOpacity80,
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(2.0),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorConstant.redColor, width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(2.0),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorConstant.redColor, width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(2.0),
          ),
        ),
      );

  /// Returns a standardized [InputDecoration] for text fields with an underline design.
  static InputDecoration kUnderLineTextFieldDecoration(
          {String? hintText,
          Widget? prefix,
          Widget? suffix,
          BoxConstraints? prefixIconConstraints}) =>
      InputDecoration(
        prefixIcon: prefix,
        suffix: suffix,
        prefixIconConstraints:
            prefixIconConstraints ?? const BoxConstraints(maxHeight: 40),
        hintText: hintText ?? '',
        hintStyle: TextStyle(
          color: ColorConstant.fontColorOpacity80,
        ),
        errorStyle: const TextStyle(
          color: ColorConstant.redColor,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        border: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: ColorConstant.fontColorOpacity80, width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(2.0)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: ColorConstant.fontColorOpacity80, width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(2.0)),
        ),
      );
}
