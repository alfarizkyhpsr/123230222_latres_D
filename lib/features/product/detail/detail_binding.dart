import 'package:get/get.dart';

import '../../../data/repositories/cart_repository.dart';
import 'detail_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartRepository>(() => CartRepository(), fenix: true);
    Get.lazyPut<DetailController>(() => DetailController());
  }
}
