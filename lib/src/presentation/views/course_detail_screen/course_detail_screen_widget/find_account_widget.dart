import 'package:flutter/material.dart';

class FindAccountWidget extends StatelessWidget {
  const FindAccountWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Find Course',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.tune),
                filled: true,
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none, // Remove the border
                ),
                // Đặt màu văn bản của "Find Course" thành màu đen
                hintStyle: TextStyle(color: Theme.of(context).primaryColorDark),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
