import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../helpers/super_helper.dart';

class ScreenVideoPlayerSub extends StatefulWidget {
    XFile? xfile;

  ScreenVideoPlayerSub({required this.xfile, super.key});

  @override
  State<ScreenVideoPlayerSub> createState() => _ScreenVideoPlayerSubState();
}

class _ScreenVideoPlayerSubState extends State<ScreenVideoPlayerSub> {
  VideoPlayerController? videoPlayerController;
  late Duration sliderPosition;
  late Timer timer;
  late Duration singleVideoCurrentPosition;

  XFile? xfile;

  void syncSliderPosition(Timer timer) {
    setState(() {
      singleVideoCurrentPosition = videoPlayerController!.value.position;
    });
  }

  @override
  void initState() {
    super.initState();
    singleVideoCurrentPosition = const Duration(seconds: 0);
    initVideoPlayerSub();
  }



  Future<void> initVideoPlayerSub() async {
    videoPlayerController = VideoPlayerController.file(
      File(widget.xfile!.path),
    );
    await videoPlayerController?.initialize();
    sliderPosition = const Duration(seconds: 0);

    timer = Timer.periodic(const Duration(seconds: 1), syncSliderPosition);
  }


  @override
  void dispose() {
    timer.cancel();
    videoPlayerController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    if (videoPlayerController == null) {
      return const Center(child: CircularProgressIndicator());
    }
    Duration sigleVideoDuration = videoPlayerController!.value.duration;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
            // aspectRatio: 3 / 2,
            aspectRatio: videoPlayerController!.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(videoPlayerController!),
                Container(
                  color: Colors.black.withOpacity(0.5), //배경을 어둡게 해서 컨트롤 바를 더욱 활성화 되어 보이도록 하는 효과를 연출
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          /*갤러리로 이동 버튼*/ GestureDetector(
                            child: const Icon(Icons.image_outlined, size: 40, color: Colors.white),
                            onTap: () {
                              // Navigator.of(context).pop();
                              renderScreenGalleryChoosen();
                              // videoPlayerController?.dispose();
                              // singleVideoCurrentPosition = const Duration(seconds: 0);
                              initVideoPlayerSub();
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          /*영상 5초 간격 뒤로 버튼*/ GestureDetector(
                            child: const Icon(Icons.rotate_left, size: 40, color: Colors.white),
                            onTap: () {
                              setState(() {
                                final Duration futureVideoPosition;
                                const int referenceSecondsGap = 5;
                                Duration singleVideoCurrentPosition = videoPlayerController!.value.position;
                                if (singleVideoCurrentPosition.inSeconds > referenceSecondsGap) {
                                  futureVideoPosition = singleVideoCurrentPosition - const Duration(seconds: referenceSecondsGap);
                                  videoPlayerController!.seekTo(futureVideoPosition);
                                } else {
                                  futureVideoPosition = const Duration(seconds: 0);
                                  videoPlayerController!.seekTo(futureVideoPosition);
                                }
                              });
                            },
                          ),
                          /*영상 재생 멈춤 토글 버튼*/ GestureDetector(
                            child: videoPlayerController!.value.isPlaying ? const Icon(Icons.pause, size: 40, color: Colors.white) : const Icon(Icons.play_arrow, size: 40, color: Colors.white),
                            onTap: () {
                              setState(() {
                                if (videoPlayerController!.value.isPlaying) {
                                  videoPlayerController!.pause();
                                } else {
                                  videoPlayerController!.play();
                                }
                              });
                            },
                          ),
                          /*영상 5초 간격 앞으로 버튼*/ GestureDetector(
                            child: const Icon(Icons.rotate_right, size: 40, color: Colors.white),
                            onTap: () {
                              setState(() {
                                final Duration futureVideoPosition;
                                const int referenceSecondsGap = 5;
                                Duration singleVideoCurrentPosition = videoPlayerController!.value.position;
                                if (singleVideoCurrentPosition.inSeconds < sigleVideoDuration.inSeconds - const Duration(seconds: referenceSecondsGap).inSeconds) {
                                  futureVideoPosition = singleVideoCurrentPosition + const Duration(seconds: referenceSecondsGap);
                                  videoPlayerController!.seekTo(futureVideoPosition);
                                } else {
                                  futureVideoPosition = sigleVideoDuration;
                                  videoPlayerController!.seekTo(futureVideoPosition);
                                }
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          /*단일비디오 남은재생길이*/ TextButton(
                            child: Text(timeFormattingHelper(singleVideoCurrentPosition.inSeconds), style: const TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w100)),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                            },
                          ),
                          /*단일비디오 현재재생위치 겸 입력슬라이더*/ SizedBox(
                            height: 30,
                            width: 264,
                            child: Slider(
                              value: singleVideoCurrentPosition.inSeconds.toDouble(),
                              onChanged: (double value) {
                                setState(() {
                                  sliderPosition = Duration(seconds: value.toInt());
                                  videoPlayerController!.seekTo(sliderPosition);
                                  if (singleVideoCurrentPosition == sigleVideoDuration) {
                                    sliderPosition = const Duration(seconds: 0);
                                    singleVideoCurrentPosition = const Duration(seconds: 0);
                                  }
                                });
                              },
                              max: sigleVideoDuration.inSeconds.toDouble(),
                              min: 0,
                            ),
                          ),
                          /*단일비디오 전체재생길이*/ TextButton(
                            child: Text(timeFormattingHelper(sigleVideoDuration.inSeconds), style: const TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w100)),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(MySnackBars.notReadySnackBar);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }


  Future<void> renderScreenGalleryChoosen() async {
    //바디오 갤러리로 이동
    XFile? video = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );

    //사용자가 선택한 특정 비디오를 Xfile 객체에 저장
    if (video != null) {
      setState(() {
        xfile = video;
      });
    }else{
      setState(() {
        xfile = video;
      });
    }
  }
}
