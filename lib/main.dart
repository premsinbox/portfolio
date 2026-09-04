import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/portfolio_controller.dart';
import 'theme/app_colors.dart';
import 'widgets/glass_navbar.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/experience_section.dart';
import 'sections/apps_section.dart';
import 'sections/skills_section.dart';
import 'sections/projects_section.dart';
import 'sections/footer_section.dart';

void main() {
  Get.put(PortfolioController());
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Prem Easwaran — Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.lightBg,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends GetView<PortfolioController> {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: controller.scrollController,
            child: Column(
              children: [
                const HeroSection(),
                AboutSection(key: controller.sectionKeys['about']),
                ExperienceSection(key: controller.sectionKeys['experience']),
                AppsSection(key: controller.sectionKeys['apps']),
                SkillsSection(key: controller.sectionKeys['skills']),
                ProjectsSection(key: controller.sectionKeys['projects']),
                FooterSection(key: controller.sectionKeys['footer']),
              ],
            ),
          ),
          const Positioned(top: 0, left: 0, right: 0, child: GlassNavBar()),
        ],
      ),
    );
  }
}
