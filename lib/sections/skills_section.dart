import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text.dart';
import '../widgets/reveal.dart';
import '../widgets/section_layout.dart';
import '../widgets/tag_chip.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrap(
      child: Reveal(
        id: 'skills',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(eyebrow: 'Skills', title: 'What I Work With'),
            const SkillGroup(label: 'Flutter & State Management', items: ['Flutter', 'Dart', 'GetX', 'BLoC', 'Provider']),
            const SkillGroup(label: 'Architecture', items: ['Clean Architecture', 'MVVM', 'MVC']),
            const SkillGroup(label: 'Integration', items: ['REST APIs', 'JSON', 'MQTT', 'BLE', 'Firebase', 'FCM']),
            const SkillGroup(label: 'Delivery & Tooling', items: [
              'Git/GitHub',
              'CI/CD',
              'App Store Connect',
              'Google Play Console',
              'Internal/Closed Testing',
              'TestFlight',
              'Postman',
              'Docker (basic)',
              'Nginx (basic)',
            ]),
            const SkillGroup(label: 'AI-Assisted Development', items: ['Cursor', 'Claude', 'ChatGPT', 'Ollama', 'Qwen']),
            const SkillGroup(label: 'Also Comfortable With', items: ['Node.js', 'Express', 'Figma', 'Canva']),
          ],
        ),
      ),
    );
  }
}

class SkillGroup extends StatelessWidget {
  final String label;
  final List<String> items;
  const SkillGroup({required this.label, required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppText.body(size: 13.5, color: AppColors.textMuted, weight: FontWeight.w700)),
          const SizedBox(height: 12),
          Wrap(spacing: 8, runSpacing: 8, children: items.map((i) => TagChip(i)).toList()),
        ],
      ),
    );
  }
}
