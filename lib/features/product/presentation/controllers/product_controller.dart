import 'package:get/get.dart';
import 'package:revision/features/product/data/product_repository.dart';
import 'package:revision/features/product/domain/models/Product.dart';
import 'package:revision/helpers/api_exceptions.dart';

class ProductController extends GetxController {
  final HttpProductRepositoryImpl repository;
  var products = <Product>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  ProductController(this.repository);

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      products.value = await repository.getProducts();
    } catch (e) {
      if (e is APIException) {
        errorMessage.value = e.message;
      } else {
        errorMessage.value = 'An unexpected error occurred';
      }
    } finally {
      isLoading.value = false;
    }
  }

  Product getProductById(int id) {
    return products.firstWhere((product) => product.id == id);
  }
}
