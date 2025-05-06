import 'package:abdullansr/core/colors.dart';
import 'package:abdullansr/core/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: size.width > 1200 ? size.width * 0.1 : 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Shrink-wrap the column
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title
          Text(
            'About Me',
            style: TextStyles.displayMedium(context),
          ).animate().fadeIn(delay: 200.ms),

          const SizedBox(height: 40),

          // Two-column layout for larger screens
          size.width > 768
              ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left column - Image and basic info
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // Shrink-wrap
                      children: [
                        Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary.withOpacity(0.1),
                            image: const DecorationImage(
                              image: AssetImage('assets/image/profile.jpeg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ).animate().scale(delay: 300.ms),

                        const SizedBox(height: 24),

                        Text(
                          'Bengaluru, Karnataka, India',
                          style: TextStyles.bodyLarge(context),
                        ).animate().fadeIn(delay: 400.ms),

                        const SizedBox(height: 8),

                        Text(
                          'abdullansr.connect@gmail.com',
                          style: TextStyles.bodyLarge(context),
                        ).animate().fadeIn(delay: 500.ms),

                        const SizedBox(height: 8),

                        Text(
                          '+91 9207147500',
                          style: TextStyles.bodyLarge(context),
                        ).animate().fadeIn(delay: 600.ms),

                        const SizedBox(height: 8),

                        ElevatedButton.icon(
                          onPressed: () {
                            launchUrl(
                              Uri.parse(
                                'https://drive.google.com/file/d/1qe7QksKgzzc1gZc6XC8OsVwcXGBWyVtL/view?usp=sharing',
                              ),
                            );
                          },
                          icon: const Icon(Icons.download),
                          label: const Text('Download Resume'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                          ),
                        ).animate().fadeIn(delay: 700.ms),
                      ],
                    ),
                  ),

                  const SizedBox(width: 48),

                  // Right column - Professional summary
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // Shrink-wrap
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Professional Summary',
                          style: TextStyles.headlineLarge(context),
                        ).animate().fadeIn(delay: 700.ms),

                        const SizedBox(height: 16),

                        Text(
                          'Dynamic Flutter Developer with over 2.5 years of experience architecting and deploying 6+ cross-platform mobile applications, driving a 15% reduction in errors and a 20% decrease in API latencies.',
                          style: TextStyles.bodyLarge(context),
                        ).animate().fadeIn(delay: 800.ms),

                        const SizedBox(height: 24),

                        Text(
                          'Expert in Clean Architecture, modular UI/UX design, and backend integration with Firebase and REST APIs, delivering seamless and scalable solutions. Adept at collaborating with cross-functional teams to enhance app performance and user satisfaction.',
                          style: TextStyles.bodyLarge(context),
                        ).animate().fadeIn(delay: 900.ms),

                        const SizedBox(height: 40),

                        // Experience timeline
                        Text(
                          'Experience Timeline',
                          style: TextStyles.headlineLarge(context),
                        ).animate().fadeIn(delay: 1.seconds),

                        const SizedBox(height: 24),

                        _buildTimelineItem(
                          context,
                          title: 'Flutter Developer | Aurin IT, Kazhikode',
                          duration: 'October 2024 – February 2025',
                          description:
                              'Developed the "Easy Cook" app for sales, service, and attendance management, reducing manual tracking errors by 40%. Implemented Clean Architecture and state management (GetX) for scalable and maintainable code.',
                          delay: 1.1.seconds,
                        ),

                        _buildTimelineItem(
                          context,
                          title:
                              'Flutter Developer | Ampcome Technologies, Bangalore',
                          duration: 'May 2023 – September 2024',
                          description:
                              'Developed and launched 5+ cross-platform mobile applications using Flutter, accumulating over 10,000 downloads. Optimized backend architecture with Hasura GraphQL and Nhost.',
                          delay: 1.3.seconds,
                        ),

                        _buildTimelineItem(
                          context,
                          title: 'Flutter Developer Trainee | Brototype',
                          duration: 'May 2022 – March 2023',
                          description:
                              'Integrated REST APIs with Flutter apps, enhancing user experience and app performance by 25%. Worked on live projects, resolving complex challenges to improve app usability.',
                          delay: 1.5.seconds,
                        ),
                      ],
                    ),
                  ),
                ],
              )
              : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image and basic info for smaller screens
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary.withOpacity(0.1),
                      image: const DecorationImage(
                        image: AssetImage('assets/image/profile.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ).animate().scale(delay: 300.ms),

                  const SizedBox(height: 24),

                  Text(
                    'Bengaluru, Karnataka, India',
                    style: TextStyles.bodyLarge(context),
                  ).animate().fadeIn(delay: 400.ms),

                  const SizedBox(height: 8),

                  Text(
                    'abdullansr.connect@gmail.com',
                    style: TextStyles.bodyLarge(context),
                  ).animate().fadeIn(delay: 500.ms),

                  const SizedBox(height: 8),

                  Text(
                    '+91 9207147500',
                    style: TextStyles.bodyLarge(context),
                  ).animate().fadeIn(delay: 600.ms),

                  const SizedBox(height: 8),

                  ElevatedButton.icon(
                    onPressed: () {
                      launchUrl(
                        Uri.parse(
                          'https://drive.google.com/file/d/1qe7QksKgzzc1gZc6XC8OsVwcXGBWyVtL/view?usp=sharing',
                        ),
                      );
                    },
                    icon: const Icon(Icons.download),
                    label: const Text('Download Resume'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                  ).animate().fadeIn(delay: 700.ms),

                  const SizedBox(height: 40),

                  // Professional summary
                  Text(
                    'Professional Summary',
                    style: TextStyles.headlineLarge(context),
                  ).animate().fadeIn(delay: 700.ms),

                  const SizedBox(height: 16),

                  Text(
                    'Dynamic Flutter Developer with over 2.5 years of experience architecting and deploying 6+ cross-platform mobile applications, driving a 15% reduction in errors and a 20% decrease in API latencies.',
                    style: TextStyles.bodyLarge(context),
                  ).animate().fadeIn(delay: 800.ms),

                  const SizedBox(height: 24),

                  Text(
                    'Expert in Clean Architecture, modular UI/UX design, and backend integration with Firebase and REST APIs, delivering seamless and scalable solutions. Adept at collaborating with cross-functional teams to enhance app performance and user satisfaction.',
                    style: TextStyles.bodyLarge(context),
                  ).animate().fadeIn(delay: 900.ms),

                  const SizedBox(height: 40),

                  // Experience timeline
                  Text(
                    'Experience Timeline',
                    style: TextStyles.headlineLarge(context),
                  ).animate().fadeIn(delay: 1.seconds),

                  const SizedBox(height: 24),

                  _buildTimelineItem(
                    context,
                    title: 'Flutter Developer | Aurin IT, Kazhikode',
                    duration: 'October 2024 – February 2025',
                    description:
                        'Developed the "Easy Cook" app for sales, service, and attendance management, reducing manual tracking errors by 40%. Implemented Clean Architecture and state management (GetX) for scalable and maintainable code.',
                    delay: 1.1.seconds,
                  ),

                  _buildTimelineItem(
                    context,
                    title:
                        'Flutter Developer | Ampcome Technologies, Bangalore',
                    duration: 'May 2023 – September 2024',
                    description:
                        'Developed and launched 5+ cross-platform mobile applications using Flutter, accumulating over 10,000 downloads. Optimized backend architecture with Hasura GraphQL and Nhost.',
                    delay: 1.3.seconds,
                  ),

                  _buildTimelineItem(
                    context,
                    title: 'Flutter Developer Trainee | Brototype',
                    duration: 'May 2022 – March 2023',
                    description:
                        'Integrated REST APIs with Flutter apps, enhancing user experience and app performance by 25%. Worked on live projects, resolving complex challenges to improve app usability.',
                    delay: 1.5.seconds,
                  ),
                ],
              ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(
    BuildContext context, {
    required String title,
    required String duration,
    required String description,
    required Duration delay,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline dot
          Container(
            width: 16,
            height: 16,
            margin: const EdgeInsets.only(top: 4, right: 16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
          ).animate().scale(delay: delay),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // Shrink-wrap
              children: [
                Text(
                  title,
                  style: TextStyles.headlineSmall(
                    context,
                  ).copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  duration,
                  style: TextStyles.bodyMedium(
                    context,
                  ).copyWith(color: AppColors.textSecondary),
                ),
                const SizedBox(height: 8),
                Text(description, style: TextStyles.bodyMedium(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
