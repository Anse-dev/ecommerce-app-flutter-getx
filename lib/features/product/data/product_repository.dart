import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:revision/features/product/domain/models/Product.dart';
import 'package:revision/features/product/domain/repositories/product_repository.dart';
import 'package:revision/helpers/api_exceptions.dart';

class HttpProductRepositoryImpl implements HttpProductRepository {
  final http.Client client;
  HttpProductRepositoryImpl({required this.client});

  @override
  Future<void> createProduct() async {
    final uri = Uri.parse('https://example.com/products');
    final newProduct = {
      'title': 'New Product',
      'price': 29.99,
      'description': 'A brand new product for sale.',
      'category': 'electronics',
      'image': 'https://example.com/image.jpg',
    };

    const String token = 'your_auth_token_here';

    try {
      final product = await _postData<Map<String, dynamic>>(
        uri: uri,
        data: newProduct,
        builder: (data) => data,
        authToken: token,
      );

      print('Product created: $product');
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  @override
  Future<Product> getProductById({required int productId}) async {
    final uri = Uri.parse('https://fakestoreapi.com/products/$productId');

    return _getData<Product>(
      uri: uri,
      builder: (data) => Product.fromJson(data),
    );
  }

  @override
  Future<List<Product>> getProducts() async {
    final uri = Uri.parse('https://dummyjson.com/products');

    return _getData<List<Product>>(
      uri: uri,
      builder: (data) => (data['products'] as List)
          .map((item) => Product.fromJson(item))
          .toList(),
    );
  }

  Future<T> _getData<T>({
    required Uri uri,
    required T Function(dynamic data) builder,
  }) async {
    try {
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        return builder(json.decode(response.body));
      } else {
        handleApiError(response.statusCode);
      }
    } on SocketException {
      throw NoInternetConnectionException();
    } on FormatException {
      throw UnknownException(message: 'Received invalid data from the server.');
    } catch (e, s) {
      throw UnknownException(message: 'An unknown error occurred: $e');
    }

    throw UnknownException(message: 'Unhandled case reached.');
  }

  Future<T> _postData<T>({
    required Uri uri,
    required Map<String, dynamic> data,
    required T Function(dynamic data) builder,
    String? authToken,
  }) async {
    try {
      final headers = {
        'Content-Type': 'application/json',
        if (authToken != null) 'Authorization': 'Bearer $authToken',
      };
      final response = await client.post(
        uri,
        headers: headers,
        body: json.encode(data),
      );

      if (response.statusCode == 201) {
        return builder(json.decode(response.body));
      } else {
        handleApiError(response.statusCode,
            customMessage: 'Failed to post data to the server.');
      }
    } on SocketException {
      throw NoInternetConnectionException();
    } on FormatException {
      throw UnknownException(message: 'Received invalid data from the server.');
    } catch (e) {
      throw UnknownException(message: 'An unknown error occurred: $e');
    }

    throw UnknownException(message: 'Unhandled case reached.');
  }
}
