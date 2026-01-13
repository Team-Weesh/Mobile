import 'package:flutter/material.dart';
import 'package:weesh/presentation/pages/splash_page.dart';
import 'package:weesh/presentation/theme/app_colors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MaterialApp(
    locale: const Locale('ko', 'KR'),

    supportedLocales: const [
      Locale('ko', 'KR'),
      Locale('en', 'US'),
    ],

    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],

    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor: AppColors.neutralWhite
    ),
    home: SplashPage(),
  ));
}