import 'package:elearning/src/core/utils/constants/imgs.dart';
import 'package:elearning/src/core/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:elearning/src/domain/models/home_screen/home_model.dart';

class LearningPlanWidget extends StatefulWidget {
  final HomeModel homeModel;

  const LearningPlanWidget({
    super.key,
    required this.homeModel,
  });

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
          Text(
            widget.homeModel.learning,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Container(
            width: chieuRongManHinh - 25,
            height: isShowMore
                ? 240
                : 120, // Điều chỉnh chiều cao dựa trên trạng thái
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
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.homeModel.packDesign,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                widget.homeModel.proDesign,
                                style: const TextStyle(
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
                                Text(
                                  widget.homeModel.learn40,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  widget.homeModel.learn48,
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
                                  widget.homeModel.learn6,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  widget.homeModel.learn24,
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
                    // Đặt nút "Xem thêm" ở giữa
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
