import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hava_havai/models/product_model.dart';

class CartNotifier extends StateNotifier<List<Products>> {
  CartNotifier() : super([]);

 void addProduct(Products product) {
  // Check if the product is already in the cart
  int index = state.indexWhere((item) => item.id == product.id);

  if (index != -1) {
    // If the product exists, update its quantity
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          state[i].copyWith(quantity: state[i].quantity + 1)
        else
          state[i]
    ];
  } else {
    // If the product doesn't exist, add it with quantity: 1 (not 0!)
    state = [...state, product.copyWith(quantity: 1)];
  }
}


  void increaseQuantity(String id) {
    state = state.map((item) {
      if (item.id == id) {
        return item.copyWith(quantity: item.quantity + 1);
      }
      return item;
    }).toList();
  }

  void decreaseQuantity(String id) {
    state = state.map((item) {
      if (item.id == id && item.quantity > 1) {
        return item.copyWith(quantity: item.quantity - 1);
      }
      return item;
    }).toList();
  }

  void removeProduct(String id) {
    state = state.where((item) => item.id != id).toList();
  }
}

// Cart Provider
final cartProvider = StateNotifierProvider<CartNotifier, List<Products>>((ref) {
  return CartNotifier();
});
