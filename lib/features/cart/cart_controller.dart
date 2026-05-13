import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/cart_item_model.dart';
import '../../data/repositories/cart_repository.dart';
import '../../data/services/auth_service.dart';

class CartController extends GetxController {
  final _cartRepo = Get.find<CartRepository>();
  final _auth = Get.find<AuthService>();

  final cartItems = <CartItemModel>[].obs;

  String get username => _auth.currentUsername;

  @override
  void onReady() {
    super.onReady();
    loadCart();
  }

  void loadCart() {
    cartItems.assignAll(_cartRepo.getCartByUsername(username));
  }

  void removeItem(CartItemModel item) {
    _cartRepo.removeItem(item);
    cartItems.remove(item);
    Get.snackbar(
      'Dihapus',
      '${item.productTitle} dihapus dari keranjang',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFFFFEBEE),
      colorText: const Color(0xFFC62828),
      duration: const Duration(seconds: 2),
    );
  }

  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + item.productPrice * item.quantity);
}
