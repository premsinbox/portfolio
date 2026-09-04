import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text.dart';
import '../widgets/reveal.dart';
import '../widgets/section_layout.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrap(
      child: Reveal(
        id: 'about',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(eyebrow: 'About', title: 'What I Do'),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 680),
              child: Text(
                "I build Flutter apps for hardware that needs to be watched and controlled remotely — smart "
                "cameras, home automation panels, weighbridge terminals, water tank motors. That means owning "
                "a feature end-to-end: UI, state management, the API and Firebase layer underneath, and "
                "getting the build into the App Store or Play Store. I write clean, reusable code, document "
                "design decisions so a team isn't guessing, and I keep AI coding assistants — Cursor, Claude, "
                "ChatGPT, and local models like Ollama/Qwen — in my daily workflow to move faster without "
                "cutting corners.",
                style: AppText.body(size: 16.5, color: AppColors.textSecondaryLight, height: 1.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
