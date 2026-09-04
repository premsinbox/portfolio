import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/portfolio_controller.dart';
import '../theme/app_colors.dart';
import '../theme/app_text.dart';
import 'outline_action_button.dart';

class GlassNavBar extends StatelessWidget {
  const GlassNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<PortfolioController>();
    final width = MediaQuery.of(context).size.width;
    final narrow = width < 760;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.navBg,
            border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.12), width: 1)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Glowing scroll-progress line
              Obx(() => Align(
                    alignment: Alignment.centerLeft,
                    child: FractionallySizedBox(
                      widthFactor: c.scrollProgress.value.clamp(0.0, 1.0),
                      child: Container(
                        height: 2.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.white.withOpacity(0.65), blurRadius: 6),
                          ],
                        ),
                      ),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: narrow ? 20 : 40, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'PREM.',
                      style: AppText.display(size: 18, color: Colors.white, weight: FontWeight.w800, letterSpacing: -0.5),
                    ),
                    if (!narrow)
                      Row(
                        children: [
                          _NavItem('About', () => c.scrollToSection('about')),
                          _NavItem('Experience', () => c.scrollToSection('experience')),
                          _NavItem('Work', () => c.scrollToSection('apps')),
                          _NavItem('Skills', () => c.scrollToSection('skills')),
                          const SizedBox(width: 16),
                          OutlineActionButton(label: 'Résumé', small: true, onTap: c.openResume),
                        ],
                      )
                    else
                      OutlineActionButton(label: 'Résumé', small: true, onTap: c.openResume),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _NavItem(this.label, this.onTap);

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            widget.label.toUpperCase(),
            style: AppText.mono(
              size: 11.5,
              color: hovering ? Colors.white : AppColors.textSecondaryDark,
              weight: FontWeight.w700,
              letterSpacing: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
