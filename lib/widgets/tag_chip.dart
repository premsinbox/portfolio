import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text.dart';

/// Technical pill: rounded 6px, subtle bg + border by default, inverts to
/// solid black (or white, on dark surfaces) with crisp contrast text on hover.
class TagChip extends StatefulWidget {
  final String label;
  final bool onDark;
  const TagChip(this.label, {this.onDark = false, super.key});

  @override
  State<TagChip> createState() => _TagChipState();
}

class _TagChipState extends State<TagChip> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    final baseBg = widget.onDark ? Colors.white.withOpacity(0.06) : AppColors.chipBgLight;
    final baseBorder = widget.onDark ? Colors.white.withOpacity(0.14) : AppColors.borderLight;
    final baseText = widget.onDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

    final invertBg = widget.onDark ? Colors.white : Colors.black;
    final invertText = widget.onDark ? Colors.black : Colors.white;

    return MouseRegion(
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
        decoration: BoxDecoration(
          color: hovering ? invertBg : baseBg,
          border: Border.all(color: hovering ? invertBg : baseBorder),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          widget.label.toUpperCase(),
          style: AppText.mono(
            size: 10.5,
            color: hovering ? invertText : baseText,
            weight: FontWeight.w700,
            letterSpacing: 0.9,
          ),
        ),
      ),
    );
  }
}
