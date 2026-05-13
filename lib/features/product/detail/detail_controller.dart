import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/product_model.dart';
import '../../../data/models/cart_item_model.dart';
import '../../../data/repositories/cart_repository.dart';
import '../../../data/services/auth_service.dart';

class DetailController extends GetxController {
  late final ProductModel product;
  final quantity = 1.obs;

  final _cartRepo = Get.find<CartRepository>();
  final _auth = Get.find<AuthService>();

  @override
  void onInit() {
    super.onInit();
    product = Get.arguments as ProductModel;
  }

  void increment() {
    if (quantity.value < product.stock) {
      quantity.value++;
    }
  }

  void decrement() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  void addToCart() {
    final item = CartItemModel(
      username: _auth.currentUsername,
      productId: product.id,
      productTitle: product.title,
      productPrice: product.price,
      productThumbnail: product.thumbnail,
      quantity: quantity.value,
      stock: product.stock,
    );
    _cartRepo.addOrUpdateItem(item);
    Get.snackbar(
      'Berhasil',
      '${product.title} ditambahkan ke keranjang',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFFE8F5E9),
      colorText: const Color(0xFF2E7D32),
      duration: const Duration(seconds: 2),
    );
  }
}
