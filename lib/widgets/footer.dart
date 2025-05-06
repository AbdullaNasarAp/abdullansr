import 'package:abdullansr/core/colors.dart';
import 'package:abdullansr/core/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Define responsive breakpoints
        final isWideScreen = constraints.maxWidth > 1200;
        final isTablet =
            constraints.maxWidth > 600 && constraints.maxWidth <= 1200;
        final isMobile = constraints.maxWidth <= 600;

        // Dynamic padding based on screen size
        final horizontalPadding =
            isWideScreen
                ? constraints.maxWidth * 0.1
                : isTablet
                ? constraints.maxWidth * 0.05
                : 12.0; // Reduced for mobile
        final verticalPadding =
            isMobile
                ? 32.0
                : isTablet
                ? 40.0
                : 60.0;

        // Dynamic spacing
        final sectionSpacing =
            isWideScreen
                ? 48.0
                : isTablet
                ? 32.0
                : 16.0;
        final textScaler = MediaQuery.textScalerOf(context);

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          color: AppColors.primary.withOpacity(0.05),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Shrink-wrap the column
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Footer content
              isWideScreen || isTablet
                  ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Brand info
                      Expanded(
                        flex: isWideScreen ? 2 : 1,
                        child: _buildBrandInfo(
                          context,
                          isMobile,
                          sectionSpacing,
                          textScaler,
                        ),
                      ),
                      SizedBox(width: sectionSpacing),
                      // Quick links
                      Expanded(
                        flex: 1,
                        child: _buildQuickLinks(
                          context,
                          isMobile,
                          sectionSpacing,
                          textScaler,
                        ),
                      ),
                      SizedBox(width: sectionSpacing),
                      // Contact info
                      Expanded(
                        flex: 1,
                        child: _buildContactInfoSection(
                          context,
                          isMobile,
                          sectionSpacing,
                          textScaler,
                        ),
                      ),
                    ],
                  )
                  : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Brand info
                      _buildBrandInfo(
                        context,
                        isMobile,
                        sectionSpacing,
                        textScaler,
                      ),
                      SizedBox(height: sectionSpacing),
                      // Quick links
                      _buildQuickLinks(
                        context,
                        isMobile,
                        sectionSpacing,
                        textScaler,
                      ),
                      SizedBox(height: sectionSpacing),
                      // Contact info
                      _buildContactInfoSection(
                        context,
                        isMobile,
                        sectionSpacing,
                        textScaler,
                      ),
                    ],
                  ),

              SizedBox(height: sectionSpacing),

              // Copyright and credits
              Divider(color: Colors.grey.shade300),
              SizedBox(height: sectionSpacing / 2),
              isMobile
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '© ${DateTime.now().year} Abdulla Nasar. All rights reserved',
                        style: TextStyles.bodySmall(context).copyWith(
                          color: Colors.grey.shade600,
                          fontSize: textScaler.scale(11),
                        ),
                        textAlign: TextAlign.center,
                      ).animate().fadeIn(delay: 400.ms),
                      SizedBox(height: 8),
                      Text(
                        'Made with Flutter 💙',
                        style: TextStyles.bodySmall(context).copyWith(
                          color: Colors.grey.shade600,
                          fontSize: textScaler.scale(11),
                        ),
                        textAlign: TextAlign.center,
                      ).animate().fadeIn(delay: 500.ms),
                    ],
                  )
                  : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '© ${DateTime.now().year} Abdulla Nasar. All rights reserved',
                        style: TextStyles.bodySmall(context).copyWith(
                          color: Colors.grey.shade600,
                          fontSize: textScaler.scale(13),
                        ),
                      ).animate().fadeIn(delay: 400.ms),
                      Text(
                        'Made with Flutter 💙',
                        style: TextStyles.bodySmall(context).copyWith(
                          color: Colors.grey.shade600,
                          fontSize: textScaler.scale(13),
                        ),
                      ).animate().fadeIn(delay: 500.ms),
                    ],
                  ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBrandInfo(
    BuildContext context,
    bool isMobile,
    double sectionSpacing,
    TextScaler textScaler,
  ) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment:
              isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            Container(
              width: isMobile ? 28 : 36,
              height: isMobile ? 28 : 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
              ),
              child: Icon(
                Icons.code,
                color: Colors.white,
                size: isMobile ? 14 : 18,
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                'Abdulla Nasar',
                style: TextStyles.headlineSmall(context).copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: textScaler.scale(isMobile ? 16 : 22),
                ),
                textAlign: isMobile ? TextAlign.center : TextAlign.left,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        SizedBox(height: sectionSpacing / 2),
        Text(
          'Flutter Developer creating high-quality mobile applications with focus on clean architecture and beautiful UI.',
          style: TextStyles.bodyMedium(context).copyWith(
            color: Colors.grey.shade600,
            fontSize: textScaler.scale(isMobile ? 12 : 14),
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        SizedBox(height: sectionSpacing / 2),
        Wrap(
          spacing: isMobile ? 8 : 10,
          runSpacing: 6,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            _buildSocialIcon(
              icon: Icons.email,
              size: isMobile ? 28 : 36,
              onTap:
                  () => launchUrl(
                    Uri.parse('mailto:abdullansr.connect@gmail.com'),
                  ),
            ),
            _buildSocialIcon(
              icon: Icons.phone,
              size: isMobile ? 28 : 36,
              onTap: () => launchUrl(Uri.parse('tel:+919207147500')),
            ),
            _buildSocialIcon(
              image: 'assets/svgs/linkedin.svg',
              size: isMobile ? 28 : 36,
              onTap:
                  () => launchUrl(
                    Uri.parse('https://www.linkedin.com/in/abdullanasarap/'),
                  ),
            ),
            _buildSocialIcon(
              image: 'assets/svgs/github.svg',
              size: isMobile ? 28 : 36,
              onTap:
                  () =>
                      launchUrl(Uri.parse('https://github.com/AbdullaNasarAp')),
            ),
          ],
        ),
      ],
    ).animate().fadeIn(delay: 100.ms);
  }

  Widget _buildQuickLinks(
    BuildContext context,
    bool isMobile,
    double sectionSpacing,
    TextScaler textScaler,
  ) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Quick Links',
          style: TextStyles.headlineSmall(context).copyWith(
            fontWeight: FontWeight.bold,
            fontSize: textScaler.scale(isMobile ? 16 : 20),
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        SizedBox(height: sectionSpacing / 2),
        _buildFooterLink(
          context,
          'Home',
          () => context.go('/'),
          isMobile: isMobile,
          textScaler: textScaler,
        ),
        _buildFooterLink(
          context,
          'About',
          () => context.go('/about'),
          isMobile: isMobile,
          textScaler: textScaler,
        ),
        _buildFooterLink(
          context,
          'Projects',
          () => context.go('/projects'),
          isMobile: isMobile,
          textScaler: textScaler,
        ),
        _buildFooterLink(
          context,
          'Contact',
          () => context.go('/contact'),
          isMobile: isMobile,
          textScaler: textScaler,
        ),
      ],
    ).animate().fadeIn(delay: 200.ms);
  }

  Widget _buildContactInfoSection(
    BuildContext context,
    bool isMobile,
    double sectionSpacing,
    TextScaler textScaler,
  ) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Contact Info',
          style: TextStyles.headlineSmall(context).copyWith(
            fontWeight: FontWeight.bold,
            fontSize: textScaler.scale(isMobile ? 16 : 20),
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        SizedBox(height: sectionSpacing / 2),
        _buildContactInfo(
          context,
          icon: Icons.email,
          text: 'abdullansr.connect@gmail.com',
          textScaler: textScaler,
          isMobile: isMobile,
          onTap:
              () => launchUrl(Uri.parse('mailto:abdullansr.connect@gmail.com')),
        ),
        _buildContactInfo(
          context,
          icon: Icons.phone,
          text: '+91 9207147500',
          textScaler: textScaler,
          isMobile: isMobile,
          onTap: () => launchUrl(Uri.parse('tel:+919207147500')),
        ),
        _buildContactInfo(
          context,
          icon: Icons.location_on,
          text: 'Bengaluru, Karnataka, India',
          textScaler: textScaler,
          isMobile: isMobile,
          onTap:
              () =>
                  launchUrl(Uri.parse('https://maps.google.com/?q=Bengaluru')),
        ),
      ],
    ).animate().fadeIn(delay: 300.ms);
  }

  Widget _buildSocialIcon({
    IconData? icon,
    String? image,
    required VoidCallback onTap,
    required double size,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child:
              icon != null
                  ? Icon(icon, size: size * 0.5, color: Colors.grey.shade700)
                  : SvgPicture.asset(image!, width: size * 0.5),
        ),
      ),
    );
  }

  Widget _buildFooterLink(
    BuildContext context,
    String text,
    VoidCallback onTap, {
    required bool isMobile,
    required TextScaler textScaler,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Text(
            text,
            style: TextStyles.bodyMedium(context).copyWith(
              color: Colors.grey.shade600,
              fontSize: textScaler.scale(isMobile ? 12 : 14),
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo(
    BuildContext context, {
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    required TextScaler textScaler,
    required bool isMobile,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment:
                isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              Icon(icon, size: isMobile ? 12 : 14, color: Colors.grey.shade600),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  text,
                  style: TextStyles.bodyMedium(context).copyWith(
                    color: Colors.grey.shade600,
                    fontSize: textScaler.scale(isMobile ? 12 : 14),
                  ),
                  textAlign: isMobile ? TextAlign.center : TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
