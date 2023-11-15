import 'package:flutter/material.dart';

class ContentSplash extends StatefulWidget {
  final String title;
  final String subtitle;

  const ContentSplash({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  State<ContentSplash> createState() => _MyTextsState();
}

class _MyTextsState extends State<ContentSplash> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 20,
        ),
        Text(
          widget.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          widget.subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).cardColor,
          ),
        ),
      ],
    );
  }
}
