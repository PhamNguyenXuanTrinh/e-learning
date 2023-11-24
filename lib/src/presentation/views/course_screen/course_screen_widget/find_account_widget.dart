import 'package:flutter/material.dart';

import '../../../widgets/sreach_bottom_sheet.dart';

class FindAccountWidget extends StatelessWidget {
  const FindAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  searchBottomSheet(context);
                },
                hoverColor: Colors.transparent,
                borderRadius: BorderRadius.circular(12.0),
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.grey[200],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.search),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Find Course',
                              hintStyle: TextStyle(
                                color: Theme.of(context).primaryColorDark,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const Icon(Icons.tune),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
