// lib/widgets/particles_background.dart
import 'package:abdullansr/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:math';

class ParticlesBackground extends StatelessWidget {
  final int count;

  const ParticlesBackground({super.key, this.count = 20});

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final size = MediaQuery.of(context).size;

    return IgnorePointer(
      child: Stack(
        children: List.generate(count, (index) {
          final duration = 5 + random.nextInt(10);
          final delay = random.nextInt(5);
          final left = random.nextDouble() * size.width;
          final top = random.nextDouble() * size.height;
          final sizeParticle = 2.0 + random.nextDouble() * 4;

          return Positioned(
            left: left,
            top: top,
            child: Container(
                  width: sizeParticle,
                  height: sizeParticle,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary.withOpacity(0.3),
                  ),
                )
                .animate(
                  delay: delay.seconds,
                  onPlay: (controller) => controller.repeat(),
                )
                .scale(
                  begin: const Offset(0.5, 0.5),
                  end: const Offset(1.5, 1.5),
                  duration: duration.seconds,
                  curve: Curves.easeInOut,
                )
                .then()
                .scale(
                  begin: const Offset(1.5, 1.5),
                  end: const Offset(0.5, 0.5),
                  duration: duration.seconds,
                  curve: Curves.easeInOut,
                ),
          );
        }),
      ),
    );
  }
}
