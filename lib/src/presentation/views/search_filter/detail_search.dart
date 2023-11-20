
import 'package:elearning/src/presentation/views/course_screen/course_screen_widget/find_account_widget.dart';
import 'package:elearning/src/presentation/views/search_filter/widgets/btn_toggle_search_widget.dart';
import 'package:elearning/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class DetailFilterView extends StatelessWidget {
  const DetailFilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 170,
        title: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.keyboard_arrow_left),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const FindAccountWidget(),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                ToggleButtonWidget(text: AppStrings.music),
                SizedBox(
                  width: 10,
                ),
                ToggleButtonWidget(text: AppStrings.visualIdentiy),
                SizedBox(
                  width: 10,
                ),
                ToggleButtonWidget(text: AppStrings.mathmatics),
                SizedBox(
                  width: 10,
                ),
                ToggleButtonWidget(text: AppStrings.music),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.results,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

