import 'package:elearning/src/injector/injector.dart';
import 'package:elearning/src/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:elearning/src/presentation/views/home/widgets/avatar_widget.dart';
import 'package:elearning/src/presentation/views/home/widgets/img_list_widget.dart';
import 'package:elearning/src/presentation/views/home/widgets/learned_widget.dart';
import 'package:elearning/src/presentation/views/home/widgets/learning_plan_widget.dart';
import 'package:elearning/src/presentation/views/home/widgets/meet_up_widget.dart';
import 'package:elearning/src/presentation/views/home/widgets/title_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()..add(HomeStarted()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadSuccess) {
            final homeData = state.homeData;

            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 180,
                          margin: const EdgeInsets.only(bottom: 70),
                          color: Theme.of(context).primaryColor,
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleWidget(homeData: homeData),
                              const Spacer(),
                              AvatarWidget(homeData: homeData),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 10,
                          right: 10,
                          child: LearnedWidget(homeData: homeData),
                        ),
                      ],
                    ),
                    ImgListWidget(
                      onPressed: () {},
                      homeData:homeData
                    ),
                    LearningPlanWidget(
                      homeData: homeData,
                    ),
                    const MeetupWidget(),
                  ],
                ),
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
