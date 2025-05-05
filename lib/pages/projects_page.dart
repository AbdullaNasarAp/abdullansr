// lib/pages/projects_page.dart
import 'package:abdullansr/widgets/animated_background_for_about.dart';
import 'package:abdullansr/widgets/nav_bar.dart';
import 'package:abdullansr/widgets/projects_section.dart';
import 'package:flutter/material.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedAboutBackground(),
          SingleChildScrollView(
            child: Column(
              children: [
                const NavBar(),
                const PremiumProjectsSection(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
