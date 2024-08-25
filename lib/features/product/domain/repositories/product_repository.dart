import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:revision/features/product/domain/models/Product.dart';
import 'package:revision/helpers/api_exceptions.dart';

abstract class HttpProductRepository {
  HttpProductRepository();

  Future<void> createProduct();

  Future<Product> getProductById({required int productId});

  Future<List<Product>> getProducts();
}
