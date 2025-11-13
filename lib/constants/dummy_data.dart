import '../models/product.dart';

class DummyData {
  static List<Category> categories = [
    Category(id: '1', name: 'Fashions', icon: '👗', color: '4ECE5B'),
    Category(id: '2', name: 'Electronic', icon: '📱', color: 'FFB84D'),
    Category(id: '3', name: 'Sports & Outdoor', icon: '⚽', color: 'FF6B6B'),
    Category(id: '4', name: 'Babies & Toys', icon: '🧸', color: '4ECDC4'),
    Category(id: '5', name: 'Home & Lifestyle', icon: '🏠', color: '45B7D1'),
    Category(id: '6', name: 'Food & Delivery', icon: '🍕', color: '96CEB4'),
  ];

  static List<Product> products = [
    Product(
      id: '1',
      name: 'Women Jacket',
      description: 'Premium quality women jacket perfect for any occasion',
      price: 55.00,
      originalPrice: 75.00,
      imageUrl:
          'https://images.unsplash.com/photo-1591047139829-d91aecb6caea?w=400',
      rating: 4.5,
      reviewCount: 120,
      category: 'Women',
      colors: ['Black', 'Brown', 'Gray'],
      sizes: ['S', 'M', 'L', 'XL'],
      isOnSale: true,
    ),
    Product(
      id: '2',
      name: 'America Dress',
      description: 'Stylish american style dress for modern women',
      price: 45.00,
      imageUrl:
          'https://images.unsplash.com/photo-1595777457583-95e059d581b8?w=400',
      rating: 4.2,
      reviewCount: 85,
      category: 'Women',
      colors: ['Red', 'Blue', 'White'],
      sizes: ['XS', 'S', 'M', 'L'],
    ),
    Product(
      id: '3',
      name: 'Hip Shirt',
      description: 'Comfortable hip style shirt for casual wear',
      price: 35.00,
      imageUrl:
          'https://images.unsplash.com/photo-1603252109360-909baaf261c7?w=400',
      rating: 4.0,
      reviewCount: 64,
      category: 'Women',
      colors: ['Pink', 'White', 'Purple'],
      sizes: ['S', 'M', 'L'],
    ),
    Product(
      id: '4',
      name: 'Cotton Blazer',
      description: 'Professional cotton blazer for office wear',
      price: 65.00,
      imageUrl:
          'https://images.unsplash.com/photo-1594633312681-425c7b97ccd1?w=400',
      rating: 4.7,
      reviewCount: 142,
      category: 'Women',
      colors: ['Navy', 'Black', 'Gray'],
      sizes: ['S', 'M', 'L', 'XL'],
    ),
    Product(
      id: '5',
      name: 'Men Combo Shirt',
      description: 'Versatile combo shirt perfect for any occasion',
      price: 42.00,
      imageUrl:
          'https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?w=400',
      rating: 4.3,
      reviewCount: 96,
      category: 'Men',
      colors: ['White', 'Blue', 'Black'],
      sizes: ['M', 'L', 'XL', 'XXL'],
    ),
    Product(
      id: '6',
      name: 'Blue Hoodie Sweater',
      description: 'Comfortable blue hoodie sweater for cold weather',
      price: 38.00,
      imageUrl:
          'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=400',
      rating: 4.1,
      reviewCount: 73,
      category: 'Men',
      colors: ['Blue', 'Gray', 'Black'],
      sizes: ['S', 'M', 'L', 'XL'],
    ),
    Product(
      id: '7',
      name: 'Prince Trendy Shirt',
      description: 'Trendy prince style shirt for special occasions',
      price: 48.00,
      imageUrl:
          'https://images.unsplash.com/photo-1564859117892-3c8e1b3d7e64?w=400',
      rating: 4.4,
      reviewCount: 108,
      category: 'Men',
      colors: ['Navy', 'Maroon', 'Black'],
      sizes: ['M', 'L', 'XL'],
    ),
    Product(
      id: '8',
      name: 'Oversize T-Shirt/Bluse',
      description: 'Comfortable oversize t-shirt perfect for casual wear',
      price: 28.00,
      imageUrl:
          'https://images.unsplash.com/photo-1571945153237-4929e783af4a?w=400',
      rating: 4.0,
      reviewCount: 55,
      category: 'Unisex',
      colors: ['White', 'Black', 'Gray'],
      sizes: ['S', 'M', 'L', 'XL'],
    ),
    Product(
      id: '9',
      name: 'Baby Top',
      description: 'Adorable and comfortable baby top',
      price: 22.00,
      imageUrl:
          'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?w=400',
      rating: 4.6,
      reviewCount: 89,
      category: 'Kids',
      colors: ['Pink', 'Blue', 'Yellow'],
      sizes: ['6M', '12M', '18M', '2T'],
    ),
    Product(
      id: '10',
      name: 'Women Jacket Supreme',
      description: 'Supreme quality women jacket with premium materials',
      price: 85.00,
      originalPrice: 120.00,
      imageUrl:
          'https://images.unsplash.com/photo-1544966503-7cc5ac882d5f?w=400',
      rating: 4.8,
      reviewCount: 167,
      category: 'Women',
      colors: ['Black', 'Brown', 'Beige'],
      sizes: ['S', 'M', 'L', 'XL'],
      isOnSale: true,
    ),
  ];

  static List<Product> getSaleProducts() {
    return products.where((product) => product.isOnSale).toList();
  }

  static List<Product> getProductsByCategory(String category) {
    return products.where((product) => product.category == category).toList();
  }

  static List<Product> getTopRatedProducts() {
    var topRated = List<Product>.from(products);
    topRated.sort((a, b) => b.rating.compareTo(a.rating));
    return topRated.take(5).toList();
  }
}
