  import 'package:flutter/material.dart';

  class CourseWidget extends StatelessWidget {
    final String titleCourseTab;
    final String teachTab;
    final String moneyTab;
    final String timeTab;
    final String imageUrl;

    const CourseWidget({
      Key? key,
      required this.titleCourseTab,
      required this.teachTab,
      required this.moneyTab,
      required this.timeTab,
      required this.imageUrl,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return _buildTextWithShadow(titleCourseTab, teachTab, moneyTab, timeTab, imageUrl, context);
    }

  Widget _buildTextWithShadow(
    String text1, String text2, String text3, String text4, String imageUrl, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              offset: const Offset(5.0, 5.0),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ),
            BoxShadow(
              color: Theme.of(context).scaffoldBackgroundColor,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                imageUrl,
                width: 50,
                height: 50,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text1,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.person,
                            color: Theme.of(context).cardColor,
                            size: 12), // User icon for text2 with size 12
                        const SizedBox(width: 5),
                        Text(
                          text2,
                          style: TextStyle(
                            color: Theme.of(context).cardColor,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.attach_money,
                              color: Theme.of(context).primaryColor,
                              size: 16,
                              
                            ), // Add your icon for text2
                            const SizedBox(width: 2),
                            Text(
                              text3,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          text4,
                          style: TextStyle(
                            color: Theme.of(context).dividerColor,
                            fontSize: 12,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  }