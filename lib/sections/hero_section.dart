import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/portfolio_controller.dart';
import '../theme/app_colors.dart';
import '../theme/app_text.dart';
import '../widgets/outline_action_button.dart';
import '../widgets/section_layout.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<PortfolioController>();
    final width = MediaQuery.of(context).size.width;
    final narrow = width < 900;

    final photo = Obx(() {
      final double photoSize = narrow ? 240 : (width < 1120 ? 340 : 390);
      return AnimatedScale(
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeOutBack,
        scale: c.heroLoaded.value ? 1 : 0.85,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 700),
          opacity: c.heroLoaded.value ? 1 : 0,
          child: SizedBox.square(
            dimension: photoSize,
            child: const AspectRatio(
              aspectRatio: 1,
              child: ClipOval(
                child: Image(image: AssetImage('assets/images/profile.jpg'), fit: BoxFit.cover),
              ),
            ),
          ),
        ),
      );
    });

    final textBlock = Obx(() {
      final loaded = c.heroLoaded.value;
      return AnimatedOpacity(
        duration: const Duration(milliseconds: 700),
        opacity: loaded ? 1 : 0,
        child: AnimatedSlide(
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeOut,
          offset: loaded ? Offset.zero : const Offset(0, 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'FLUTTER MOBILE APP DEVELOPER',
                style: AppText.mono(size: 11.5, color: AppColors.textMutedDark, weight: FontWeight.w700, letterSpacing: 1.4),
              ),
              const SizedBox(height: 18),
              Text(
                'Prem\nEaswaran',
                style: AppText.display(
                  size: narrow ? 44 : 68,
                  color: Colors.white,
                  weight: FontWeight.w900,
                  height: 1.02,
                  letterSpacing: -1.5,
                ),
              ),
              const SizedBox(height: 20),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 460),
                child: Text(
                  'Building cross-platform Flutter systems for connected hardware — cameras, sensors, and control interfaces engineered for real-world reliability.',
                  style: AppText.body(size: 16, color: AppColors.textSecondaryDark, height: 1.65),
                ),
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 18,
                runSpacing: 10,
                children: [
                  _HeroLink('premsinbox@outlook.com', () => c.openLink('mailto:premsinbox@outlook.com')),
                  _HeroLink('+91 63824 14638', () => c.openLink('tel:+916382414638')),
                  _HeroLink('GitHub', () => c.openLink('https://github.com/premsinbox')),
                  _HeroLink('LinkedIn', () => c.openLink('https://linkedin.com/in/prem-e-410407279')),
                ],
              ),
              const SizedBox(height: 28),
              OutlineActionButton(label: 'Download Résumé', baseColor: Colors.white, onTap: c.openResume),
              const SizedBox(height: 40),
              Container(height: 1, color: Colors.white.withValues(alpha: 0.12)),
              const SizedBox(height: 26),
              Obx(() {
                final show = c.heroLoaded.value;
                return Wrap(
                  spacing: 36,
                  runSpacing: 16,
                  children: [
                    _Stat(target: 6, label: 'Apps Developed', animate: show),
                    _Stat(target: 3, label: 'Apps Supported', animate: show),
                    _Stat(target: 2, label: 'Internal Tools', animate: show),
                  ],
                );
              }),
            ],
          ),
        ),
      );
    });

    return Container(
      width: double.infinity,
      color: AppColors.deepBg,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: kMaxContentWidth),
          padding: EdgeInsets.symmetric(horizontal: narrow ? 20 : 40, vertical: narrow ? 96 : 140),
          child: narrow
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Center(child: photo), const SizedBox(height: 36), textBlock],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: textBlock),
                    const SizedBox(width: 48),
                    photo,
                  ],
                ),
        ),
      ),
    );
  }
}

class _HeroLink extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  const _HeroLink(this.text, this.onTap);

  @override
  State<_HeroLink> createState() => _HeroLinkState();
}

class _HeroLinkState extends State<_HeroLink> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.only(bottom: 2),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: hovering ? Colors.white : Colors.white.withValues(alpha: 0.25))),
          ),
          child: Text(
            widget.text,
            style: AppText.mono(size: 12.5, color: hovering ? Colors.white : AppColors.textSecondaryDark, weight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final int target;
  final String label;
  final bool animate;
  const _Stat({required this.target, required this.label, required this.animate});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TweenAnimationBuilder<int>(
          tween: IntTween(begin: 0, end: animate ? target : 0),
          duration: const Duration(milliseconds: 900),
          curve: Curves.easeOut,
          builder: (context, value, _) => Text(
            '$value',
            style: AppText.display(size: 26, color: Colors.white, weight: FontWeight.w800, letterSpacing: -0.5),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label.toUpperCase(),
          style: AppText.mono(size: 10, color: AppColors.textMutedDark, weight: FontWeight.w700, letterSpacing: 1.0),
        ),
      ],
    );
  }
}
