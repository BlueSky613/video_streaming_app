// ignore_for_file: no_logic_in_create_state

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/screens/home/home_screens/go_premium/go_premium.dart';
import 'package:prime_video_flutter_ui_kit/screens/home/home_screens/movie_details/movie_details.dart';
import 'package:prime_video_flutter_ui_kit/utils/utils.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  const VideoView(
      {super.key,
      required this.url,
      required this.isShowing,
      required this.videoImg,
      this.subscriberShowing = false});

  final String url;
  final bool isShowing;
  final String videoImg;
  final bool subscriberShowing;

  @override
  State<VideoView> createState() =>
      isShowing ? _VideoViewState() : _VideoViewNoUrlState();
}

class _VideoViewNoUrlState extends State<VideoView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          widget.videoImg,
          fit: BoxFit.fill,
          height: SizeConstant.appSize246,
          width: PrimeSizeConfig.displayWidth(context),
        ),
        if (widget.subscriberShowing == true) ...[
          Positioned(
            height: SizeConstant.appSize246,
            width: PrimeSizeConfig.displayWidth(context),
            top: PrimeSizeConfig.displayHeight(context) * .001,
            child: Container(
              color: ColorConstant.snackBarTextColor.withOpacity(.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    StringConstant.subscribeToWatch,
                    style: StyleConstants.heading22Style,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: SizeConstant.appSize4),
                  Text(
                    StringConstant.subscribeToWatchDetails,
                    textAlign: TextAlign.center,
                    style: StyleConstants.commonStyle.copyWith(
                        color: ColorConstant.fontColorOpacity100,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: SizeConstant.appSize16),
                  GestureDetector(
                    onTap: () => Get.to(() => const GoPremiumView()),
                    child: Image.asset(
                      AssetsConstant.subscribeTileImg,
                      scale: SizeConstant.appSize5,
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              top: SizeConstant.appSize20,
              right: SizeConstant.appSize5,
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    AssetsConstant.premiumIcon,
                    scale: SizeConstant.appSize4,
                  ))),
        ],
        const Padding(
          padding: EdgeInsets.only(top: SizeConstant.appSize10),
          child: BackButton(
            style: ButtonStyle(
              iconSize: WidgetStatePropertyAll(SizeConstant.appSize18),
            ),
          ),
        ),
      ],
    );
  }
}

class _VideoViewState extends State<VideoView> {
  late VideoPlayerController _controller;
  late ChewieController chewieController;

