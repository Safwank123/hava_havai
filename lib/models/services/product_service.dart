import 'dart:convert';
import 'package:hava_havai/models/product_model.dart';
import 'package:http/http.dart' as http;


class ProductService {
  Future<List<Products>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> productsJson = data['products'];

      return productsJson.map((json) => Products.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
