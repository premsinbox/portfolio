import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/portfolio_controller.dart';

/// Wraps a section's content and fades/slides it in once its id has been
/// marked revealed by [PortfolioController] — one calm, consistent effect
/// per section rather than per individual element.
class Reveal extends StatelessWidget {
  final String id;
  final Widget child;
  const Reveal({required this.id, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<PortfolioController>();
    return Obx(() {
      final shown = c.revealed.contains(id);
      return AnimatedOpacity(
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeOut,
        opacity: shown ? 1 : 0,
        child: AnimatedSlide(
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeOut,
          offset: shown ? Offset.zero : const Offset(0, 0.05),
          child: child,
        ),
      );
    });
  }
}
