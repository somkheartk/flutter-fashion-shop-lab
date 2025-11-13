class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double originalPrice;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final String category;
  final List<String> colors;
  final List<String> sizes;
  final bool isOnSale;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.originalPrice = 0,
    required this.imageUrl,
    this.rating = 0,
    this.reviewCount = 0,
    required this.category,
    this.colors = const [],
    this.sizes = const [],
    this.isOnSale = false,
  });

  double get discountPercentage {
    if (originalPrice > 0) {
      return ((originalPrice - price) / originalPrice * 100);
    }
    return 0;
  }
}

class CartItem {
  final Product product;
  final int quantity;
  final String selectedSize;
  final String selectedColor;

  CartItem({
    required this.product,
    this.quantity = 1,
    this.selectedSize = '',
    this.selectedColor = '',
  });

  double get totalPrice => product.price * quantity;
}

class Category {
  final String id;
  final String name;
  final String icon;
  final String color;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });
}
