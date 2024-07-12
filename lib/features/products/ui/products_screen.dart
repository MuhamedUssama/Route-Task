import 'package:flutter/material.dart';

import '../../../core/utils/images_path.dart';
import '../../../core/widgets/custom_textfield.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  ImagesPath.logo,
                  color: Theme.of(context).primaryColor,
                  width: width * 0.2,
                ),
                SizedBox(height: height * 0.02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    searchSection(context, width),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget searchSection(BuildContext context, double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(
          flex: 9,
          child: CustomTextField(),
        ),
        SizedBox(width: width * 0.04),
        Expanded(
          flex: 1,
          child: Image.asset(IconsPath.shoppingCart),
        ),
      ],
    );
  }
}