  RxBool controlsShowing = true.obs;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url))
      ..initialize().then((_) {
        setState(() {});
      });
    chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: false,
      isLive: false,
      showControls: true,
      customControls: CustomControls(
        videoPlayerController: _controller,
        controlsShowing: controlsShowing,
      ),
      allowedScreenSleep: false,
      allowMuting: false,
      showOptions: true,
    );
    chewieController.addListener(() {
      if (chewieController.isFullScreen) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    MovieDetailsController movieDetailsController =
        Get.put(MovieDetailsController());
    PrimeSizeConfig.displayWidth(context);
    return Center(
      child: _controller.value.isInitialized
          ? SizedBox(
              height: SizeConstant.appSize246,
              width: PrimeSizeConfig.displayWidth(context),
              child: Chewie(
                controller: chewieController,
              ))
          : AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              height: SizeConstant.appSize246,
              child: Stack(
                children: [
                  Padding(
                    padding: horizontalPadding()
                        .copyWith(top: SizeConstant.appSize28),
                    child: GestureDetector(
                      onTap: () =>
                          movieDetailsController.videoPlayerShowing.toggle(),
                      child: Image.asset(
                        AssetsConstant.arrowDownIcon,
                        scale: SizeConstant.appSize4,
                        color: ColorConstant.whiteColor,
                      ),
                    ),
                  ),
                  Center(
                      child: SizedBox(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: SizeConstant.appSize40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: ColorConstant.fontColorOpacity40,
                                  width: SizeConstant.appSize4)),
                        ),
                        const SizedBox(
                          height: SizeConstant.appSize35,
                          width: SizeConstant.appSize35,
                          child: CircularProgressIndicator(
                              strokeCap: StrokeCap.round,
                              color: ColorConstant.primaryColor),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    chewieController.dispose();
  }
}

//ignore: must_be_immutable
class CustomControls extends StatelessWidget {
  CustomControls({
    super.key,
    required this.videoPlayerController,
    required this.controlsShowing,
  });
  final VideoPlayerController videoPlayerController;
  final RxBool controlsShowing;
  RxBool isLoading = false.obs;
  final playerShowing = true.obs;

  @override
  Widget build(BuildContext context) {
    MovieDetailsController movieDetailsController =
        Get.put(MovieDetailsController());
    RxDouble playerProgressValue = SizeConstant.appSize0.obs;
    videoPlayerController.addListener(() {
      isLoading.toggle();
      playerProgressValue.value =
          videoPlayerController.value.position.inSeconds.toDouble();
      if (videoPlayerController.value.position ==
          videoPlayerController.value.duration) {
        playerShowing.value = true;
        controlsShowing.value = true;
      }
    });
    return Obx(
      () => InkWell(
        onTap: () => controlsShowing.toggle(),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          color: !controlsShowing.value
              ? Colors.transparent
              : Colors.black.withOpacity(0.7),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              if (controlsShowing.value) ...[
                Padding(
                  padding: const EdgeInsets.only(top: SizeConstant.appSize10),
                  child: VideoHeaderWidget(
                    videoPlayerController: videoPlayerController,
                    movieDetailsController: movieDetailsController,
                  ),
                ),
                Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            videoPlayerController.seekTo(Duration(
                                seconds: videoPlayerController
                                        .value.position.inSeconds -
                                    10));
                          },
                          icon: const ImageIcon(
                            AssetImage(AssetsConstant.rotateBackIcon),
                            size: SizeConstant.appSize30,
                          )),
                      IconButton(
                        icon: playerShowing.value
                            ? const ImageIcon(
                                AssetImage(AssetsConstant.playerPlayImg),
                                size: SizeConstant.appSize30,
                              )
                            : const ImageIcon(
                                AssetImage(AssetsConstant.playerPauseImg),
                                size: SizeConstant.appSize30,
                              ),
                        onPressed: () {
                          if (!videoPlayerController.value.isPlaying) {
                            controlsShowing.value =
                                videoPlayerController.value.isPlaying;
                          }
                          playerShowing.value =
                              videoPlayerController.value.isPlaying;
                          videoPlayerController.value.isPlaying
                              ? videoPlayerController.pause()
                              : videoPlayerController.play();
                        },
                      ),
                      IconButton(
                          onPressed: () {
                            videoPlayerController.seekTo(Duration(
                                seconds: videoPlayerController
                                        .value.position.inSeconds +
                                    10));
                          },
                          icon: const ImageIcon(
                            AssetImage(AssetsConstant.rotateForwardIcon),
                            size: SizeConstant.appSize30,
                          )),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: horizontalPadding()
                        .copyWith(bottom: SizeConstant.appSize10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Theme(
                          data: ThemeData(
                            sliderTheme: SliderThemeData(
                              activeTrackColor:
                                  ColorConstant.fontColorOpacity100,
                              inactiveTrackColor:
                                  ColorConstant.fontColorOpacity12,
                              trackShape: const CustomSliderTrackShape(),
                              thumbShape: const CustomSliderThumbShape(
                                  enabledThumbRadius: SizeConstant.appSize6),
                              overlayShape: const CustomSliderOverlayShape(),
                              thumbColor: ColorConstant.fontColorOpacity100,
                              trackHeight: SizeConstant.appSize3,
                            ),
                          ),
                          child: Slider(
                              value: playerProgressValue.value,
                              inactiveColor: ColorConstant.fontColorOpacity22,
                              onChanged: (itemValue) {
                                playerProgressValue.value = itemValue;
                                videoPlayerController.seekTo(Duration(
                                    seconds:
                                        playerProgressValue.value.toInt()));
                              },
                              min: SizeConstant.appSize0,
                              thumbColor: ColorConstant.fontColorOpacity100,
                              max: videoPlayerController
                                  .value.duration.inSeconds
                                  .toDouble()),
                        ),
                        const SizedBox(height: SizeConstant.appSize4),
                        isLoading.value
                            ? customDurationWidget(
                                timeConvert(
                                        videoPlayerController.value.position)
                                    .value,
                                endTimeConvert(
                                        videoPlayerController.value.duration)
                                    .value)
                            : customDurationWidget(
                                timeConvert(
                                        videoPlayerController.value.position)
                                    .value,
                                endTimeConvert(
                                        videoPlayerController.value.duration)
                                    .value)
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  customDurationWidget(String position, String endTime) {
    return Text.rich(TextSpan(
        text: position,
        style: StyleConstants.description4.copyWith(
            color: ColorConstant.fontColorOpacity100,
            fontWeight: FontWeight.w400),
        children: [
          TextSpan(
            text: " / ",
            style: StyleConstants.description4.copyWith(
                color: ColorConstant.fontColorOpacity100,
                fontWeight: FontWeight.w400),
          ),
          TextSpan(
            text: endTime,
            style: StyleConstants.description4.copyWith(
                color: ColorConstant.fontColorOpacity50,
                fontWeight: FontWeight.w400),
          ),
        ]));
  }

  RxString timeConvert(Duration duration) {
    int minutes = duration.inMinutes;
    int seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}'.obs;
  }

  RxString endTimeConvert(Duration duration) {
    int minutes = duration.inMinutes;
    int seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}'.obs;
  }
}

//ignore: must_be_immutable
class VideoHeaderWidget extends StatelessWidget {
  VideoHeaderWidget(
      {super.key,
      required this.movieDetailsController,
      required this.videoPlayerController});

  MovieDetailsController movieDetailsController;
  VideoPlayerController videoPlayerController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: horizontalPadding().copyWith(top: SizeConstant.appSize16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              if (ChewieController.of(context).isFullScreen) {
                ChewieController.of(context).exitFullScreen();
              } else {
                movieDetailsController.videoPlayerShowing.toggle();
              }
            },
            child: Image.asset(
              AssetsConstant.arrowDownIcon,
              scale: SizeConstant.appSize4,
              color: ColorConstant.whiteColor,
            ),
          ),
          SizedBox(
            width: SizeConstant.appSize100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    movieDetailsController.selectedSubtitle.value =
                        StringConstant.english;
                    movieDetailsController.selectedVideoQuality.value =
                        StringConstant.auto;
                    movieDetailsController.selectedVideoSpeed.value =
                        StringConstant.normal;
                    settingVideoDialog(context);
                  },
                  child: Image.asset(AssetsConstant.settingIcon,
                      scale: SizeConstant.appSize4),
                ),
                const SizedBox(width: SizeConstant.appSize12),
                GestureDetector(
                  onTap: () {
                    movieDetailsController.selectMobileCast.value =
                        SizeConstant.appSizeMinus1.toInt();
                    castAlertDialog(context);
                  },
                  child: Image.asset(AssetsConstant.castIcon,
                      scale: SizeConstant.appSize4),
                ),
                const SizedBox(width: SizeConstant.appSize12),
                GestureDetector(
                  onTap: () {
                    if (ChewieController.of(context).isFullScreen) {
                      ChewieController.of(context).exitFullScreen();
                    } else {
                      ChewieController.of(context).enterFullScreen();
                    }
                  },
                  child: Image.asset(AssetsConstant.rotateIcon,
                      scale: SizeConstant.appSize4),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
