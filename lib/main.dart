import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prime_video_flutter_ui_kit/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}
