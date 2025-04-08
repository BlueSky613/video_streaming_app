import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/utils/utils.dart';

class PrimeTextField extends StatelessWidget {
  const PrimeTextField(
      {super.key,
      this.hintText,
      this.controller,
      this.isObscured = false,
      this.readOnly = false,
      this.isRounded = false,
      this.validator,
      this.keyboardType,
      this.prefix,
      this.suffix,
      this.onChanged,
      this.onFieldSubmitted,
      this.width,
      this.maxLength,
      this.autoValidateMode,
      this.textInputAction,
      this.maxLines,
      this.showCounter,
      this.inputFormatters,
      this.focusNode,
      this.onTap,
      this.textAlign,
      this.fillColor,
      this.filled,
      this.borderRadius,
      this.style,
      this.prefixIconConstraints});

  /// The text displayed when the field is empty.
  final String? hintText;

  /// Controller for interacting with the text field.
  final TextEditingController? controller;

  /// Callback triggered when the text in the field changes.
  final void Function(String)? onChanged;

  /// validation of the textFiled.
  final String? Function(String?)? validator;

  /// Callback triggered when the user submits the field.
  final void Function(String)? onFieldSubmitted;

  /// Determines whether the text should be obscured (e.g., for passwords).
  final bool isObscured;

  /// Custom widget to be displayed before the input.
  final Widget? prefix;

  /// Custom widget to be displayed after the input.
  final Widget? suffix;

  /// Sets the field to read-only mode if true.
  final bool readOnly;

  /// Width of the text field. If not specified, it takes the screen width.
  final double? width;

  /// Determines whether the text field has a rounded appearance.
  final bool isRounded;

  ///Keyboard text input action
  final TextInputType? keyboardType;

  ///Maximum text length
  final int? maxLength;

  ///Auto Validation mode
  final AutovalidateMode? autoValidateMode;

  ///Input action
  final TextInputAction? textInputAction;

  ///max lines
  final int? maxLines;

  /// shows the counter for character
  final bool? showCounter;

  final List<TextInputFormatter>? inputFormatters;

  final FocusNode? focusNode;

  final VoidCallback? onTap;

  final TextAlign? textAlign;

  final Color? fillColor;

  final bool? filled;

  final double? borderRadius;

  final TextStyle? style;

  final BoxConstraints? prefixIconConstraints;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? PrimeSizeConfig.displayWidth(context),
      child: TextFormField(
        onTap: onTap,
        focusNode: focusNode,
        readOnly: readOnly,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        onFieldSubmitted: onFieldSubmitted,
        cursorColor: ColorConstant.fontColorOpacity100,
        obscureText: isObscured,
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
        maxLength: maxLength,
        maxLines: maxLines,
        autovalidateMode: autoValidateMode,
        textInputAction: textInputAction,
        textAlign: textAlign ?? TextAlign.start,
        style: style ??
            StyleConstants.description2.copyWith(
                fontWeight: FontWeight.w400,
                color: ColorConstant.fontColorOpacity100),
        decoration: isRounded
            ? StyleConstants.kTextFieldDecoration(
                hintText: hintText,
                prefix: prefix,
                suffix: suffix,
                showCounter: showCounter,
                fillColor: fillColor,
                borderRadius: borderRadius,
                filled: filled)
            : StyleConstants.kUnderLineTextFieldDecoration(
                hintText: hintText,
                prefix: prefix,
                suffix: suffix,
                prefixIconConstraints: prefixIconConstraints),
      ),
    );
  }
}
