import 'package:elearning/src/core/utils/constants/imgs.dart';
import 'package:elearning/src/core/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MeetupWidget extends StatelessWidget {
  const MeetupWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double meetupWidth = screenWidth - 25;

    return Container(
      width: meetupWidth,
      height: 120,
      decoration: BoxDecoration(
        color: const Color(0xFFEFE0FF), // màu nền tím nhạt
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    AppStrings.meetup,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF440687),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 4),
                  child: Text(
                    AppStrings.textMeetup,
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF440687),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SvgPicture.asset(
            AppImages.imgmeetup,
            width: 80,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
