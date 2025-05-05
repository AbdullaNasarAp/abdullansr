import 'package:abdullansr/widgets/animated_background_for_about.dart';
import 'package:abdullansr/widgets/contact_section.dart';
import 'package:abdullansr/widgets/nav_bar.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

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
                const ContactSection(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
