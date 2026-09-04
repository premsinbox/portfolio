import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/portfolio_controller.dart';
import '../theme/app_colors.dart';
import '../theme/app_text.dart';
import '../widgets/reveal.dart';
import '../widgets/section_layout.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<PortfolioController>();
    final narrow = MediaQuery.of(context).size.width < 640;

    return SectionWrap(
      background: AppColors.deepBg,
      child: Reveal(
        id: 'footer',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (narrow) ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('EDUCATION',
                      style: AppText.mono(
                          size: 11,
                          color: AppColors.textMutedDark,
                          weight: FontWeight.w700,
                          letterSpacing: 1.2)),
                  const SizedBox(height: 16),
                  Text('MBA — 8.42 CGPA · B.Com — 7.94 CGPA',
                      style: AppText.body(
                          size: 14, color: AppColors.textSecondaryDark)),
                  const SizedBox(height: 8),
                  Text('HSLC — 92.3% · SSLC — 88.6%',
                      style: AppText.body(
                          size: 14, color: AppColors.textSecondaryDark)),
                  const SizedBox(height: 16),
                  Text(
                    'CSC Frontend Course · Udemy Flutter UI Bootcamp · Udemy Flutter Masterclass',
                    style: AppText.body(
                        size: 12.5, color: AppColors.textMutedDark),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('GET IN TOUCH',
                      style: AppText.mono(
                          size: 11,
                          color: AppColors.textMutedDark,
                          weight: FontWeight.w700,
                          letterSpacing: 1.2)),
                  const SizedBox(height: 16),
                  FooterLink('premsinbox@outlook.com',
                      onTap: () => c.openLink('mailto:premsinbox@outlook.com')),
                  FooterLink('+91 63824 14638',
                      onTap: () => c.openLink('tel:+916382414638')),
                  FooterLink('github.com/premsinbox',
                      onTap: () => c.openLink('https://github.com/premsinbox')),
                  FooterLink('linkedin.com/in/prem-e-410407279',
                      onTap: () => c.openLink(
                          'https://linkedin.com/in/prem-e-410407279')),
                ],
              ),
            ] else ...[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('EDUCATION',
                            style: AppText.mono(
                                size: 11,
                                color: AppColors.textMutedDark,
                                weight: FontWeight.w700,
                                letterSpacing: 1.2)),
                        const SizedBox(height: 16),
                        Text('MBA — 8.42 CGPA · B.Com — 7.94 CGPA',
                            style: AppText.body(
                                size: 14, color: AppColors.textSecondaryDark)),
                        const SizedBox(height: 8),
                        Text('HSLC — 92.3% · SSLC — 88.6%',
                            style: AppText.body(
                                size: 14, color: AppColors.textSecondaryDark)),
                        const SizedBox(height: 16),
                        Text(
                          'CSC Frontend Course · Udemy Flutter UI Bootcamp · Udemy Flutter Masterclass',
                          style: AppText.body(
                              size: 12.5, color: AppColors.textMutedDark),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 32),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('GET IN TOUCH',
                            style: AppText.mono(
                                size: 11,
                                color: AppColors.textMutedDark,
                                weight: FontWeight.w700,
                                letterSpacing: 1.2)),
                        const SizedBox(height: 16),
                        FooterLink('premsinbox@outlook.com',
                            onTap: () =>
                                c.openLink('mailto:premsinbox@outlook.com')),
                        FooterLink('+91 63824 14638',
                            onTap: () => c.openLink('tel:+916382414638')),
                        FooterLink('github.com/premsinbox',
                            onTap: () =>
                                c.openLink('https://github.com/premsinbox')),
                        FooterLink('linkedin.com/in/prem-e-410407279',
                            onTap: () => c.openLink(
                                'https://linkedin.com/in/prem-e-410407279')),
                      ],
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 72),
            Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Be Good. Do Good.',
                  textAlign: TextAlign.center,
                  style: AppText.display(
                    size: narrow ? 52 : 110,
                    color: const Color.fromARGB(109, 255, 255, 255),
                    weight: FontWeight.w900,
                    letterSpacing: narrow ? -1.5 : -3.0,
                    height: 1.05,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 52),
            Container(height: 1, color: Colors.white.withValues(alpha: 0.12)),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                runSpacing: 8,
                children: [
                  Text('PREM EASWARAN — FLUTTER DEVELOPER',
                      style: AppText.mono(
                          size: 10.5,
                          color: AppColors.textMuted,
                          weight: FontWeight.w600,
                          letterSpacing: 0.8)),
                  Text('TIRUPPUR, TAMIL NADU, INDIA',
                      style: AppText.mono(
                          size: 10.5,
                          color: AppColors.textMuted,
                          weight: FontWeight.w600,
                          letterSpacing: 0.8)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FooterLink extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  const FooterLink(this.text, {required this.onTap, super.key});

  @override
  State<FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<FooterLink> {
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
          padding: const EdgeInsets.only(bottom: 12),
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: hovering ? Colors.white : Colors.transparent))),
            child: Text(widget.text,
                style: AppText.body(
                    size: 15, color: Colors.white, weight: FontWeight.w600)),
          ),
        ),
      ),
    );
  }
}
