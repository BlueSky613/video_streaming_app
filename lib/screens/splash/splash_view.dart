import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/screens/bottom_bar/bottom_bar_view.dart';
import 'package:prime_video_flutter_ui_kit/screens/bottom_bar/translation_controller.dart';
import 'package:prime_video_flutter_ui_kit/screens/splash/splash.dart';
import 'package:video_player/video_player.dart';

//ignore: must_be_immutable
class SplashViewScreen extends StatefulWidget {
  SplashViewScreen({super.key});

  @override
  State<SplashViewScreen> createState() => _SplashViewScreenState();
}

class _SplashViewScreenState extends State<SplashViewScreen> {
  SplashController splashController = Get.put(SplashController());
  late final VideoPlayerController videoController;

  @override
  void dispose() {
    videoController.pause();
    videoController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    Get.put(TranslationController());
    videoController = VideoPlayerController.asset('assets/video/webro_intro.mp4')
      ..initialize().then((_) {
        setState(() {
          videoController.play();
          videoController.setLooping(true);
        });
        Future.delayed(Duration(seconds: 10), () {
          Get.offAll(() => BottomBarView());
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: videoController.value.isInitialized
            ? SizedBox.expand(
                child: AspectRatio(
                  aspectRatio: videoController.value.aspectRatio,
                  child: VideoPlayer(videoController),
                ),
              )
            : Container(
                color: Colors.white,
              ));
  }
}
