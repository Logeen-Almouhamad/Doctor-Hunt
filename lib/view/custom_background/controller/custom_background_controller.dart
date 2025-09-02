import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class BackgroundController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController animationController;
  final sidebarOpen = false.obs;
  final screenshotBytes = Rxn<Uint8List>();
  final repaintKey = GlobalKey();
  bool isDisposed = false;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
  }

  Future<void> captureScreenshot() async {
    try {
      RenderRepaintBoundary boundary =
      repaintKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: ui.window.devicePixelRatio);
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData != null) {
        screenshotBytes.value = byteData.buffer.asUint8List();
      }
    }
    catch (e, stackTrace) {
      if (kDebugMode) {
        debugPrint('❌ Error capturing screenshot: $e');
        debugPrint('📌 Stack trace: $stackTrace');
      }
    }
  }

  Future<void> openSidebar() async {
    await captureScreenshot();
    sidebarOpen.value = true;
    if (!isDisposed) {
      animationController.forward();
    }
  }

  void closeSidebar() {
    sidebarOpen.value = false;
    if (!isDisposed) {
      animationController.reverse();
    }
  }

  @override
  void onClose() {
    isDisposed = true;
    animationController.dispose();
    super.onClose();
  }
}
