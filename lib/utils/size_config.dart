import 'package:flutter/material.dart';

class PrimeSizeConfig {
  static displayHeight(context) => MediaQuery.sizeOf(context).height;
  static displayWidth(context) => MediaQuery.sizeOf(context).width;
}
