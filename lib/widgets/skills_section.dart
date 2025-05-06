// ignore_for_file: deprecated_member_use

import 'package:abdullansr/core/colors.dart';
import 'package:abdullansr/core/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: size.width > 1200 ? size.width * 0.1 : 24,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title
          Text(
            'Skills & Expertise',
            style: TextStyles.displayMedium(context),
          ).animate().fadeIn(delay: 200.ms),

          const SizedBox(height: 40),

          // Skills categories
          _buildSkillsCategory(
            context,
            title: 'Flutter Development',
            skills: [
              'Flutter Framework (Widget Development, Custom Animations)',
              'Dart Programming (Asynchronous Operations, Streams)',
              'Material Design & Cupertino Widgets',
              'Responsive UI Implementation',
              'State Management (GetX, Provider, Riverpod)',
              'Clean Architecture',
            ],
            delay: 300.ms,
          ),

          _buildSkillsCategory(
            context,
            title: 'Backend Integration',
            skills: [
              'Firebase (Firestore, Authentication, Cloud Functions)',
              'REST API Integration (JSON Parsing, Error Handling)',
              'GraphQL (Basic Queries, Apollo Client)',
              'Offline Data Sync (Hive, SQLite)',
            ],
            delay: 500.ms,
          ),

          _buildSkillsCategory(
            context,
            title: 'Tools & Technologies',
            skills: [
              'Git (GitHub, GitLab)',
              'Android Studio & VSCode',
              'Postman (API Testing)',
              'CI/CD Pipelines (GitHub Actions)',
              'Unit & Widget Testing',
            ],
            delay: 700.ms,
          ),

          const SizedBox(height: 40),

          // Technical proficiency
          Text(
            'Technical Proficiency',
            style: TextStyles.headlineLarge(context),
          ).animate().fadeIn(delay: 900.ms),

          const SizedBox(height: 24),

          // Skill bars
          _buildSkillBar(
            context,
            skill: 'Flutter Framework',
            percentage: 0.9,
            delay: 1.seconds,
          ),

          _buildSkillBar(
            context,
            skill: 'Dart Programming',
            percentage: 0.85,
            delay: 1.1.seconds,
          ),

          _buildSkillBar(
            context,
            skill: 'Firebase',
            percentage: 0.8,
            delay: 1.2.seconds,
          ),

          _buildSkillBar(
            context,
            skill: 'REST API Integration',
            percentage: 0.85,
            delay: 1.3.seconds,
          ),

          _buildSkillBar(
            context,
            skill: 'UI/UX Implementation',
            percentage: 0.75,
            delay: 1.4.seconds,
          ),

          const SizedBox(height: 40),

          // Tech stack icons
          Text(
            'Tech Stack',
            style: TextStyles.headlineLarge(context),
          ).animate().fadeIn(delay: 1.5.seconds),

          const SizedBox(height: 24),

          Wrap(
            spacing: 24,
            runSpacing: 16,
            children: [
              _buildTechStackItem(
                'Flutter',
                'assets/svgs/flutter.svg',
                1.6.seconds,
              ),
              _buildTechStackItem('Dart', 'assets/svgs/dart.svg', 1.7.seconds),
              _buildTechStackItem(
                'Firebase',
                'assets/svgs/firebase.svg',
                1.8.seconds,
              ),
              _buildTechStackItem(
                'GraphQL',
                'assets/svgs/graphql.svg',
                1.9.seconds,
              ),
              _buildTechStackItem('Git', 'assets/svgs/github.svg', 2.seconds),
              _buildTechStackItem(
                'REST API',
                'assets/svgs/rest_api.svg',
                2.1.seconds,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsCategory(
    BuildContext context, {
    required String title,
    required List<String> skills,
    required Duration delay,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.headlineSmall(
              context,
            ).copyWith(color: AppColors.primary),
          ).animate().fadeIn(delay: delay),

          const SizedBox(height: 16),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                skills
                    .map(
                      (skill) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 6, right: 8),
                              child: Icon(
                                Icons.circle,
                                size: 8,
                                color: AppColors.primary,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                skill,
                                style: TextStyles.bodyLarge(context),
                              ),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(delay: delay + 100.ms),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillBar(
    BuildContext context, {
    required String skill,
    required double percentage,
    required Duration delay,
  }) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Padding(
      padding: EdgeInsets.only(bottom: isMobile ? 12 : 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Shrink-wrap content
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  skill,
                  style: TextStyles.bodyLarge(
                    context,
                  ).copyWith(fontSize: isMobile ? 14 : null),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '${(percentage * 100).toInt()}%',
                style: TextStyles.bodyLarge(context).copyWith(
                  color: AppColors.textSecondary,
                  fontSize: isMobile ? 14 : null,
                ),
              ),
            ],
          ).animate().fadeIn(delay: delay),
          SizedBox(height: isMobile ? 6 : 8),
          LinearProgressIndicator(
                value: percentage,
                minHeight: isMobile ? 6 : 8,
                backgroundColor: AppColors.primary.withOpacity(0.1),
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                borderRadius: BorderRadius.circular(4),
              )
              .animate(delay: delay)
              .scaleX(begin: 0, duration: 800.ms, curve: Curves.easeOut),
        ],
      ),
    );
  }

  Widget _buildTechStackItem(String name, String iconPath, Duration delay) {
    return Column(
      children: [
        Container(
              width: 80,
              height: 80,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: SvgPicture.asset(iconPath, width: 40),
            )
            .animate(delay: delay)
            .scale(begin: const Offset(0.5, 0.5), curve: Curves.elasticOut),
        const SizedBox(height: 8),
        Text(name, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
