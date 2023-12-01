import 'package:elearning/src/core/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/models/my_course_model.dart';
import '../../../injector/injector.dart';
import '../../bloc/my_course/my_course_bloc.dart';
import 'widget/learned_today_widget.dart';
import 'widget/learning_widget.dart';

class MyCourseScreen extends StatelessWidget {
  const MyCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MyCourseBloc>()..add(MyCourseStarted()),
      child: BlocBuilder<MyCourseBloc, MyCourseState>(
        builder: (context, state) {
          if (state is MyCourseLoadSuccess) {
            MyCourseModel mycourseData = state.mycourseData!;

            return Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.mycourse),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                centerTitle: true,
                automaticallyImplyLeading: false,
              ),
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    LearnedTodayWidget(mycourseData: mycourseData),
                    const SizedBox(height: 10),
                    LearningWidget(mycourseData: mycourseData),
                  ],
                ),
              ),
            );
          } else if (state is MyCourseInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MyCourseLoadFailure) {
            return Center(
              child:
                  Text('Error loading My Courses: ${state.apiError.message}'),
            );
          } else {
            return const Center(
              child: Text('Unhandled state'),
            );
          }
        },
      ),
    );
  }
}
