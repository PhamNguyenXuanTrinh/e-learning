// ChoiceYourAccountScreen.dart
import 'package:elearning/src/injector/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/constants/strings.dart';
import '../../../bloc/course_bloc/course_bloc.dart';
import '../../../widgets/content_from.dart';

class ChoiceYourAccountScreen extends StatelessWidget {
  const ChoiceYourAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CourseBloc>()..add(CourseStarted()),
      child: BlocBuilder<CourseBloc, CourseState>(
        builder: (context, state) {
          if (state is CourseLoadSuccess) {
            return DefaultTabController(
              length: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    padding: const EdgeInsets.only(bottom: 28, right: 14),
                    child: TabBar(
                      isScrollable: true,
                      labelColor: Theme.of(context).scaffoldBackgroundColor,
                      unselectedLabelColor: Theme.of(context).highlightColor,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Theme.of(context).primaryColor,
                      ),
                      padding: EdgeInsets.zero,
                      tabAlignment: TabAlignment.start,
                      tabs: [
                        _buildTabBarItem(AppStrings.choiceYourAccountAll),
                        _buildTabBarItem(AppStrings.choiceYourAccountPopular),
                        _buildTabBarItem(AppStrings.choiceYourAccountNew),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        buildTabContentFromApi(state.course, context),
                        buildTabContentFromApi(state.course, context),
                        buildTabContentFromApi(state.course, context),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (state is CourseLoadFailure) {
            return Center(
              child: Text('${AppStrings.error} : ${state.apiError.message}'),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Tab _buildTabBarItem(String title) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 40,
        constraints: const BoxConstraints(minWidth: 73),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(title),
        ),
      ),
    );
  }
}
