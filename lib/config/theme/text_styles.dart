import 'package:flutter/material.dart';

import 'app_colors.dart';

class TextStyles {
  static TextStyle textFieldHintText = TextStyle(
    color: AppColors.textFieldHintTextColor,
    fontSize: 16,
    fontWeight: FontWeight.w300,
    letterSpacing: 0.7,
  );

  static const TextStyle productTitleInCard = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle productDescriptionInCard = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle productPriceAfterDiscount = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.lineThrough,
    decorationColor: AppColors.primaryColor,
  );
}
