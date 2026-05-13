import 'package:get/get.dart';

import '../../data/repositories/cart_repository.dart';
import '../../data/services/auth_service.dart';
import '../../data/services/product_service.dart';
import 'main_controller.dart';
import '../product/home/home_controller.dart';
import '../profile/profile_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<ProductService>(() => ProductService());
    Get.lazyPut<CartRepository>(() => CartRepository());
    Get.lazyPut<HomeController>(
      () => HomeController(
        productService: Get.find<ProductService>(),
        authService: Get.find<AuthService>(),
      ),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(authService: Get.find<AuthService>()),
    );
  }
}
