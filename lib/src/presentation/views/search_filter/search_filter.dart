import 'package:flutter/material.dart';

class SearchFilterScreen extends StatelessWidget {
  const SearchFilterScreen({super.key});

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
    final double x = (MediaQuery.of(context).size.height) * 0.3;
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
          decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - x,
          child: const Column(
            children: <Widget>[],
          ),
        ),
      )
    ]);
  }
}
