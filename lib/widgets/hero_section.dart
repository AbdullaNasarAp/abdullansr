import 'package:abdullansr/core/colors.dart';
import 'package:abdullansr/core/text_styles.dart';
import 'package:abdullansr/widgets/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 768;

    return SizedBox(
      height: isMobile ? size.height * 0.85 : size.height * 0.9,
      child: Stack(
        children: [
          const AnimatedBackground(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal:
                  isMobile
                      ? 16
                      : size.width > 1200
                      ? size.width * 0.1
                      : 24,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Greeting text
                  Text(
                    'Hi, I\'m',
                    style: TextStyles.headlineLarge(context).copyWith(
                      color: AppColors.textSecondary,
                      fontSize: isMobile ? 18 : null,
                    ),
                  ).animate().fadeIn(delay: 300.ms),

                  SizedBox(height: isMobile ? 4 : 8),

                  // Name with typing animation
                  DefaultTextStyle(
                    style: TextStyles.displayLarge(
                      context,
                    ).copyWith(fontSize: isMobile ? 32 : null),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText('Abdulla Nasar', speed: 50.ms),
                      ],
                      totalRepeatCount: 1,
                    ),
                  ),

                  SizedBox(height: isMobile ? 8 : 16),

                  // Professional title
                  DefaultTextStyle(
                    style: TextStyles.headlineLarge(
                      context,
                    ).copyWith(fontSize: isMobile ? 16 : null),
                    child: Row(
                      children: [
                        Text(
                          'I\'m a ',
                          style: TextStyle(color: AppColors.textSecondary),
                        ),
                        AnimatedTextKit(
                          animatedTexts:
                              [
                                    'Flutter Developer',
                                    'Mobile App Developer',
                                    'UI/UX Enthusiast',
                                  ]
                                  .map(
                                    (text) => ColorizeAnimatedText(
                                      text,
                                      colors: [
                                        AppColors.primary,
                                        AppColors.primaryDark,
                                        AppColors.accent,
                                      ],
                                      speed: 100.ms,
                                      textStyle: TextStyles.headlineMedium(
                                        context,
                                      ),
                                    ),
                                  )
                                  .toList(),
                          repeatForever: true,
                          pause: 2.seconds,
                          isRepeatingAnimation: true,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: isMobile ? 12 : 24),

                  // Professional summary
                  SizedBox(
                    width: isMobile ? double.infinity : 600,
                    child: Text(
                      'Dynamic Flutter Developer with over 2.5 years of experience architecting and deploying 6+ cross-platform mobile applications, driving a 15% reduction in errors and a 20% decrease in API latencies.',
                      style: TextStyles.bodyLarge(
                        context,
                      ).copyWith(fontSize: isMobile ? 13 : null),
                      softWrap: true,
                    ).animate().fadeIn(delay: 800.ms),
                  ),

                  SizedBox(height: isMobile ? 16 : 40),

                  // Call-to-action buttons
                  Flex(
                    direction: isMobile ? Axis.vertical : Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () => context.go('/projects'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 20 : 32,
                            vertical: isMobile ? 10 : 16,
                          ),
                        ),
                        child: Text(
                          'View My Work',
                          style: TextStyles.button(
                            context,
                          ).copyWith(fontSize: isMobile ? 13 : null),
                        ),
                      ).animate().slideX(
                        begin: -0.5,
                        duration: 500.ms,
                        delay: 1.seconds,
                      ),

                      SizedBox(
                        width: isMobile ? 0 : 16,
                        height: isMobile ? 8 : 0,
                      ),

                      OutlinedButton(
                        onPressed: () => context.go('/contact'),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: AppColors.textPrimary,
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 20 : 32,
                            vertical: isMobile ? 10 : 16,
                          ),
                          side: BorderSide(color: AppColors.primary),
                        ),
                        child: Text(
                          'Contact Me',
                          style: TextStyles.button(
                            context,
                          ).copyWith(fontSize: isMobile ? 13 : null),
                        ),
                      ).animate().slideX(
                        begin: isMobile ? 0.5 : 0.5,
                        duration: 500.ms,
                        delay: 1.seconds,
                      ),
                    ],
                  ),

                  SizedBox(height: isMobile ? 16 : 40),

                  // Social media links
                  Wrap(
                    spacing: isMobile ? 8 : 16,
                    children: [
                      IconButton(
                        icon: SvgPicture.asset(
                          'assets/svgs/linkedin.svg',
                          width: isMobile ? 18 : 24,
                        ),
                        onPressed:
                            () => launchUrl(
                              Uri.parse(
                                'https://www.linkedin.com/in/abdullanasarap/',
                              ),
                            ),
                      ).animate().fadeIn(delay: 1.2.seconds),

                      IconButton(
                        icon: SvgPicture.asset(
                          'assets/svgs/github.svg',
                          width: isMobile ? 18 : 24,
                        ),
                        onPressed:
                            () => launchUrl(
                              Uri.parse('https://github.com/AbdullaNasarAp'),
                            ),
                      ).animate().fadeIn(delay: 1.3.seconds),

                      IconButton(
                        icon: SvgPicture.asset(
                          'assets/svgs/email.svg',
                          width: isMobile ? 18 : 24,
                        ),
                        onPressed:
                            () => launchUrl(
                              Uri.parse('mailto:abdullansr.connect@gmail.com'),
                            ),
                      ).animate().fadeIn(delay: 1.4.seconds),

                      IconButton(
                        icon: SvgPicture.asset(
                          'assets/svgs/call.svg',
                          width: isMobile ? 18 : 24,
                        ),
                        onPressed:
                            () => launchUrl(Uri.parse('tel:+919207147500')),
                      ).animate().fadeIn(delay: 1.5.seconds),
                    ],
                  ),

                  // Tech stack
                  Column(
                    children: [
                      SizedBox(height: isMobile ? 16 : 40),
                      Text(
                        'Tech Stack',
                        style: TextStyles.bodyLarge(context).copyWith(
                          color: AppColors.textSecondary,
                          fontSize: isMobile ? 13 : null,
                        ),
                      ),
                      SizedBox(height: isMobile ? 8 : 16),
                      Wrap(
                        spacing: isMobile ? 10 : 24,
                        runSpacing: isMobile ? 6 : 16,
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/flutter.svg',
                            width: isMobile ? 28 : 40,
                          ).animate().scale(delay: 1.6.seconds),
                          SvgPicture.asset(
                            'assets/svgs/dart.svg',
                            width: isMobile ? 28 : 40,
                          ).animate().scale(delay: 1.7.seconds),
                          SvgPicture.asset(
                            'assets/svgs/firebase.svg',
                            width: isMobile ? 28 : 40,
                          ).animate().scale(delay: 1.8.seconds),
                          SvgPicture.asset(
                            'assets/svgs/graphql.svg',
                            width: isMobile ? 28 : 40,
                          ).animate().scale(delay: 1.9.seconds),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
