import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:elearning/src/core/utils/constants/imgs.dart';
import 'package:elearning/src/core/utils/constants/strings.dart';

class LearningPlanWidget extends StatefulWidget {
  const LearningPlanWidget({super.key});

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
                            SvgPicture.asset(
                              AppImages.imglearn2,
                            ),
                            const SizedBox(height: 15),
                            SvgPicture.asset(
                              AppImages.imglearn1,
                            ),
                          ],
                        ),
                        const SizedBox(width: 8.0),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.packDesign,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                AppStrings.proDesign,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  AppStrings.learn40,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  AppStrings.learn48,
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
                                const Text(
                                  AppStrings.learn6,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  AppStrings.learn24,
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
