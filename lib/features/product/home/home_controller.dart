import 'package:get/get.dart';

import '../../../data/models/product_model.dart';
import '../../../data/services/auth_service.dart';
import '../../../data/services/product_service.dart';

class HomeController extends GetxController {
  final ProductService productService;
  final AuthService authService;

  HomeController({required this.productService, required this.authService});

  final products = <ProductModel>[].obs;
  final isLoading = true.obs;
  final errorMessage = ''.obs;

  String get username => authService.currentUsername;

  @override
  void onReady() {
    super.onReady();
    loadProducts();
  }

  Future<void> loadProducts() async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      final result = await productService.fetchProducts(limit: 30);
      products.assignAll(result);
    } catch (e) {
      errorMessage.value = 'Gagal memuat produk. Periksa koneksi internet.';
    } finally {
      isLoading.value = false;
    }
  }
}
