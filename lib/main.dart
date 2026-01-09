import 'package:flutter/material.dart';
import 'package:weesh/presentation/pages/splash_page.dart';
import 'package:weesh/presentation/theme/app_colors.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor: AppColors.white
    ),
    home: SplashPage(),
  ));
}