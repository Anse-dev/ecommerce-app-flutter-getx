import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:revision/features/auth/presentation/controllers/auth_controller.dart';
import 'package:revision/routing/AppRoutes.dart';

class LoginScreen extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            authController.login(); // Authentifier l'utilisateur
            Get.offNamed(AppRoutes.home); // Rediriger vers la page d'accueil
          },
          child: const Text('Se connecter'),
        ),
      ),
    );
  }
}
