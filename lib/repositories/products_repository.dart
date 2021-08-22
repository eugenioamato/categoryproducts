import 'package:categoryproducts/models/product.dart';
import 'package:categoryproducts/services/product_api_service.dart';
import '../services/mock_api_service.dart';

class ProductRepository {
  final ProductApiService productApiService;
  ProductRepository({ProductApiService? productApiService})
      : productApiService = productApiService ?? MockProductApiService();

  Future<Products> getCategoryProducts(int? categoryId) async {
    return productApiService.fetchCategoryProducts(categoryId);
  }

  Future<Product> getProductDetails(int? productId) async {
    return productApiService.fetchProductDetails(productId);
  }
}
