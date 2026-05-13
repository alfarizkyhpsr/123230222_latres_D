import 'package:hive/hive.dart';

part 'cart_item_model.g.dart';

@HiveType(typeId: 0)
class CartItemModel extends HiveObject {
  @HiveField(0)
  late String username;

  @HiveField(1)
  late int productId;

  @HiveField(2)
  late String productTitle;

  @HiveField(3)
  late double productPrice;

  @HiveField(4)
  late String productThumbnail;

  @HiveField(5)
  late int quantity;

  @HiveField(6)
  late int stock;

  CartItemModel({
    required this.username,
    required this.productId,
    required this.productTitle,
    required this.productPrice,
    required this.productThumbnail,
    required this.quantity,
    required this.stock,
  });
}
