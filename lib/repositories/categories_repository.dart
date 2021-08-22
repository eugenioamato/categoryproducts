import 'package:categoryproducts/services/product_api_service.dart';

abstract class CategoriesRepository {
  final ProductApiService productApiService;

  CategoriesRepository(this.productApiService);

  String getCategoryName(int id);
}

class MockCategoriesRepository extends CategoriesRepository {
  MockCategoriesRepository(ProductApiService productApiService) : super(productApiService);

  List<String> names = ['Food', 'Animals', 'Goods'];

  @override
  String getCategoryName(int id) {
    return names[id];
  }
}
