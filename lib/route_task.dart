import 'package:flutter/material.dart';

import 'config/theme/app_colors.dart';

class RouteTask extends StatelessWidget {
  const RouteTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Route Task',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
