// lib/widgets/testimonials_section.dart
// ignore_for_file: deprecated_member_use

import 'package:abdullansr/core/colors.dart';
import 'package:abdullansr/core/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

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
            'What Colleagues Say',
            style: TextStyles.headlineLarge(context),
          ).animate().fadeIn(delay: 200.ms),

          const SizedBox(height: 24),

          SizedBox(
            height: 220, // Fixed height to prevent vertical overflow
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                const SizedBox(width: 8), // Left padding
                _buildTestimonialCard(
                  context,
                  name: 'John Doe',
                  role: 'Project Manager, Ampcome',
                  text:
                      'Abdulla demonstrated exceptional Flutter skills during our project, delivering high-quality code ahead of schedule.',
                  delay: 300.ms,
                ),

                const SizedBox(width: 16),

                _buildTestimonialCard(
                  context,
                  name: 'Jane Smith',
                  role: 'UI/UX Designer, Aurin IT',
                  text:
                      'Working with Abdulla was a pleasure. His attention to design details and implementation was impressive.',
                  delay: 500.ms,
                ),

                const SizedBox(width: 16),

                _buildTestimonialCard(
                  context,
                  name: 'Mike Johnson',
                  role: 'Mentor, Brototype',
                  text:
                      'Abdulla showed rapid growth during training, quickly mastering complex Flutter concepts and applying them effectively.',
                  delay: 700.ms,
                ),
                const SizedBox(width: 8), // Right padding
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialCard(
    BuildContext context, {
    required String name,
    required String role,
    required String text,
    required Duration delay,
  }) {
    return SizedBox(
      width: 300,
      child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary.withOpacity(0.1),
                        ),
                        child: Icon(
                          Icons.person,
                          size: 30,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name, style: TextStyles.headlineSmall(context)),
                          Text(
                            role,
                            style: TextStyles.bodyMedium(
                              context,
                            ).copyWith(color: AppColors.textSecondary),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Text(
                      '"$text"',
                      style: TextStyles.bodyLarge(context),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: List.generate(
                      5,
                      (index) =>
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                    ),
                  ),
                ],
              ),
            ),
          )
          .animate(delay: delay)
          .scale(begin: const Offset(0.8, 0.8), curve: Curves.easeOutBack),
    );
  }
}
