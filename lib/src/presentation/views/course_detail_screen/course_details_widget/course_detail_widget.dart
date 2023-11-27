import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/error/api_error.dart';
import '../../../../domain/models/detail_model.dart';
import '../../../../injector/injector.dart';
import '../../../bloc/bloc/detail_course_bloc.dart';

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<DetailCourseBloc>()..add(DetailCourseStarted()),
      child: const CourseDetailView(),
    );
  }
}

class CourseDetailView extends StatefulWidget {
  const CourseDetailView({super.key});

  @override
  State<CourseDetailView> createState() => _CourseDetailViewState();
}

class _CourseDetailViewState extends State<CourseDetailView> {
  late List<VideoPlayerController> _videoControllers;
  late List<ChewieController> _chewieControllers;
  late int _currentSelectedIndex;
  List<DetailModel>? detail;

  @override
  void initState() {
    super.initState();

    _currentSelectedIndex = 0;
  }

  void _initializeControllers(
      DetailModel? details, List<LessonModel>? lessons) {
    if (details != null) {
      _videoControllers = lessons
              ?.map((lesson) =>
                  VideoPlayerController.asset(lesson.videoCourse ?? ''))
              .toList() ??
          [];
    } else {
      _videoControllers = [VideoPlayerController.asset('')];
    }

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
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: BlocListener<DetailCourseBloc, DetailCourseState>(
        listener: (context, state) {
          if (state is DetailCourseLoadSuccess) {
            _initializeControllers(
                state.detailCourse, state.detailCourse?.lessons);
          }
        },
        child: BlocBuilder<DetailCourseBloc, DetailCourseState>(
          builder: (context, state) {
            // print('state: $state');
            if (state is DetailCourseLoadSuccess) {
              return _buildUIWithData(context, state.detailCourse!);
            } else if (state is DetailCourseLoadFailure) {
              return _buildErrorUI(context, state.apiError);
            } else {
              return _buildLoadingUI(context);
            }
          },
        ),
      ),
    );
  }

  Widget _buildUIWithData(BuildContext context, DetailModel detailCourse) {
    return Stack(
      children: [
        _backgroundVideo(context),
        _locationList(context, detailCourse),
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

  Widget _buildLoadingUI(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorUI(BuildContext context, ApiError apiError) {
    return Center(
      child: Text('Error: ${apiError.message}'),
    );
  }

  Widget _locationList(BuildContext context, DetailModel detailCourse) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.61,
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
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      detailCourse.thumbnail ?? '',
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                subtitle: Text(
                  detailCourse.courseTotalTime ?? '',
                ),
                trailing: Text(
                  "\$${detailCourse.price}",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      detailCourse.titleDesc ?? '',
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                subtitle: Text(detailCourse.desc ?? ''),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: detailCourse.lessons?.length ?? 0,
                itemBuilder: (context, index) {
                  var lesson = detailCourse.lessons?[index];
                  return Column(
                    children: [
                      ListTile(
                        title: Text(lesson?.lessonName ?? ''),
                        subtitle: Text(lesson?.lessonDuration ?? ''),
                        leading: Text(
                          lesson?.number ?? '',
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
