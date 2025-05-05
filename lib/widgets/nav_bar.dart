import 'package:abdullansr/core/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Abdulla Nasar', style: TextStyles.titleLarge(context)),
          Row(
            children: [
              TextButton(
                onPressed: () => context.go('/'),
                child: Text('Home', style: TextStyles.bodyLarge(context)),
              ),
              const SizedBox(width: 16),
              TextButton(
                onPressed: () => context.go('/about'),
                child: Text('About', style: TextStyles.bodyLarge(context)),
              ),
              const SizedBox(width: 16),
              TextButton(
                onPressed: () => context.go('/projects'),
                child: Text('Projects', style: TextStyles.bodyLarge(context)),
              ),
              const SizedBox(width: 16),
              TextButton(
                onPressed: () => context.go('/contact'),
                child: Text('Contact', style: TextStyles.bodyLarge(context)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
