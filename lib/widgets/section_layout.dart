import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text.dart';

const double kMaxContentWidth = 1080;

/// Centers section content at a max width with responsive horizontal/
/// vertical padding, on a given background color.
class SectionWrap extends StatelessWidget {
  final Widget child;
  final Color background;
  const SectionWrap({required this.child, this.background = AppColors.lightBg, super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final narrow = width < 640;
    return Container(
      width: double.infinity,
      color: background,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: kMaxContentWidth),
          padding: EdgeInsets.symmetric(horizontal: narrow ? 20 : 40, vertical: narrow ? 56 : 96),
          child: child,
        ),
      ),
    );
  }
}

/// Eyebrow + display title pair used at the top of every section.
class SectionHeading extends StatelessWidget {
  final String eyebrow;
  final String title;
  final bool onDark;
  const SectionHeading({required this.eyebrow, required this.title, this.onDark = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            eyebrow.toUpperCase(),
            style: AppText.mono(
              size: 11.5,
              color: onDark ? AppColors.textMutedDark : AppColors.textMuted,
              weight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: AppText.display(
              size: 32,
              color: onDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              weight: FontWeight.w800,
              letterSpacing: -1.0,
            ),
          ),
        ],
      ),
    );
  }
}
