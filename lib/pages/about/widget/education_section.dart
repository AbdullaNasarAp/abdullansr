// lib/widgets/education_section.dart
// ignore_for_file: deprecated_member_use

import 'package:abdullansr/core/colors.dart';
import 'package:abdullansr/core/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width > 1200 ? size.width * 0.1 : 24,
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Education',
            style: TextStyles.headlineLarge(context),
          ).animate().fadeIn(delay: 200.ms),

          const SizedBox(height: 24),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary.withOpacity(0.1),
                  ),
                  child: const Icon(Icons.school, size: 30),
                ).animate().scale(delay: 300.ms),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'GM Higher Secondary School, Mananthawady',
                        style: TextStyles.headlineSmall(context),
                      ).animate().fadeIn(delay: 400.ms),

                      Text(
                        'Commerce with Mathematics | GPA: 80%',
                        style: TextStyles.bodyLarge(context),
                      ).animate().fadeIn(delay: 500.ms),

                      Text(
                        'Completed: March 2021',
                        style: TextStyles.bodyMedium(
                          context,
                        ).copyWith(color: AppColors.textSecondary),
                      ).animate().fadeIn(delay: 600.ms),
                    ],
                  ),
                ),
              ],
            ),
          ).animate().slideX(begin: -0.5, duration: 500.ms, delay: 700.ms),
        ],
      ),
    );
  }
}
