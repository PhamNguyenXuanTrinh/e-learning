import 'package:elearning/src/core/utils/constants/imgs.dart';
import 'package:elearning/src/core/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class ImgListWidget extends StatelessWidget {
  const ImgListWidget({
    super.key,
    required Null Function() onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(
            left: 15, right: 15), // Khoảng trống với màn hình
        child: Row(
          children: List.generate(
            10,
            (index) {
              if (index == 0) {
                // Nếu là hình đầu tiên, thêm nút "Get Started" và dòng văn bản
                return Stack(
                  children: [
                    Image.asset(AppImages.imggethome),
                    const Positioned(
                      top: 12,
                      left: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.textlist,
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      left: 10,
                      child: ElevatedButton(
                        onPressed: () {
                          // Xử lý khi nút được nhấn
                        },
                        child: const Text(AppStrings.textbutton),
                      ),
                    ),
                  ],
                );
              } else {
                // Nếu không phải hình đầu tiên, chỉ hiển thị hình
                return Image.asset(AppImages.imggethome);
              }
            },
          ),
        ),
      ),
    );
  }
}
