import 'package:abdullansr/app/router.dart';
import 'package:abdullansr/core/colors.dart';
import 'package:flutter/material.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Abdulla Nasar - Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.primaryDark,
          surface: AppColors.surface,
          background: AppColors.background,
          error: AppColors.error,
        ),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
