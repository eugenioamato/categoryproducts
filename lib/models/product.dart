class Product {
  final int id;
  final String name;
  final String image;
  final double price;
  final int categoryId;

  Product(this.id, this.name, this.image, this.price, this.categoryId);
}

class Products {
  final List<Product> products;

  Products(this.products);
}
