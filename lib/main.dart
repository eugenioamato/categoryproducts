import 'package:flutter/material.dart';
import 'package:categoryproducts/repositories/products_repository.dart';
import 'app.dart';

void main() {
  ProductRepository productRepository = ProductRepository();
  runApp(MyApp(productRepository: productRepository));
}
