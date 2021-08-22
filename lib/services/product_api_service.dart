import 'package:categoryproducts/models/product.dart';

abstract class ProductApiService {
  Future<Products> fetchCategoryProducts(int? categoryId);
  Future<Product> fetchProductDetails(int? productId);
}
