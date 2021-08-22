import 'package:categoryproducts/models/product.dart';
import 'package:equatable/equatable.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductsEmpty extends ProductState {}

class ProductEmpty extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final Product product;

  const ProductLoaded({required this.product});

  ProductLoaded copyWith({required Product product}) {
    return ProductLoaded(product: product);
  }

  @override
  List<Object?> get props => [product];
  @override
  String toString() => 'ProductLoaded { product: ${product.name}}';
}

class ProductError extends ProductState {}
