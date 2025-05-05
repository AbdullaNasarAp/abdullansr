// lib/pages/about_page.dart
import 'package:abdullansr/core/colors.dart';
import 'package:abdullansr/widgets/about_section.dart';
import 'package:abdullansr/widgets/animated_background_for_about.dart';
import 'package:abdullansr/widgets/education_section.dart';
import 'package:abdullansr/widgets/nav_bar.dart';
import 'package:abdullansr/widgets/skills_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AnimatedAboutBackground(),
          SingleChildScrollView(
            child: Column(
              children: [
                const NavBar(),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    children: [
                      const AboutSection(),
                      const SizedBox(height: 80),
                      const EducationSection(),
                      const SizedBox(height: 80),
                      const SkillsSection(),
                      const SizedBox(height: 80),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(
                      //     horizontal:
                      //         MediaQuery.of(context).size.width > 1200
                      //             ? MediaQuery.of(context).size.width * 0.1
                      //             : 24,
                      //   ),
                      //   child: const TestimonialsSection(),
                      // ),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          launchUrl(
            Uri.parse(
              'https://drive.google.com/file/d/1qe7QksKgzzc1gZc6XC8OsVwcXGBWyVtL/view?usp=sharing',
            ),
          );
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.download, color: Colors.white),
      ).animate().scale(delay: 2.seconds),
    );
  }
}
