import 'package:get/get.dart';

class AuthController extends GetxController {
  var isAuthenticated = false.obs;

  void login() {
    // Logique de connexion ici
    isAuthenticated.value = true;
  }

  void logout() {
    // Logique de déconnexion ici
    isAuthenticated.value = false;
  }

  bool get isLoggedIn => isAuthenticated.value;
}
