import 'package:revision/features/product/domain/models/Dimension.dart';
import 'package:revision/features/product/domain/models/Meta.dart';
import 'package:revision/features/product/domain/models/Review.dart';

class Product {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final double weight;
  final Dimensions dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<Review> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final Meta meta;
  final List<String> images;
  final String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      category: map['category'],
      price: map['price'].toDouble(),
      discountPercentage: map['discountPercentage'].toDouble(),
      rating: map['rating'].toDouble(),
      stock: map['stock'],
      tags: List<String>.from(map['tags']),
      brand: "",
      sku: map['sku'],
      weight: map['weight'].toDouble(),
      dimensions: Dimensions.fromMap(map['dimensions']),
      warrantyInformation: map['warrantyInformation'],
      shippingInformation: map['shippingInformation'],
      availabilityStatus: map['availabilityStatus'],
      reviews: List<Review>.from(map['reviews'].map((x) => Review.fromMap(x))),
      returnPolicy: map['returnPolicy'],
      minimumOrderQuantity: map['minimumOrderQuantity'],
      meta: Meta.fromMap(map['meta']),
      images: List<String>.from(map['images']),
      thumbnail: map['thumbnail'],
    );
  }

  factory Product.fromJson(json) {
    return Product.fromMap(json);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'tags': tags,
      'brand': brand,
      'sku': sku,
      'weight': weight,
      'dimensions': dimensions.toMap(),
      'warrantyInformation': warrantyInformation,
      'shippingInformation': shippingInformation,
      'availabilityStatus': availabilityStatus,
      'reviews': reviews.map((x) => x.toMap()).toList(),
      'returnPolicy': returnPolicy,
      'minimumOrderQuantity': minimumOrderQuantity,
      'meta': meta.toMap(),
      'images': images,
      'thumbnail': thumbnail,
    };
  }
}
