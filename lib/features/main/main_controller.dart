import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/app_theme.dart';
import '../../data/services/auth_service.dart';
import '../../core/routes/app_routes.dart';

class MainController extends GetxController {
  final currentIndex = 0.obs;

  final _auth = Get.find<AuthService>();

  String get username => _auth.currentUsername;

  void changeTab(int index) {
    currentIndex.value = index;
  }

  Future<void> logout() async {
    final confirm = await Get.dialog<bool>(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Konfirmasi Logout'),
        content: const Text('Apakah Anda yakin ingin keluar?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () => Get.back(result: true),
            style: ElevatedButton.styleFrom(backgroundColor: AppTheme.secondary),
            child: const Text('Logout', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
    if (confirm == true) {
      await _auth.logout();
      Get.offAllNamed(AppRoutes.login);
    }
  }
}
