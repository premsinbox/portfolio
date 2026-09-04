import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text.dart';
import '../widgets/reveal.dart';
import '../widgets/section_layout.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrap(
      background: AppColors.tintBg,
      child: Reveal(
        id: 'projects',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(eyebrow: 'Side Projects', title: 'Things I Built To Learn'),
            const ProjectItem(
              name: 'Meta / Instagram Login',
              desc: "Implemented Meta OAuth login to fetch a user's basic Instagram profile details and surface simple insights from that data.",
            ),
            const ProjectItem(
              name: 'Wealth Management App',
              desc: 'Built an automated SMS parser to detect and log transactions, handling Android permissions and pattern matching, with Google Drive integration for automatic backup and sync of the stored data.',
            ),
            const ProjectItem(
              name: 'GPS QR Map Camera App',
              desc: 'Built a camera app that tags each photo with GPS location and a scannable QR code, plotting captured points on a map for quick reference.',
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectItem extends StatelessWidget {
  final String name;
  final String desc;
  const ProjectItem({required this.name, required this.desc, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(border: Border(top: BorderSide(color: AppColors.borderLight))),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: AppText.display(size: 16.5, color: AppColors.textPrimaryLight, weight: FontWeight.w700, letterSpacing: -0.2)),
          const SizedBox(height: 8),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 620),
            child: Text(desc, style: AppText.body(size: 14, color: AppColors.textSecondaryLight)),
          ),
        ],
      ),
    );
  }
}
