import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revision/features/cart/presentation/controllers/cart_controller.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();

  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Panier'),
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return const Center(
            child: Text('Votre panier est vide'),
          );
        }
        return ListView.builder(
          itemCount: cartController.cartItems.length,
          itemBuilder: (context, index) {
            final cartItem = cartController.cartItems[index];
            return ListTile(
              leading: Image.network(cartItem.product.images[0]),
              title: Text(cartItem.product.title),
              subtitle:
                  Text('Total: \$${cartItem.totalPrice.toStringAsFixed(2)}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_circle),
                    onPressed: () {
                      cartController.removeFromCart(
                          cartItem.product); // Diminuer la quantité
                    },
                  ),
                  Text('${cartItem.quantity}',
                      style: const TextStyle(fontSize: 18)),
                  IconButton(
                    icon: const Icon(Icons.add_circle),
                    onPressed: () {
                      cartController
                          .addToCart(cartItem.product); // Augmenter la quantité
                    },
                  ),
                ],
              ),
            );
          },
        );
      }),
      bottomNavigationBar: Obx(() {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total: \$${cartController.totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              ElevatedButton(
                onPressed: () {
                  // Logique pour procéder au paiement
                },
                child: const Text('Payer'),
              ),
            ],
          ),
        );
      }),
    );
  }
}
