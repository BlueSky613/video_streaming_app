import 'package:flutter/material.dart';

class TabBarModel {
  String name;
  String icon;
  Widget? page;
  TabBarModel({required this.name, required this.icon, this.page});
}
