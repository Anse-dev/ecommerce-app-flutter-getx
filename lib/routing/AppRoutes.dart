import 'package:get/get.dart';
import 'package:revision/features/auth/data/auth_midd.dart';
import 'package:revision/features/auth/presentation/widgets/login_screen.dart';
import 'package:revision/features/cart/presentation/widgets/cart_screen.dart';
import 'package:revision/features/product/presentation/widgets/product_detail_screen.dart';
import 'package:revision/features/product/presentation/widgets/product_list_screen.dart';

class AppRoutes {
  static const String home = '/home';
  static const String productDetail = '/product-detail';
  static const String cart = '/cart';
  static const String profile = '/profile';
  static const String login = '/login';

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => ProductListScreen(),
    ),
    GetPage(
      name: productDetail,
      page: () => ProductDetailScreen(),
    ),
    GetPage(
      name: cart,
      page: () => CartScreen(),
      middlewares: [AuthMiddleware()], // Middleware pour protéger cette route
    ),
    /*GetPage(
      name: profile,
      page: () => ProfileScreen(),
      middlewares: [AuthMiddleware()], // Middleware pour protéger cette route
    ),*/
    GetPage(
      name: login,
      page: () => LoginScreen(),
    ),
  ];
}
