import 'package:elearning/src/presentation/views/navigation_bar/navigation_bar_screen.dart';
import 'package:elearning/src/presentation/views/search_filter/detail_search.dart';
import 'package:elearning/src/presentation/views/search_filter/widgets/btn_toggle_search_widget.dart';
import 'package:elearning/src/presentation/views/search_filter/widgets/range_slider.widget.dart';
import 'package:elearning/src/presentation/widgets/btn_primary_widget.dart';
import 'package:elearning/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class SearchFilterView extends StatelessWidget {
  const SearchFilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SearchFilter(),
    );
  }
}

class SearchFilter extends StatelessWidget {
  const SearchFilter({super.key});
  @override
  Widget build(BuildContext context) {
    final double x = (MediaQuery.of(context).size.height) * 0.2;
    return Stack(children: <Widget>[
      Container(
        color: Theme.of(context).canvasColor, // Lớp màu nền
        width: double.infinity,
        height: double.infinity,
      ),
      Positioned(
        left: 0,
        top: x,
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - x,
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
                height: 20,
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
                height: 20,
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
                height: 30,
              ),
              Row(
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(
                            color: Theme.of(context).primaryColor, width: 1.0),
                      ),
                      padding: const EdgeInsets.all(25.0),
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
                  const SizedBox(
                    width: 20,
                  ),
                  PrimaryBtn(
                    text: AppStrings.apply,
                    width: (MediaQuery.of(context).size.width) * 0.6,
                     onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DetailFilterView()),
                    );
                  },
                  ),
                ],
              )
            ],
          ),
        ),
      )
    ]);
  }
}
