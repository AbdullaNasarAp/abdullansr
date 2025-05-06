// lib/pages/projects_page.dart
import 'package:abdullansr/widgets/animated_background_for_about.dart';
import 'package:abdullansr/widgets/footer.dart';
import 'package:abdullansr/widgets/nav_bar.dart';
import 'package:abdullansr/widgets/projects_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).uri.toString();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: NavBar(currentPath: currentPath),
      ),
      body: Stack(
        children: [
          AnimatedAboutBackground(),
          SingleChildScrollView(
            child: Column(
              children: [
                // NavBar(currentPath: currentPath),
                const PremiumProjectsSection(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                const Footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
