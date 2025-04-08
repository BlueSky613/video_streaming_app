import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';

var customTheme = ThemeData.light(useMaterial3: true).copyWith(
    primaryColor: ColorConstant.primaryColor,
    scaffoldBackgroundColor: ColorConstant.backgroundColor,
    disabledColor: ColorConstant.fontColorOpacity12,
    dialogBackgroundColor: ColorConstant.dialogBgColor,
    dividerColor: ColorConstant.fontColorOpacity100.withOpacity(0.2),
    dialogTheme: const DialogTheme(
      backgroundColor: ColorConstant.dialogBgColor,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
        linearMinHeight: SizeConstant.appSize1,
        color: ColorConstant.primaryColor,
        linearTrackColor: ColorConstant.fontColorOpacity12),
    dividerTheme: DividerThemeData(
        color: ColorConstant.fontColorOpacity100.withOpacity(0.2),
        thickness: SizeConstant.opacity0point3),
    platform: TargetPlatform.iOS,
    iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
            iconColor:
                WidgetStatePropertyAll(ColorConstant.fontColorOpacity100))),
    tabBarTheme: TabBarTheme(
        labelColor: ColorConstant.fontColorOpacity100,
        labelStyle:
            StyleConstants.commonStyle.copyWith(fontWeight: FontWeight.w400),
        dividerColor: ColorConstant.iridiumColor,
        indicatorColor: ColorConstant.primaryColor,
        unselectedLabelColor: ColorConstant.fontColorOpacity60,
        overlayColor: WidgetStatePropertyAll(ColorConstant.iridiumColor
            .withOpacity(SizeConstant.opacity0point2)),
        indicatorSize: TabBarIndicatorSize.tab),
    switchTheme: const SwitchThemeData(
      thumbColor: WidgetStatePropertyAll(ColorConstant.whiteColor),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      trackColor: WidgetStatePropertyAll(ColorConstant.primaryColor),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: ColorConstant.fontColorOpacity100,
      inactiveTrackColor: ColorConstant.fontColorOpacity12,
      trackShape: const RoundedRectSliderTrackShape(),
      thumbColor: Colors.white,
      thumbShape: SliderComponentShape.noOverlay,
      trackHeight: 1,
      overlayShape: SliderComponentShape.noThumb,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      overlayColor: ColorConstant.fontColorOpacity12,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConstant.appSize10)),
      backgroundColor: ColorConstant.primaryColor,
    )),
    radioTheme: const RadioThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        fillColor: WidgetStatePropertyAll(ColorConstant.fontColorOpacity100)),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            overlayColor: WidgetStatePropertyAll(ColorConstant.fontColorOpacity40
                .withOpacity(SizeConstant.opacity0point2)),
            elevation: const WidgetStatePropertyAll(3.0),
            textStyle: WidgetStatePropertyAll(StyleConstants.commonStyle
                .copyWith(color: ColorConstant.fontColorOpacity100)))),
    dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorConstant.fontColorOpacity100, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorConstant.redColor, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorConstant.redColor, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorConstant.fontColorOpacity100, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
        ),
        menuStyle: const MenuStyle(
          backgroundColor:
              WidgetStatePropertyAll(ColorConstant.backgroundColor),
        ),
        textStyle: StyleConstants.description2
            .copyWith(color: ColorConstant.fontColorOpacity100)),
    cardTheme: CardTheme(
        color: ColorConstant.backgroundColor,
        elevation: SizeConstant.opacity0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
    bottomSheetTheme: BottomSheetThemeData(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(SizeConstant.appSize20),
              topRight: Radius.circular(SizeConstant.appSize20))),
      backgroundColor: ColorConstant.dialogBgColor,
      showDragHandle: true,
      dragHandleColor: ColorConstant.fontTxtColor.withOpacity(.3),
      dragHandleSize: const Size(SizeConstant.appSize31, SizeConstant.appSize3),
    ),
    cardColor: ColorConstant.backgroundColor,
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      titleSpacing: SizeConstant.opacity0,
      scrolledUnderElevation: SizeConstant.opacity0,
      backgroundColor: Colors.transparent,
      systemOverlayStyle:
          SystemUiOverlayStyle.light, // for status bar color changed Auto
      elevation: SizeConstant.opacity0,
    ),
    textTheme: TextTheme(
      bodyLarge: StyleConstants.commonStyle.copyWith(fontSize: 16),
      bodyMedium: StyleConstants.commonStyle.copyWith(fontSize: 14),
      bodySmall: StyleConstants.commonStyle.copyWith(fontSize: 12),
      displayLarge: StyleConstants.commonStyle.copyWith(fontSize: 57),
      displayMedium: StyleConstants.commonStyle.copyWith(fontSize: 45),
      displaySmall: StyleConstants.commonStyle.copyWith(fontSize: 36),
      headlineLarge: StyleConstants.commonStyle.copyWith(fontSize: 32),
      headlineSmall: StyleConstants.commonStyle.copyWith(fontSize: 24),
      headlineMedium: StyleConstants.commonStyle.copyWith(fontSize: 28),
      labelLarge: StyleConstants.commonStyle.copyWith(fontSize: 14),
      labelMedium: StyleConstants.commonStyle.copyWith(fontSize: 12),
      labelSmall: StyleConstants.commonStyle.copyWith(fontSize: 11),
      titleLarge: StyleConstants.commonStyle.copyWith(fontSize: 22),
      titleMedium: StyleConstants.commonStyle.copyWith(fontSize: 16),
      titleSmall: StyleConstants.commonStyle.copyWith(fontSize: 14),
    ),
    buttonTheme: ButtonThemeData(
      disabledColor: ColorConstant.iridiumColor,
      buttonColor: ColorConstant.primaryColor,
      colorScheme: ThemeData.light().colorScheme,
    ));
