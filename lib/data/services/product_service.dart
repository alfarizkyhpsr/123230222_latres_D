import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductService {
  static const _baseUrl = 'https://dummyjson.com';

  Future<List<ProductModel>> fetchProducts({int limit = 30, int skip = 0}) async {
    final uri = Uri.parse('$_baseUrl/products?limit=$limit&skip=$skip');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List list = data['products'];
      return list.map((e) => ProductModel.fromJson(e)).toList();
    }
    throw Exception('Gagal memuat produk');
  }

  Future<ProductModel> fetchProductById(int id) async {
    final uri = Uri.parse('$_baseUrl/products/$id');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return ProductModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Produk tidak ditemukan');
  }
}
