import 'package:abdullansr/core/colors.dart';
import 'package:abdullansr/core/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavBar extends StatelessWidget {
  final String currentPath;

  const NavBar({super.key, required this.currentPath});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 24,
        vertical: isMobile ? 12 : 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Abdulla Nasar',
            style: TextStyles.titleLarge(
              context,
            ).copyWith(fontSize: isMobile ? 18 : null),
          ),
          if (!isMobile)
            Row(children: _buildNavItems(context))
          else
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => _showMobileMenu(context),
            ),
        ],
      ),
    );
  }

  List<Widget> _buildNavItems(BuildContext context) {
    return [
      _buildNavButton(context, 'Home', '/'),
      _buildNavButton(context, 'About', '/about'),
      _buildNavButton(context, 'Projects', '/projects'),
      _buildNavButton(context, 'Contact', '/contact'),
    ];
  }

  Widget _buildNavButton(BuildContext context, String text, String path) {
    final isActive = currentPath == path;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextButton(
        onPressed: () => context.go(path),
        style: TextButton.styleFrom(
          foregroundColor: isActive ? AppColors.primary : null,
        ),
        child: Text(
          text,
          style: TextStyles.bodyLarge(context).copyWith(
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      constraints: BoxConstraints(
        maxWidth:
            MediaQuery.of(context).size.width * 0.9, // 90% of screen width
        minWidth:
            MediaQuery.of(context).size.width * 0.9, // Ensure minimum width
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder:
          (context) => SingleChildScrollView(
            child: Container(
              width:
                  MediaQuery.of(context).size.width *
                  0.9, // Match bottom sheet width
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    _buildNavItems(context)
                        .map(
                          (item) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: item,
                          ),
                        )
                        .toList(),
              ),
            ),
          ),
    );
  }
}
