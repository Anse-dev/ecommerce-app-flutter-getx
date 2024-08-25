import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revision/features/cart/domain/Cart.dart';
import 'package:revision/features/product/domain/models/Product.dart';

class CartController extends GetxController {
  CartController();

  final cartItems = <CartItem>[].obs;

  // Ajouter un produit au panier
  void addToCart(Product product) {
    final index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      cartItems[index].quantity++;
      cartItems.refresh();
    } else {
      final CartItem cartItem = CartItem(product: product);
      cartItems.add(cartItem);
    }
    Get.snackbar(
      "Produit ajouté",
      "${product.title} a été ajouté au panier.",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.teal,
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
    );
  }

  void removeFromCart(Product product) {
    final index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      } else {
        cartItems.removeAt(index);
      }
      cartItems.refresh();
    }
  }

  void removeProductFromCart(Product product) {
    cartItems.removeWhere((item) => item.product.id == product.id);
  }

  int get cartCount => cartItems.length;

  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + item.totalPrice);

  int get totalCartItems =>
      cartItems.fold(0, (sum, item) => sum + item.quantity);
}
