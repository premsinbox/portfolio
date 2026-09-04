import 'package:flutter/material.dart';
import '../theme/app_text.dart';

/// Outline button — 1.2px solid border, rounded 8px. On hover it inverts to
/// a solid fill with contrast text and a trailing outward arrow, per the
/// design system's Action Button spec.
class OutlineActionButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final Color baseColor; // white on dark surfaces, black on light surfaces
  final bool small;
  const OutlineActionButton({
    required this.label,
    required this.onTap,
    this.baseColor = Colors.white,
    this.small = false,
    super.key,
  });

  @override
  State<OutlineActionButton> createState() => _OutlineActionButtonState();
}

class _OutlineActionButtonState extends State<OutlineActionButton> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    final inverted = widget.baseColor == Colors.white ? Colors.black : Colors.white;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          padding: EdgeInsets.symmetric(horizontal: widget.small ? 16 : 22, vertical: widget.small ? 9 : 13),
          decoration: BoxDecoration(
            color: hovering ? widget.baseColor : Colors.transparent,
            border: Border.all(color: widget.baseColor, width: 1.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label.toUpperCase(),
                style: AppText.mono(
                  size: widget.small ? 11 : 12.5,
                  color: hovering ? inverted : widget.baseColor,
                  weight: FontWeight.w700,
                  letterSpacing: 0.8,
                ),
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                child: hovering
                    ? Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Icon(Icons.north_east, size: widget.small ? 13 : 15, color: inverted),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
