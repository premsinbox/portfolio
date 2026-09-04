import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text.dart';
import 'tag_chip.dart';

/// Dark elevated card for the bento/masonry grid. On hover: lifts -4px,
/// blooms a soft shadow, and the border sharpens from a subtle line to
/// full white contrast (the dark-surface equivalent of the light-mode
/// "border to black" hover rule).
class BentoCard extends StatefulWidget {
  final String name;
  final String desc;
  final List<String> tags;
  const BentoCard({required this.name, required this.desc, required this.tags, super.key});

  @override
  State<BentoCard> createState() => _BentoCardState();
}

class _BentoCardState extends State<BentoCard> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, hovering ? -4 : 0, 0),
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.darkCardStart, AppColors.darkCardEnd],
          ),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: hovering ? Colors.white : AppColors.borderDark, width: 1),
          boxShadow: hovering
              ? [BoxShadow(color: Colors.black.withOpacity(0.35), blurRadius: 18, offset: const Offset(0, 10))]
              : const [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.name,
              style: AppText.display(size: 19, color: Colors.white, weight: FontWeight.w700, letterSpacing: -0.3),
            ),
            const SizedBox(height: 10),
            Text(
              widget.desc,
              style: AppText.body(size: 13.5, color: const Color(0xFFB4B4B8), height: 1.6),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: widget.tags.map((t) => TagChip(t, onDark: true)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
