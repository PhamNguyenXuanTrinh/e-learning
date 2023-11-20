import 'package:elearning/src/core/utils/constants/strings.dart';
import 'package:elearning/src/domain/models/home_screen/home_model.dart';
import 'package:elearning/src/presentation/views/home/widgets/avatar_widget.dart';
import 'package:elearning/src/presentation/views/home/widgets/img_list_widget.dart';
import 'package:elearning/src/presentation/views/home/widgets/learned_widget.dart';
import 'package:elearning/src/presentation/views/home/widgets/learning_plan_widget.dart';
import 'package:elearning/src/presentation/views/home/widgets/meet_up_widget.dart';
import 'package:elearning/src/presentation/views/home/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // HomeModel với các giá trị tương ứng
    HomeModel homeModel = HomeModel(
      learnText: AppStrings.learn,
      myCourseText: AppStrings.mycourse,
      time46Text: AppStrings.time46,
      time60Text: AppStrings.time60,
      learning: AppStrings.learning,
      packDesign: AppStrings.packDesign,
      proDesign: AppStrings.proDesign,
      learn40: AppStrings.learn40,
      learn48: AppStrings.learn48,
      learn6: AppStrings.learn6,
      learn24: AppStrings.learn24,
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  margin: const EdgeInsets.only(bottom: 70),
                  color: Colors.blue,
                  padding: const EdgeInsets.all(20.0),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleWidget(),
                      Spacer(),
                      AvatarWidget(),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 20,
                    left: 10,
                    right: 10,
                    child: LearnedWidget(homeModel: homeModel)),
              ],
            ),
            ImgListWidget(
              onPressed: () {},
            ),
            LearningPlanWidget(homeModel: homeModel),
            const MeetupWidget(),
          ],
        ),
      ),
    );
  }
}
