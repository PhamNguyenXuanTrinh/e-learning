import 'package:elearning/src/presentation/bloc/my_course/my_course_bloc.dart';
import 'package:elearning/src/presentation/views/my_course_screen/widget/learned_today_widget.dart';
import 'package:elearning/src/presentation/views/my_course_screen/widget/learning_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/constants/strings.dart';
import '../../../injector/injector.dart';

class MyCourseScreen extends StatelessWidget {
  const MyCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MyCourseBloc>()..add(MyCourseStarted()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.mycourse),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<MyCourseBloc, MyCourseState>(
                builder: (context, state) {
                  if (state is MyCourseLoadSuccess) {
                    final mycourseData = state.mycourseData;

                    if (mycourseData != null) {
                      return Column(
                        children: [
                          LearnedTodayWidget(mycourseData: mycourseData),
                          const SizedBox(height: 16),
                          LearningWidget(
                            mycourseData: mycourseData,
                          ),
                        ],
                      );
                    } else {
                      return const Text('MyCourseData is null');
                    }
                  } else if (state is MyCourseLoadFailure) {
                    return Text('Error: ${state.apiError.message}');
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
