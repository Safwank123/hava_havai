import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hava_havai/models/product_model.dart';
import 'package:hava_havai/provider/cart_provider.dart';

class ProductCard extends ConsumerWidget {
  final Products product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 350,
      width: 190,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Container(
            height: 230,
            width: 200,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 233, 224, 224),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.network(
                    product.thumbnail ?? '',
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.image_not_supported, size: 50),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, left: 60),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.white,
                      elevation: 5,
                    ),
                    onPressed: () {
                       ref.read(cartProvider.notifier).addProduct(product);
  print(ref.read(cartProvider));  // Debugging: Check the cart items in console
                    },
                    child: const Text(
                      'Add',
                      style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title ?? '',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(product.brand ?? '', style: const TextStyle(color: Colors.black)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      '₹${product.price?.toStringAsFixed(2) ?? '0.00'}',
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '₹${(product.price! * (1 - (product.discountPercentage ?? 0) / 100)).toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                  ],
                ),
                Text(
  '${product.discountPercentage?.toStringAsFixed(2) ?? '0'}%',
  style: const TextStyle(
    color: Colors.pink,
    fontWeight: FontWeight.bold,
  ),
),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
