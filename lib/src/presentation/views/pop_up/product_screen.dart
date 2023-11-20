import 'package:elearning/src/presentation/views/pop_up/widgets/pop_up_widgets.dart';
import 'package:elearning/src/utils/constants/imgs.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomPage(
          imagePath: AppImages.imgProduct,
          pageNumber: 4,
        ),
      ),
    );
  }
}
