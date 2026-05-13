import 'package:hive/hive.dart';
import '../models/cart_item_model.dart';

class CartRepository {
  final Box<CartItemModel> _box = Hive.box<CartItemModel>('cart');

  List<CartItemModel> getCartByUsername(String username) {
    return _box.values.where((item) => item.username == username).toList();
  }

  void addOrUpdateItem(CartItemModel newItem) {
    final existing = _box.values.firstWhere(
      (item) => item.username == newItem.username && item.productId == newItem.productId,
      orElse: () => CartItemModel(
        username: '',
        productId: -1,
        productTitle: '',
        productPrice: 0,
        productThumbnail: '',
        quantity: 0,
        stock: 0,
      ),
    );

    if (existing.productId != -1) {
      existing.quantity = newItem.quantity;
      existing.save();
    } else {
      _box.add(newItem);
    }
  }

  void removeItem(CartItemModel item) {
    item.delete();
  }

  void clearCartByUsername(String username) {
    final keys = _box.values
        .where((item) => item.username == username)
        .map((item) => item.key)
        .toList();
    _box.deleteAll(keys);
  }
}
