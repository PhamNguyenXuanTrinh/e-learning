import 'package:flutter/material.dart';
import 'package:elearning/src/core/utils/constants/strings.dart';
import '../../../../domain/models/home_model.dart';

class LearningPlanWidget extends StatefulWidget {
  final HomeModel? homeData;

  const LearningPlanWidget({super.key, required this.homeData});

  @override
  _LearningPlanWidgetState createState() => _LearningPlanWidgetState();
}

class _LearningPlanWidgetState extends State<LearningPlanWidget> {
  bool isShowMore = false;

  @override
  Widget build(BuildContext context) {
    double chieuRongManHinh = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            AppStrings.learning,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Container(
            width: chieuRongManHinh - 25,
            height: isShowMore ? 240 : 120,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                value: (widget.homeData?.learningPlan[0]
                                            .studiedLessons ??
                                        0) /
                                    (widget.homeData?.learningPlan[0]
                                                .totalLessons ??
                                            1)
                                        .toDouble(),
                                backgroundColor:
                                    Theme.of(context).secondaryHeaderColor,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Theme.of(context).cardColor,
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                value: (widget.homeData?.learningPlan[1]
                                            .studiedLessons ??
                                        0) /
                                    (widget.homeData?.learningPlan[1]
                                                .totalLessons ??
                                            1)
                                        .toDouble(),
                                backgroundColor:
                                    Theme.of(context).secondaryHeaderColor,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Theme.of(context).cardColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.homeData?.learningPlan[0].courseName ??
                                    '',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                widget.homeData?.learningPlan[1].courseName ??
                                    '',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${widget.homeData?.learningPlan[0].studiedLessons ?? 0}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  AppStrings.slash,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).cardColor,
                                  ),
                                ),
                                Text(
                                  '${widget.homeData?.learningPlan[0].totalLessons ?? 0}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).cardColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Text(
                                  '${widget.homeData?.learningPlan[1].studiedLessons ?? 0}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  AppStrings.slash,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).cardColor,
                                  ),
                                ),
                                Text(
                                  '${widget.homeData?.learningPlan[1].totalLessons ?? 0}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).cardColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              isShowMore = !isShowMore;
                            });
                          },
                          child: Text(
                            isShowMore ? AppStrings.less : AppStrings.more,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
