// lib/widgets/premium_filter_chip.dart
import 'package:abdullansr/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class PremiumFilterChip extends StatefulWidget {
  final String label;
  final bool selected;
  final Function(bool) onSelected;

  const PremiumFilterChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  @override
  State<PremiumFilterChip> createState() => _PremiumFilterChipState();
}

class _PremiumFilterChipState extends State<PremiumFilterChip> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => widget.onSelected(!widget.selected),
        child: AnimatedContainer(
          duration: 200.ms,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: widget.selected ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: widget.selected ? AppColors.primary : Colors.grey.shade300,
            ),
            boxShadow: [
              if (widget.selected || _isHovered)
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  blurRadius: widget.selected ? 10 : 5,
                  spreadRadius: widget.selected ? 2 : 0,
                ),
            ],
          ),
          child: Text(
            widget.label,
            style: GoogleFonts.poppins(
              color: widget.selected ? Colors.white : Colors.black,
              fontWeight: widget.selected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
