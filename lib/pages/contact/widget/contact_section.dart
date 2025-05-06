import 'package:abdullansr/core/colors.dart';
import 'package:abdullansr/core/text_styles.dart';
import 'package:abdullansr/pages/contact/widget/contact_form.dart';
import 'package:abdullansr/pages/contact/widget/contact_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWideScreen = size.width > 1200;
    final isMobile = size.width <= 600;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal:
            isWideScreen
                ? size.width * 0.1
                : isMobile
                ? 16
                : 24,
        vertical: isMobile ? 60 : 80,
      ),
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Shrink-wrap the column
        children: [
          // Section header with animated underline
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Text(
                'Get In Touch',
                style: TextStyles.displayMedium(context).copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 28 : null,
                ),
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

          SizedBox(height: isMobile ? 32 : 40),

          // Two-column layout for contact form and info
          isWideScreen
              ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Contact form
                  Flexible(
                    flex: 2,
                    fit: FlexFit.loose,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 32),
                      child: ContactForm(),
                    ),
                  ),
                  // Contact information
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: _buildContactInfo(context, isMobile),
                  ),
                ],
              )
              : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Contact information
                  _buildContactInfo(context, isMobile),
                  SizedBox(height: isMobile ? 32 : 40),
                  // Contact form
                  ContactForm(),
                ],
              ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context, bool isMobile) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Shrink-wrap
      children: [
        ContactInfoCard(
          icon: Icons.email,
          title: 'Email',
          value: 'abdullansr.connect@gmail.com',
          onTap:
              () => launchUrl(Uri.parse('mailto:abdullansr.connect@gmail.com')),
        ).animate().slideX(begin: 0.5, duration: 500.ms, delay: 200.ms),
        SizedBox(height: isMobile ? 16 : 20),
        ContactInfoCard(
          icon: Icons.phone,
          title: 'Phone',
          value: '+91 9207147500',
          onTap: () => launchUrl(Uri.parse('tel:+919207147500')),
        ).animate().slideX(begin: 0.5, duration: 500.ms, delay: 300.ms),
        SizedBox(height: isMobile ? 16 : 20),
        ContactInfoCard(
          icon: Icons.location_on,
          title: 'Location',
          value: 'Bengaluru, Karnataka, India',
          onTap:
              () =>
                  launchUrl(Uri.parse('https://maps.google.com/?q=Bengaluru')),
        ).animate().slideX(begin: 0.5, duration: 500.ms, delay: 400.ms),
        SizedBox(height: isMobile ? 32 : 40),
        Text(
          'Connect with me',
          style: TextStyles.headlineSmall(
            context,
          ).copyWith(fontSize: isMobile ? 20 : null),
        ).animate().fadeIn(delay: 500.ms),
        SizedBox(height: isMobile ? 12 : 16),
        Wrap(
          spacing: isMobile ? 8 : 12,
          alignment: WrapAlignment.center,
          children: [
            IconButton(
              onPressed:
                  () => launchUrl(
                    Uri.parse('https://www.linkedin.com/in/abdullanasarap/'),
                  ),
              icon: SvgPicture.asset(
                'assets/svgs/linkedin.svg',
                width: isMobile ? 24 : 30,
              ),
            ).animate().fadeIn(delay: 600.ms),
            IconButton(
              onPressed:
                  () =>
                      launchUrl(Uri.parse('https://github.com/AbdullaNasarAp')),
              icon: SvgPicture.asset(
                'assets/svgs/github.svg',
                width: isMobile ? 24 : 30,
              ),
            ).animate().fadeIn(delay: 700.ms),
            IconButton(
              onPressed:
                  () => launchUrl(Uri.parse('https://twitter.com/your-handle')),
              icon: Image.asset(
                'assets/image/x_logo.webp',
                width: isMobile ? 24 : 30,
              ),
            ).animate().fadeIn(delay: 800.ms),
          ],
        ),
      ],
    );
  }
}
