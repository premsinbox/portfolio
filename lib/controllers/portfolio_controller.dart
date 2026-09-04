import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioController extends GetxController {
  final ScrollController scrollController = ScrollController();

  /// Section ids that have scrolled into view — drives the reveal animation.
  final RxSet<String> revealed = <String>{}.obs;

  /// Index of the currently hovered bento card (-1 = none).
  final RxInt hoveredApp = (-1).obs;

  /// Flips true one frame after first layout — triggers the hero's entrance.
  final RxBool heroLoaded = false.obs;

  /// 0.0 – 1.0 scroll fraction, drives the navbar's glowing progress line.
  final RxDouble scrollProgress = 0.0.obs;

  final Map<String, GlobalKey> sectionKeys = {
    'about': GlobalKey(),
    'experience': GlobalKey(),
    'apps': GlobalKey(),
    'skills': GlobalKey(),
    'projects': GlobalKey(),
    'footer': GlobalKey(),
  };

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      heroLoaded.value = true;
      _checkReveals();
    });
  }

  void _onScroll() {
    _checkReveals();
    if (scrollController.hasClients) {
      final maxExtent = scrollController.position.maxScrollExtent;
      if (maxExtent > 0) {
        scrollProgress.value = (scrollController.offset / maxExtent).clamp(0.0, 1.0);
      }
    }
  }

  void _checkReveals() {
    final screenHeight = Get.height;
    sectionKeys.forEach((id, key) {
      if (revealed.contains(id)) return;
      final ctx = key.currentContext;
      if (ctx == null) return;
      final box = ctx.findRenderObject() as RenderBox?;
      if (box == null || !box.attached) return;
      final position = box.localToGlobal(Offset.zero);
      if (position.dy < screenHeight * 0.88) {
        revealed.add(id);
      }
    });
  }

  Future<void> scrollToSection(String id) async {
    final ctx = sectionKeys[id]?.currentContext;
    if (ctx != null) {
      await Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 550),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  Future<void> openResume() async {
    final uri = Uri.parse('resume.pdf');
    await launchUrl(uri, webOnlyWindowName: '_blank');
  }

  Future<void> openLink(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, webOnlyWindowName: '_blank');
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
