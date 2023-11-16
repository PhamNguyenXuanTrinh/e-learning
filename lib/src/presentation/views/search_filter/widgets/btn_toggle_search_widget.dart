import 'package:flutter/material.dart';

class ToggleButtonWidget extends StatefulWidget {
  final String text;

  const ToggleButtonWidget({super.key, required this.text});
  @override
  _ToggleButtonWidgetState createState() => _ToggleButtonWidgetState();
}

class _ToggleButtonWidgetState extends State<ToggleButtonWidget> {
  bool isToggled = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // handler
        setState(() {
          isToggled = !isToggled;
        });
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.all(10.0),
        backgroundColor: isToggled
            ? Theme.of(context).primaryColor
            : Theme.of(context).hintColor,
        foregroundColor: isToggled
            ? Theme.of(context).scaffoldBackgroundColor
            : Theme.of(context).canvasColor,
      ),
      child: Text(isToggled ? widget.text : widget.text),
    );
  }
}
