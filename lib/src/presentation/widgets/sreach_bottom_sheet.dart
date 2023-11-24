import 'package:flutter/material.dart';

import '../../core/utils/constants/strings.dart';
import '../views/navigation_bar/navigation_bar_screen.dart';
import '../views/search_filter/detail_search.dart';
import '../views/search_filter/widgets/btn_toggle_search_widget.dart';
import '../views/search_filter/widgets/range_slider.widget.dart';
import 'btn_primary_widget.dart';

Future<void> searchBottomSheet(final BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 8, 10),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.85,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NavView()),
                );
              },
              child: Icon(
                Icons.close,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
            const Center(
              child: Text(
                AppStrings.searchFilter,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const Text(
              AppStrings.category,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              children: <Widget>[
                ToggleButtonWidget(text: AppStrings.design),
                SizedBox(
                  width: 10,
                ),
                ToggleButtonWidget(text: AppStrings.painting),
                SizedBox(
                  width: 10,
                ),
                ToggleButtonWidget(text: AppStrings.coding),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
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
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              AppStrings.price,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            const RangeSliderWidget(),
            const Text(
              AppStrings.duration,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: <Widget>[
                ToggleButtonWidget(text: AppStrings.hours1),
                SizedBox(
                  width: 10,
                ),
                ToggleButtonWidget(text: AppStrings.hours2),
                SizedBox(
                  width: 10,
                ),
                ToggleButtonWidget(text: AppStrings.hours3),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              children: <Widget>[
                ToggleButtonWidget(text: AppStrings.hours4),
                SizedBox(
                  width: 10,
                ),
                ToggleButtonWidget(text: AppStrings.hours5),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 55,
                  width: (MediaQuery.of(context).size.width) * 0.3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(
                            color: Theme.of(context).primaryColor, width: 1.0),
                      ),
                    ),
                    onPressed: () {
                      /// handler
                    },
                    child: Text(
                      AppStrings.clear,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                PrimaryBtn(
                  text: AppStrings.apply,
                  width: (MediaQuery.of(context).size.width) * 0.5,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailFilterView()),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}
