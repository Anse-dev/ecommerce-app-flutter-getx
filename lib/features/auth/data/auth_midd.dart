import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revision/features/auth/presentation/controllers/auth_controller.dart';
import 'package:revision/features/cart/presentation/controllers/cart_controller.dart';
import 'package:revision/routing/AppRoutes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final AuthController authController = Get.put(AuthController());

    // Vérifiez si l'utilisateur est connecté
    if (!authController.isLoggedIn) {
      return const RouteSettings(name: AppRoutes.login);
    }
    return null; // Aucune redirection, continuer vers la route demandée
  }
}
