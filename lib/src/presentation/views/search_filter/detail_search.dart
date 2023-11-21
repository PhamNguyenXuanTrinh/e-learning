import 'package:flutter/material.dart';

import '../../../core/utils/constants/strings.dart';
import '../../widgets/content_from.dart';
import '../course_screen/course_screen_widget/find_account_widget.dart';
import 'widgets/btn_toggle_search_widget.dart';

class DetailFilterView extends StatelessWidget {
  const DetailFilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: MediaQuery.of(context).size.height * 0.2,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Row(
              children: <Widget>[
                ToggleButtonWidget(text: AppStrings.music),
                SizedBox(
                  width: 5,
                ),
                ToggleButtonWidget(text: AppStrings.visualIdentiy),
                SizedBox(
                  width: 5,
                ),
                ToggleButtonWidget(text: AppStrings.music),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.results,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: buildTabContentFromApi1(),
            ),
          ],
        ),
      ),
    );
  }
}
