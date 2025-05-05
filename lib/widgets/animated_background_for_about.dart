// lib/widgets/animated_background.dart
import 'package:abdullansr/core/colors.dart';
import 'package:abdullansr/widgets/particles_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedAboutBackground extends StatelessWidget {
  const AnimatedAboutBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ParticlesBackground(count: 30),
        // Blob 1 (top right)
        Positioned(
          right: -150,
          top: -50,
          child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary.withOpacity(0.05),
                ),
              )
              .animate(onPlay: (controller) => controller.repeat())
              .scale(
                begin: const Offset(1, 1),
                end: const Offset(1.2, 1.2),
                duration: 8.seconds,
              )
              .then()
              .scale(
                begin: const Offset(1.2, 1.2),
                end: const Offset(1, 1),
                duration: 8.seconds,
              ),
        ),

        // Blob 2 (bottom left)
        Positioned(
          left: -100,
          bottom: -100,
          child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.accent.withOpacity(0.05),
                ),
              )
              .animate(onPlay: (controller) => controller.repeat())
              .scale(
                begin: const Offset(1, 1),
                end: const Offset(1.3, 1.3),
                duration: 10.seconds,
              )
              .then()
              .scale(
                begin: const Offset(1.3, 1.3),
                end: const Offset(1, 1),
                duration: 10.seconds,
              ),
        ),

        // Grid pattern
        Positioned.fill(
          child: IgnorePointer(
            child: Opacity(
              opacity: 0.03,
              child: CustomPaint(painter: _GridPainter()),
            ),
          ),
        ),
      ],
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = AppColors.primary
          ..strokeWidth = 1;

    const spacing = 20.0;

    // Draw vertical lines
    for (var x = 0.0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // Draw horizontal lines
    for (var y = 0.0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
