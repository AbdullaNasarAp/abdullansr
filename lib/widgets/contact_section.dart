// ignore_for_file: deprecated_member_use

import 'package:abdullansr/core/colors.dart';
import 'package:abdullansr/core/text_styles.dart';
import 'package:abdullansr/widgets/contact_form.dart';
import 'package:abdullansr/widgets/contact_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width > 1200 ? size.width * 0.1 : 24,
        vertical: 80,
      ),
      decoration: BoxDecoration(),
      child: Column(
        children: [
          // Section header with animated underline
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Text(
                'Get In Touch',
                style: TextStyles.displayMedium(
                  context,
                ).copyWith(fontWeight: FontWeight.bold),
              ),
              Positioned(
                bottom: -8,
                left: 0,
                child: Container(
                      width: 100,
                      height: 4,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.primary, AppColors.accent],
                        ),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    )
                    .animate(
                      onPlay: (controller) => controller.repeat(reverse: true),
                    )
                    .scaleX(
                      begin: 1,
                      end: 1.2,
                      duration: 2.seconds,
                      curve: Curves.easeInOut,
                    ),
              ),
            ],
          ),

          const SizedBox(height: 40),

          // Two-column layout for contact form and info
          Flex(
            direction: size.width > 1200 ? Axis.horizontal : Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Contact form
              if (size.width > 1200)
                const Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(right: 40),
                    child: ContactForm(),
                  ),
                ),

              // Contact information
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    ContactInfoCard(
                      icon: Icons.email,
                      title: 'Email',
                      value: 'abdullansr.connect@gmail.com',
                      onTap:
                          () => launchUrl(
                            Uri.parse('mailto:abdullansr.connect@gmail.com'),
                          ),
                    ).animate().slideX(
                      begin: 0.5,
                      duration: 500.ms,
                      delay: 200.ms,
                    ),

                    const SizedBox(height: 20),

                    ContactInfoCard(
                      icon: Icons.phone,
                      title: 'Phone',
                      value: '+91 9207147500',
                      onTap: () => launchUrl(Uri.parse('tel:+919207147500')),
                    ).animate().slideX(
                      begin: 0.5,
                      duration: 500.ms,
                      delay: 300.ms,
                    ),

                    const SizedBox(height: 20),

                    ContactInfoCard(
                      icon: Icons.location_on,
                      title: 'Location',
                      value: 'Bengaluru, Karnataka, India',
                      onTap:
                          () => launchUrl(
                            Uri.parse('https://maps.google.com/?q=Bengaluru'),
                          ),
                    ).animate().slideX(
                      begin: 0.5,
                      duration: 500.ms,
                      delay: 400.ms,
                    ),

                    const SizedBox(height: 40),

                    // Social media links
                    Text(
                      'Connect with me',
                      style: TextStyles.headlineSmall(context),
                    ).animate().fadeIn(delay: 500.ms),

                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed:
                              () => launchUrl(
                                Uri.parse(
                                  'https://linkedin.com/in/your-profile',
                                ),
                              ),
                          icon: SvgPicture.asset(
                            'assets/svgs/linkedin.svg',
                            width: 30,
                          ),
                        ).animate().fadeIn(delay: 600.ms),

                        IconButton(
                          onPressed:
                              () => launchUrl(
                                Uri.parse('https://github.com/your-username'),
                              ),
                          icon: SvgPicture.asset(
                            'assets/svgs/github.svg',
                            width: 30,
                          ),
                        ).animate().fadeIn(delay: 700.ms),

                        IconButton(
                          onPressed:
                              () => launchUrl(
                                Uri.parse('https://twitter.com/your-handle'),
                              ),
                          icon: Image.asset(
                            'assets/image/x_logo.webp',
                            width: 30,
                          ),
                        ).animate().fadeIn(delay: 800.ms),
                      ],
                    ),
                  ],
                ),
              ),

              // Show form below on mobile
              if (size.width <= 1200) ...[
                const SizedBox(height: 40),
                const ContactForm(),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
