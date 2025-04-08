import 'package:flutter/material.dart';

extension ExtOnWidget on Widget {
  Widget tap(VoidCallback onTap) => GestureDetector(
        onTap: onTap,
        child: this,
      );

  Widget get center => Center(child: this);

  Widget primePadding(double? padding) =>
      Padding(padding: EdgeInsets.all(padding ?? 8.0), child: this);

  Widget primePaddingSymmetricHorizontal(double? padding) => Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? 8.0), child: this);

  Widget primePaddingSymmetricVertical(double? padding) => Padding(
      padding: EdgeInsets.symmetric(vertical: padding ?? 8.0), child: this);
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  String toCapitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
