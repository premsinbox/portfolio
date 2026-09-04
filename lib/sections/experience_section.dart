import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text.dart';
import '../widgets/reveal.dart';
import '../widgets/section_layout.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionWrap(
      background: AppColors.tintBg,
      child: Reveal(
        id: 'experience',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(eyebrow: 'Experience', title: "Where I've Worked"),
            JobBlock(
              title: 'Junior Flutter Developer',
              company: 'Real Tech Systems (Real Tech GPS) — Erode, India',
              date: 'NOV 2024 — PRESENT',
              bullets: [
                'Developed and maintained a suite of cross-platform Flutter apps — iTank, GCam, iSafe, iWS, and Enviro — connected to real-time IoT hardware over MQTT.',
                'Implemented UI/UX designs accurately and integrated REST APIs, third-party APIs, and backend services for core functionality.',
                'Used GetX, BLoC, and Provider for state management across modules based on feature complexity.',
                'Owned end-to-end release management: App Store Connect, Google Play Console, TestFlight beta distribution, and manual QA across dev builds.',
                'Debugged and resolved Android-specific stability issues in Android Studio; produced LLD/HLD documentation for shipped features.',
              ],
            ),
            SizedBox(height: 28),
            JobBlock(
              title: 'Junior Flutter Developer & Consultant',
              company: 'ABE Semiconductor Designs — Tiruchengode & Chennai, India',
              date: 'APR 2024 — SEPT 2024',
              bullets: [
                "Moved from a support role into core Flutter development as the team's mobile needs grew.",
                'Designed UI/UX and built key features for a full-featured food ordering app, integrating REST APIs for order and menu data.',
                'Explored applied AI/ML fundamentals in Python (Google Colab) alongside development work.',
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class JobBlock extends StatelessWidget {
  final String title;
  final String company;
  final String date;
  final List<String> bullets;
  const JobBlock({required this.title, required this.company, required this.date, required this.bullets, super.key});

  @override
  Widget build(BuildContext context) {
    final narrow = MediaQuery.of(context).size.width < 720;
    return Container(
      decoration: const BoxDecoration(border: Border(top: BorderSide(color: AppColors.borderLight))),
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          narrow
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppText.display(size: 18, color: AppColors.textPrimaryLight, weight: FontWeight.w700, letterSpacing: -0.3)),
                    const SizedBox(height: 4),
                    Text(company, style: AppText.body(size: 13.5, color: AppColors.textMuted, weight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    Text(date, style: AppText.mono(size: 11, color: AppColors.textMuted, weight: FontWeight.w600, letterSpacing: 0.8)),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title, style: AppText.display(size: 18, color: AppColors.textPrimaryLight, weight: FontWeight.w700, letterSpacing: -0.3)),
                          const SizedBox(height: 4),
                          Text(company, style: AppText.body(size: 13.5, color: AppColors.textMuted, weight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(date, style: AppText.mono(size: 11, color: AppColors.textMuted, weight: FontWeight.w600, letterSpacing: 0.8)),
                  ],
                ),
          const SizedBox(height: 16),
          ...bullets.map((b) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8, right: 12),
                      child: Container(width: 4, height: 4, color: AppColors.textPrimaryLight),
                    ),
                    Expanded(child: Text(b, style: AppText.body(size: 14.5, color: AppColors.textSecondaryLight))),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
