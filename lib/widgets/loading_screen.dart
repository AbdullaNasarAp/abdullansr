import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:abdullansr/core/colors.dart';
import 'package:abdullansr/core/text_styles.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your logo or initials
            Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      'AN',
                      style: TextStyles.displayLarge(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                  ),
                )
                .animate(onPlay: (controller) => controller.repeat())
                .scale(
                  begin: const Offset(1, 1), // Use Offset instead of double
                  end: const Offset(1.1, 1.1),
                  duration: 1.seconds,
                  curve: Curves.easeInOut,
                )
                .then()
                .scale(
                  begin: const Offset(1.1, 1.1),
                  end: const Offset(1, 1),
                  duration: 1.seconds,
                  curve: Curves.easeInOut,
                ),

            const SizedBox(height: 30),

            // Loading text with shimmer effect
            Text('Loading Portfolio', style: TextStyles.headlineLarge(context))
                .animate(onPlay: (controller) => controller.repeat())
                .shimmer(
                  duration: 2.seconds,
                  colors: [
                    AppColors.textSecondary,
                    AppColors.primary,
                    AppColors.textSecondary,
                  ],
                ),

            const SizedBox(height: 30),

            // Progress indicator
            SizedBox(
              width: 200,
              child: LinearProgressIndicator(
                backgroundColor: AppColors.textSecondary.withOpacity(0.1),
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                minHeight: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
