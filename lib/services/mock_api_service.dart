import 'package:categoryproducts/models/product.dart';
import 'package:categoryproducts/services/product_api_service.dart';

class MockProductApiService extends ProductApiService {
  final items = [
    Product(
      0,
      'sole',
      r'https://keckenlisa.nl/wp-content/uploads/2019/06/6kfsyyjrpv4iuhd7j5n4dfzozm274wog.jpg',
      0.99,
      0,
    ),
    Product(
      1,
      'riso',
      r'https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/DE38BC2F-473D-4AC2-9DFC-AF9E51A04568/Derivates/8C97D37C-410B-439F-B412-AC2D81AD7D1F.jpg',
      0.39,
      0,
    ),
    Product(
        2,
        'maia',
        r'https://i.guim.co.uk/img/media/26392d05302e02f7bf4eb143bb84c8097d09144b/446_167_3683_2210/master/3683.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=49ed3252c0b2ffb49cf8b508892e452d',
        0.22,
        1),
    Product(
      3,
      'sun',
      r'https://keckenlisa.nl/wp-content/uploads/2019/06/6kfsyyjrpv4iuhd7j5n4dfzozm274wog.jpg',
      0.99,
      0,
    ),
    Product(
      4,
      'rais',
      r'https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/DE38BC2F-473D-4AC2-9DFC-AF9E51A04568/Derivates/8C97D37C-410B-439F-B412-AC2D81AD7D1F.jpg',
      0.39,
      0,
    ),
    Product(
      5,
      'cat',
      r'https://i.guim.co.uk/img/media/26392d05302e02f7bf4eb143bb84c8097d09144b/446_167_3683_2210/master/3683.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=49ed3252c0b2ffb49cf8b508892e452d',
      0.22,
      1,
    ),
    Product(
      6,
      'sunn',
      r'https://keckenlisa.nl/wp-content/uploads/2019/06/6kfsyyjrpv4iuhd7j5n4dfzozm274wog.jpg',
      0.99,
      0,
    ),
    Product(
        7,
        'raiss',
        r'https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/DE38BC2F-473D-4AC2-9DFC-AF9E51A04568/Derivates/8C97D37C-410B-439F-B412-AC2D81AD7D1F.jpg',
        0.39,
        0),
    Product(
      8,
      'catt',
      r'https://i.guim.co.uk/img/media/26392d05302e02f7bf4eb143bb84c8097d09144b/446_167_3683_2210/master/3683.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=49ed3252c0b2ffb49cf8b508892e452d',
      0.22,
      1,
    ),
  ];

  Future<Products> fetchCategoryProducts(int? categoryId) async {
    return Products(items.where((element) => element.categoryId == categoryId).toList());
  }

  Future<Product> fetchProductDetails(int? productId) async {
    return items.firstWhere((element) => element.id == productId);
  }
}
