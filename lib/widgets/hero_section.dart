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

    return SizedBox(
      height: size.height * 0.9,
      child: Stack(
        children: [
          const AnimatedBackground(),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width > 1200 ? size.width * 0.1 : 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Greeting text
                Text(
                  'Hi, I\'m',
                  style: TextStyles.headlineLarge(
                    context,
                  ).copyWith(color: AppColors.textSecondary),
                ).animate().fadeIn(delay: 300.ms),

                const SizedBox(height: 8),

                // Name with typing animation
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Abdulla Nasar',
                      textStyle: TextStyles.displayLarge(context),
                      speed: 50.ms,
                    ),
                  ],
                  totalRepeatCount: 1,
                ),

                const SizedBox(height: 16),

                // Professional title with color change animation
                Row(
                  children: [
                    Text(
                      'I\'m a ',
                      style: TextStyles.headlineLarge(
                        context,
                      ).copyWith(color: AppColors.textSecondary),
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
                                  textStyle: TextStyles.headlineLarge(context),
                                  colors: [
                                    AppColors.primary,
                                    AppColors.primaryDark,
                                    AppColors.accent,
                                  ],
                                  speed: 100.ms,
                                ),
                              )
                              .toList(),
                      repeatForever: true,
                      pause: 2.seconds,
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Professional summary
                SizedBox(
                  width: size.width > 768 ? 600 : double.infinity,
                  child: Text(
                    'Dynamic Flutter Developer with over 2.5 years of experience architecting and deploying 6+ cross-platform mobile applications, driving a 15% reduction in errors and a 20% decrease in API latencies.',
                    style: TextStyles.bodyLarge(context),
                    softWrap: true,
                  ).animate().fadeIn(delay: 800.ms),
                ),

                const SizedBox(height: 40),

                // Call-to-action buttons
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () => context.go('/projects'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                      ),
                      child: Text(
                        'View My Work',
                        style: TextStyles.button(context),
                      ),
                    ).animate().slideX(
                      begin: -0.5,
                      duration: 500.ms,
                      delay: 1.seconds,
                    ),

                    const SizedBox(width: 16),

                    OutlinedButton(
                      onPressed: () => context.go('/contact'),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.textPrimary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        side: BorderSide(color: AppColors.primary),
                      ),
                      child: Text(
                        'Contact Me',
                        style: TextStyles.button(context),
                      ),
                    ).animate().slideX(
                      begin: 0.5,
                      duration: 500.ms,
                      delay: 1.seconds,
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // Social media links
                Row(
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/svgs/linkedin.svg',
                        width: 24,
                        // color: AppColors.textSecondary,
                      ),
                      onPressed:
                          () => launchUrl(
                            Uri.parse('https://linkedin.com/in/your-profile'),
                          ),
                    ).animate().fadeIn(delay: 1.2.seconds),

                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/svgs/github.svg',
                        width: 24,
                        // color: AppColors.textSecondary,
                      ),
                      onPressed:
                          () => launchUrl(
                            Uri.parse('https://github.com/your-username'),
                          ),
                    ).animate().fadeIn(delay: 1.3.seconds),

                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/svgs/email.svg',
                        width: 24,
                        // color: AppColors.textSecondary,
                      ),
                      onPressed:
                          () => launchUrl(
                            Uri.parse('mailto:abdullansr.connect@gmail.com'),
                          ),
                    ).animate().fadeIn(delay: 1.4.seconds),

                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/svgs/call.svg',
                        width: 24,
                        // color: AppColors.textSecondary,
                      ),
                      onPressed:
                          () => launchUrl(Uri.parse('tel:+919207147500')),
                    ).animate().fadeIn(delay: 1.5.seconds),
                  ],
                ),

                // Tech stack
                Column(
                  children: [
                    const SizedBox(height: 40),
                    Text(
                      'Tech Stack',
                      style: TextStyles.bodyLarge(
                        context,
                      ).copyWith(color: AppColors.textSecondary),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 24,
                      runSpacing: 16,
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/flutter.svg',
                          width: 40,
                        ).animate().scale(delay: 1.6.seconds),
                        SvgPicture.asset(
                          'assets/svgs/dart.svg',
                          width: 40,
                        ).animate().scale(delay: 1.7.seconds),
                        SvgPicture.asset(
                          'assets/svgs/firebase.svg',
                          width: 40,
                        ).animate().scale(delay: 1.8.seconds),
                        SvgPicture.asset(
                          'assets/svgs/graphql.svg',
                          width: 40,
                        ).animate().scale(delay: 1.9.seconds),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
