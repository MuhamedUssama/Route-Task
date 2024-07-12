import 'package:flutter/material.dart';
import 'package:route_task/config/theme/app_colors.dart';
import 'package:route_task/config/theme/text_styles.dart';
import 'package:route_task/core/utils/images_path.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  const CustomTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: AppColors.primaryColor,
      style: TextStyles.searchTextStyle,
      decoration: InputDecoration(
        hintText: 'what do you search for?',
        hintStyle: TextStyles.textFieldHintText,
        focusColor: AppColors.primaryColor,
        prefixIcon: Image.asset(IconsPath.search),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
            width: 1,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}
