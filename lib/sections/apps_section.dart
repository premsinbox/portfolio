import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../theme/app_colors.dart';
import '../widgets/bento_card.dart';
import '../widgets/reveal.dart';
import '../widgets/section_layout.dart';

class AppsSection extends StatelessWidget {
  const AppsSection({super.key});

  static const List<Map<String, Object>> apps = [
    {
      'name': 'iTank',
      'desc': 'Water tank and motor control — real-time level monitoring, remote ON/OFF, and alerts.',
      'tags': ['Flutter', 'MQTT'],
    },
    {
      'name': 'GCam',
      'desc': 'Smart camera monitoring — person and vehicle detection, live streaming, remote audio alerts.',
      'tags': ['Flutter', 'MQTT'],
    },
    {
      'name': 'iSafe',
      'desc': 'Home automation and security — remote door, appliance, and alarm control with multi-user access.',
      'tags': ['Flutter', 'Firebase'],
    },
    {
      'name': 'iWS',
      'desc': 'Smart weighbridge monitoring — vehicle identification and automated reporting.',
      'tags': ['Flutter', 'REST API'],
    },
    {
      'name': 'Enviro',
      'desc': 'Temperature monitoring for connected environments, with live readings and alerts.',
      'tags': ['Flutter', 'MQTT'],
    },
    {
      'name': 'iFace',
      'desc': 'Platform-stability work on an Android-native module — debugging and fixes in Android Studio.',
      'tags': ['Android', 'Kotlin/Java'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final cols = width < 640 ? 1 : (width < 1000 ? 2 : 3);

    return SectionWrap(
      background: AppColors.deepBg,
      child: Reveal(
        id: 'apps',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(eyebrow: 'Selected Work', title: 'Apps in production', onDark: true),
            MasonryGridView.count(
              crossAxisCount: cols,
              mainAxisSpacing: 18,
              crossAxisSpacing: 18,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: apps.length,
              itemBuilder: (context, index) {
                final a = apps[index];
                return BentoCard(
                  name: a['name'] as String,
                  desc: a['desc'] as String,
                  tags: (a['tags'] as List).cast<String>(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
