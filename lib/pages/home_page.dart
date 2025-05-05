import 'package:abdullansr/widgets/animated_background_for_about.dart';
import 'package:abdullansr/widgets/hero_section.dart';
import 'package:abdullansr/widgets/nav_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                const HeroSection(),
                // We'll add other sections here later
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
