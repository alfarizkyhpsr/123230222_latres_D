import 'package:get/get.dart';

import '../../data/services/auth_service.dart';
import '../main/main_controller.dart';

class ProfileController extends GetxController {
  final AuthService authService;

  ProfileController({required this.authService});

  String get username => authService.currentUsername;

  void logout() {
    Get.find<MainController>().logout();
  }
}
