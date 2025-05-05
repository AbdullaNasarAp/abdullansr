import 'package:abdullansr/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Blob 1
        Positioned(
          right: -100,
          top: 100,
          child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary.withOpacity(0.1),
                ),
              )
              .animate(onPlay: (controller) => controller.repeat())
              .scale(
                begin: const Offset(1, 1),
                end: const Offset(1.2, 1.2),
                duration: 5.seconds,
              )
              .then()
              .scale(
                begin: const Offset(1.2, 1.2),
                end: const Offset(1, 1),
                duration: 5.seconds,
              ),
        ),

        // Blob 2
        Positioned(
          left: -50,
          bottom: 100,
          child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.accent.withOpacity(0.1),
                ),
              )
              .animate(onPlay: (controller) => controller.repeat())
              .scale(
                begin: const Offset(1, 1), // Using Offset for scaling
                end: const Offset(1.3, 1.3),
                duration: 4.seconds,
                curve: Curves.easeInOut,
              )
              .then()
              .scale(
                begin: const Offset(1.3, 1.3),
                end: const Offset(1, 1),
                duration: 4.seconds,
                curve: Curves.easeInOut,
              ),
        ),
      ],
    );
  }
}
