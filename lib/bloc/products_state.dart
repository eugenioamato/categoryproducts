import 'package:categoryproducts/models/product.dart';
import 'package:equatable/equatable.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object?> get props => [];
}

class ProductsEmpty extends ProductsState {}

class ProductEmpty extends ProductsState {}

class ProductLoading extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Product> products;

  const ProductsLoaded({required this.products});

  ProductsLoaded copyWith({required List<Product> products}) {
    return ProductsLoaded(products: products);
  }

  @override
  List<Object?> get props => [products];
  @override
  String toString() => 'ProductLoaded { products: ${products.length}}';
}

class ProductsError extends ProductsState {}
