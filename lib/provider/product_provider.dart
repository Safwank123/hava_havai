import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hava_havai/models/services/product_service.dart';
import '../models/product_model.dart';

final productProvider = FutureProvider<List<Products>>((ref) async {
  return ProductService().fetchProducts();
});
