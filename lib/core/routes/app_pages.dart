import 'package:get/get.dart';

import '../../features/splash/splash_binding.dart';
import '../../features/splash/splash_page.dart';
import '../../features/auth/login_binding.dart';
import '../../features/auth/login_page.dart';
import '../../features/main/main_binding.dart';
import '../../features/main/main_page.dart';
import '../../features/product/detail/detail_binding.dart';
import '../../features/product/detail/detail_page.dart';
import '../../features/cart/cart_binding.dart';
import '../../features/cart/cart_page.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: AppRoutes.detail,
      page: () => const DetailPage(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: AppRoutes.cart,
      page: () => const CartPage(),
      binding: CartBinding(),
    ),
  ];
}
