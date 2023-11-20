import 'package:chewie/chewie.dart';
import 'package:elearning/src/fake_data/mock_data/detail_mock_data.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({Key? key}) : super(key: key);

  @override
  _CourseDetailScreenState createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  late List<VideoPlayerController> _videoControllers;
  late List<ChewieController> _chewieControllers;
  late int _currentSelectedIndex;

  @override
  void initState() {
    super.initState();

    _currentSelectedIndex = 0;

    _videoControllers = detailIntroductionCourse
        .map((detail) => VideoPlayerController.asset(detail.video))
        .toList();

    _chewieControllers = _videoControllers
        .map(
          (controller) => ChewieController(
            videoPlayerController: controller,
            aspectRatio: 16 / 9,
            autoPlay: false,
            looping: true,
          ),
        )
        .toList();
  }

  @override
  void dispose() {
    for (var controller in _videoControllers) {
      controller.pause();
      controller.dispose();
    }
    for (var controller in _chewieControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return Stack(
      children: [
        _backgroundVideo(context),
        _locationList(context),
      ],
    );
  }

  Widget _backgroundVideo(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      child: _videoPlayerWidget(context),
    );
  }

  Widget _videoPlayerWidget(BuildContext context) {
    return Chewie(
      controller: _chewieControllers[_currentSelectedIndex],
    );
  }

  Widget _locationList(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.65,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      detailIntroductionCourse.first.titleDetail,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        // You can add other styling properties here if needed
                      ),
                    ),
                  ],
                ),
                subtitle: Text(
                  detailIntroductionCourse.first.textDetail,
                ),
                trailing: Text(
                  "\$${detailIntroductionCourse.first.moneyDetail}",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Theme.of(context).primaryColor,
                    // You can add other styling properties here if needed
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      detailIntroductionCourse.first.contentDetail,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        // You can add other styling properties here if needed
                      ),
                    ),
                  ],
                ),
                subtitle:
                    Text(detailIntroductionCourse.first.contentIntroduction),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: detailIntroductionCourse.length,
                itemBuilder: (context, index) {
                  var detail = detailIntroductionCourse[index];
                  return Column(
                    children: [
                      ListTile(
                        title: Text(detail.nameCourse),
                        subtitle: Text(detail.endDay),
                        leading: Text(detail.numericalOrder),
                        trailing: TextButton(
                          onPressed: () {
                            _handleButtonPressed(index);
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).primaryColor,
                            ),
                            child: Icon(
                              _currentSelectedIndex == index
                                  ? _videoControllers[index].value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow
                                  : Icons.play_arrow,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                          ),
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleButtonPressed(int index) {
    if (_currentSelectedIndex == index) {
      if (_videoControllers[index].value.isPlaying) {
        _videoControllers[index].pause();
        _videoControllers[index].setVolume(0.0);
      } else {
        _videoControllers[index].play();
        _videoControllers[index].setVolume(1.0);
      }
    } else {
      _videoControllers[_currentSelectedIndex].pause();
      _videoControllers[_currentSelectedIndex].setVolume(0.0);

      _currentSelectedIndex = index;
      _videoControllers[index].play();
      _videoControllers[index].setVolume(1.0);
    }

    setState(() {
      _chewieControllers[_currentSelectedIndex] = ChewieController(
        videoPlayerController: _videoControllers[_currentSelectedIndex],
        aspectRatio: 16 / 9,
        autoPlay: false,
        looping: true,
      );
    });
  }
}
