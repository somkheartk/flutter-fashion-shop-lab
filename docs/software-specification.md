# 📋 Software Specification - Fashion Shop App

## 📖 Table of Contents
- [1. Introduction](#1-introduction)
- [2. System Overview](#2-system-overview)
- [3. Functional Requirements](#3-functional-requirements)
- [4. Non-Functional Requirements](#4-non-functional-requirements)
- [5. Technical Architecture](#5-technical-architecture)
- [6. User Interface Specifications](#6-user-interface-specifications)
- [7. Data Models](#7-data-models)
- [8. API Specifications](#8-api-specifications)
- [9. Security Requirements](#9-security-requirements)
- [10. Performance Requirements](#10-performance-requirements)
- [11. Testing Requirements](#11-testing-requirements)
- [12. Deployment Specifications](#12-deployment-specifications)

---

## 1. Introduction

### 1.1 Purpose
เอกสารนี้กำหนดข้อกำหนดทางซอฟต์แวร์สำหรับแอป Fashion Shop ซึ่งเป็นแอปพลิเคชันสำหรับซื้อขายเสื้อผ้าและแฟชั่นที่พัฒนาด้วย Flutter

### 1.2 Scope
แอปพลิเคชันครอบคลุมการซื้อขายออนไลน์สำหรับสินค้าแฟชั่น รวมถึงการจัดการสินค้า ระบบตะกร้าสินค้า และส่วนติดต่อผู้ใช้ที่ทันสมัย

### 1.3 Target Audience
- **End Users**: ผู้ใช้ทั่วไปที่ต้องการซื้อสินค้าแฟชั่น
- **Developers**: นักพัฒนาที่จะดูแลรักษาและพัฒนาต่อ
- **Stakeholders**: ผู้มีส่วนได้ส่วนเสียในโครงการ

---

## 2. System Overview

### 2.1 System Architecture
```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Mobile App    │◄──►│   Backend API   │◄──►│    Database     │
│   (Flutter)     │    │   (REST/HTTP)   │    │   (Firebase)    │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

### 2.2 Technology Stack

#### Frontend
- **Framework**: Flutter 3.19+
- **Language**: Dart 3.3+
- **UI Library**: Material Design 3
- **State Management**: StatefulWidget + setState
- **Navigation**: Flutter Navigator 2.0

#### Backend (Future Implementation)
- **Runtime**: Node.js / Firebase Functions
- **Database**: Firebase Firestore
- **Authentication**: Firebase Auth
- **Storage**: Firebase Storage
- **Analytics**: Firebase Analytics

#### Development Tools
- **IDE**: VS Code / Android Studio
- **Version Control**: Git
- **CI/CD**: GitHub Actions
- **Testing**: Flutter Test Framework

---

## 3. Functional Requirements

### 3.1 User Authentication (Future)
| Requirement ID | Description | Priority |
|---------------|-------------|----------|
| AUTH-001 | ผู้ใช้สามารถสมัครสมาชิกด้วยอีเมล | High |
| AUTH-002 | ผู้ใช้สามารถเข้าสู่ระบบ/ออกจากระบบ | High |
| AUTH-003 | ผู้ใช้สามารถรีเซ็ตรหัสผ่าน | Medium |
| AUTH-004 | รองรับการเข้าสู่ระบบด้วย Social Login | Low |

### 3.2 Product Management
| Requirement ID | Description | Priority |
|---------------|-------------|----------|
| PROD-001 | แสดงรายการสินค้าในหมวดหมู่ต่างๆ | High |
| PROD-002 | แสดงรายละเอียดสินค้า | High |
| PROD-003 | ค้นหาสินค้าด้วยคำค้น | High |
| PROD-004 | กรองสินค้าตามราคา แบรนด์ | Medium |
| PROD-005 | จัดเรียงสินค้าตามความนิยม ราคา | Medium |

### 3.3 Shopping Cart
| Requirement ID | Description | Priority |
|---------------|-------------|----------|
| CART-001 | เพิ่มสินค้าลงตะกร้า | High |
| CART-002 | แก้ไขจำนวนสินค้าในตะกร้า | High |
| CART-003 | ลบสินค้าจากตะกร้า | High |
| CART-004 | คำนวณราคารวมอัตโนมัติ | High |
| CART-005 | บันทึกตะกร้าสินค้าใน Local Storage | Medium |

### 3.4 User Interface
| Requirement ID | Description | Priority |
|---------------|-------------|----------|
| UI-001 | หน้าหลักแสดงสินค้าแนะนำ | High |
| UI-002 | Navigation Bar ด้านล่าง | High |
| UI-003 | Search Bar ในหน้าหลัก | High |
| UI-004 | Category Navigation | High |
| UI-005 | Product Card Design | High |

### 3.5 Notifications
| Requirement ID | Description | Priority |
|---------------|-------------|----------|
| NOTIF-001 | แจ้งเตือนเมื่อเพิ่มสินค้าลงตะกร้า | Medium |
| NOTIF-002 | แจ้งเตือนโปรโมชั่นใหม่ | Low |
| NOTIF-003 | แจ้งเตือนสถานะคำสั่งซื้อ | Low |

---

## 4. Non-Functional Requirements

### 4.1 Performance Requirements
| Metric | Requirement | Measurement |
|--------|-------------|-------------|
| App Launch Time | < 3 seconds | Time to first meaningful paint |
| Screen Transition | < 300ms | Animation duration |
| Image Loading | < 1 second | Network + render time |
| Search Response | < 500ms | User input to results |
| Memory Usage | < 150MB | Peak memory consumption |
| Battery Usage | Optimized | Background processing minimal |

### 4.2 Scalability Requirements
- **Concurrent Users**: Support up to 10,000 concurrent users
- **Data Storage**: Handle up to 100,000 products
- **Response Time**: Maintain performance under load
- **Auto-scaling**: Horizontal scaling capability

### 4.3 Reliability Requirements
- **Uptime**: 99.9% availability
- **Error Rate**: < 0.1% of all transactions
- **Recovery Time**: < 5 minutes for critical failures
- **Backup**: Daily automated backups

### 4.4 Usability Requirements
- **Learning Curve**: New users can complete purchase within 5 minutes
- **Accessibility**: Support for screen readers and high contrast
- **Internationalization**: Thai and English language support
- **Device Support**: iOS 11+, Android 5.0+

---

## 5. Technical Architecture

### 5.1 Application Architecture

```
┌───────────────────────────────────────────┐
│                Presentation Layer          │
├───────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────────────┐ │
│  │   Screens   │  │      Widgets        │ │
│  │             │  │                     │ │
│  │ • Home      │  │ • ProductCard       │ │
│  │ • Category  │  │ • BannerCard        │ │
│  │ • Cart      │  │ • SearchBar         │ │
│  │ • Profile   │  │ • CustomButton      │ │
│  └─────────────┘  └─────────────────────┘ │
├───────────────────────────────────────────┤
│                Business Logic Layer        │
├───────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────────────┐ │
│  │   Models    │  │     Services        │ │
│  │             │  │                     │ │
│  │ • Product   │  │ • CartService       │ │
│  │ • User      │  │ • AuthService       │ │
│  │ • CartItem  │  │ • ProductService    │ │
│  │ • Order     │  │ • NotificationSvc   │ │
│  └─────────────┘  └─────────────────────┘ │
├───────────────────────────────────────────┤
│                Data Access Layer           │
├───────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────────────┐ │
│  │ Local Data  │  │    Remote Data      │ │
│  │             │  │                     │ │
│  │ • SharedPref│  │ • HTTP Client       │ │
│  │ • SQLite    │  │ • Firebase SDK      │ │
│  │ • Cache     │  │ • REST APIs         │ │
│  └─────────────┘  └─────────────────────┘ │
└───────────────────────────────────────────┘
```

### 5.2 Design Patterns
- **MVC Pattern**: Model-View-Controller separation
- **Repository Pattern**: Data access abstraction
- **Observer Pattern**: State change notifications
- **Factory Pattern**: Object creation management
- **Singleton Pattern**: Single instance services

### 5.3 State Management Strategy
```dart
// Current Implementation
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Local state management
  String selectedCategory = 'ทั้งหมด';
  List<Product> products = [];
  
  void updateCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }
}

// Future Implementation (Provider/Riverpod)
class CartProvider extends ChangeNotifier {
  List<CartItem> _items = [];
  
  void addItem(Product product) {
    // Add logic
    notifyListeners();
  }
}
```

---

## 6. User Interface Specifications

### 6.1 Design System

#### Color Palette
```dart
class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF2196F3);      // Blue #2196F3
  static const Color primaryDark = Color(0xFF1976D2);  // Dark Blue
  static const Color primaryLight = Color(0xFFBBDEFB); // Light Blue
  
  // Secondary Colors
  static const Color secondary = Color(0xFF03DAC6);    // Teal
  static const Color secondaryDark = Color(0xFF018786);
  static const Color secondaryLight = Color(0xFFB2DFDB);
  
  // Status Colors
  static const Color success = Color(0xFF4CAF50);      // Green
  static const Color error = Color(0xFFF44336);        // Red
  static const Color warning = Color(0xFFFF9800);      // Orange
  static const Color info = Color(0xFF2196F3);         // Blue
  
  // Neutral Colors
  static const Color background = Color(0xFFF5F5F5);   // Light Gray
  static const Color surface = Color(0xFFFFFFFF);      // White
  static const Color onSurface = Color(0xFF212121);    // Dark Gray
  static const Color textPrimary = Color(0xFF212121);  // Dark Gray
  static const Color textSecondary = Color(0xFF757575);// Medium Gray
  static const Color textLight = Color(0xFFBDBDBD);    // Light Gray
  static const Color divider = Color(0xFFE0E0E0);      // Very Light Gray
}
```

#### Typography Scale
```dart
class AppTextStyles {
  // Headlines
  static final headline1 = GoogleFonts.kanit(
    fontSize: 32, fontWeight: FontWeight.bold
  );
  static final headline2 = GoogleFonts.kanit(
    fontSize: 24, fontWeight: FontWeight.bold
  );
  static final headline3 = GoogleFonts.kanit(
    fontSize: 20, fontWeight: FontWeight.w600
  );
  
  // Body Text
  static final bodyLarge = GoogleFonts.kanit(
    fontSize: 16, fontWeight: FontWeight.normal
  );
  static final bodyMedium = GoogleFonts.kanit(
    fontSize: 14, fontWeight: FontWeight.normal
  );
  static final bodySmall = GoogleFonts.kanit(
    fontSize: 12, fontWeight: FontWeight.normal
  );
  
  // Labels
  static final labelLarge = GoogleFonts.kanit(
    fontSize: 14, fontWeight: FontWeight.w600
  );
  static final labelMedium = GoogleFonts.kanit(
    fontSize: 12, fontWeight: FontWeight.w600
  );
  static final labelSmall = GoogleFonts.kanit(
    fontSize: 10, fontWeight: FontWeight.w600
  );
}
```

#### Spacing System
```dart
class AppSpacing {
  static const double xs = 4.0;      // Extra Small
  static const double sm = 8.0;      // Small
  static const double md = 16.0;     // Medium
  static const double lg = 24.0;     // Large
  static const double xl = 32.0;     // Extra Large
  static const double xxl = 48.0;    // Double Extra Large
}
```

### 6.2 Component Specifications

#### Product Card
```dart
class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;
  final VoidCallback? onAddToCart;
  final VoidCallback? onToggleWishlist;
  
  // Specifications:
  // - Size: 180x300 pixels
  // - Border Radius: 12px
  // - Shadow: Elevation 2
  // - Image Aspect Ratio: 1:1
  // - Padding: 12px
  // - Actions: View, Add to Cart, Wishlist
}
```

#### Banner Card  
```dart
class BannerCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final List<Color> gradientColors;
  final VoidCallback? onTap;
  
  // Specifications:
  // - Height: 180px
  // - Border Radius: 24px
  // - Animation: Scale and Opacity
  // - Background: Gradient with patterns
  // - Duration: 1200ms animation
}
```

### 6.3 Screen Layout Specifications

#### Home Screen Layout
```
┌─────────────────────────────────────┐
│            App Header               │ 56dp
├─────────────────────────────────────┤
│           Search Bar                │ 56dp
├─────────────────────────────────────┤
│         Quick Actions               │ 120dp
├─────────────────────────────────────┤
│          Categories                 │ 100dp
├─────────────────────────────────────┤
│        Banner Slider                │ 180dp
├─────────────────────────────────────┤
│        Flash Sale                   │ 240dp
├─────────────────────────────────────┤
│     Top Performing                  │ 340dp
├─────────────────────────────────────┤
│      Popular Brands                 │ 200dp
├─────────────────────────────────────┤
│      Product Sections               │ Variable
├─────────────────────────────────────┤
│     Promotion Slides                │ 100dp
└─────────────────────────────────────┘
```

#### Product Grid Specifications
- **Columns**: 4 items per row (Phone), 6 items (Tablet)
- **Aspect Ratio**: 0.65 (width:height)
- **Spacing**: 8dp between items
- **Padding**: 16dp horizontal margins

---

## 7. Data Models

### 7.1 Product Model
```dart
class Product {
  final int id;
  final String name;
  final double price;
  final double? originalPrice;
  final String brand;
  final String category;
  final String image;
  final double rating;
  final int reviews;
  final int? discount;
  final bool isBestSeller;
  final bool isNew;
  final bool? isLiked;
  final String? description;
  final List<String>? tags;
  final Map<String, dynamic>? attributes;
  
  Product({
    required this.id,
    required this.name,
    required this.price,
    this.originalPrice,
    required this.brand,
    required this.category,
    required this.image,
    required this.rating,
    required this.reviews,
    this.discount,
    this.isBestSeller = false,
    this.isNew = false,
    this.isLiked,
    this.description,
    this.tags,
    this.attributes,
  });
  
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      originalPrice: json['originalPrice']?.toDouble(),
      brand: json['brand'],
      category: json['category'],
      image: json['image'],
      rating: json['rating'].toDouble(),
      reviews: json['reviews'],
      discount: json['discount'],
      isBestSeller: json['isBestSeller'] ?? false,
      isNew: json['isNew'] ?? false,
      isLiked: json['isLiked'],
      description: json['description'],
      tags: json['tags']?.cast<String>(),
      attributes: json['attributes'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'originalPrice': originalPrice,
      'brand': brand,
      'category': category,
      'image': image,
      'rating': rating,
      'reviews': reviews,
      'discount': discount,
      'isBestSeller': isBestSeller,
      'isNew': isNew,
      'isLiked': isLiked,
      'description': description,
      'tags': tags,
      'attributes': attributes,
    };
  }
}
```

### 7.2 Cart Item Model
```dart
class CartItem {
  final Product product;
  int quantity;
  final String? selectedSize;
  final String? selectedColor;
  final DateTime addedAt;
  
  CartItem({
    required this.product,
    this.quantity = 1,
    this.selectedSize,
    this.selectedColor,
    DateTime? addedAt,
  }) : addedAt = addedAt ?? DateTime.now();
  
  double get totalPrice => product.price * quantity;
  
  CartItem copyWith({
    Product? product,
    int? quantity,
    String? selectedSize,
    String? selectedColor,
  }) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      selectedSize: selectedSize ?? this.selectedSize,
      selectedColor: selectedColor ?? this.selectedColor,
      addedAt: addedAt,
    );
  }
}
```

### 7.3 User Model (Future)
```dart
class User {
  final String id;
  final String email;
  final String? displayName;
  final String? photoURL;
  final String? phoneNumber;
  final Address? defaultAddress;
  final List<Address> addresses;
  final List<PaymentMethod> paymentMethods;
  final DateTime createdAt;
  final DateTime? lastLoginAt;
  
  User({
    required this.id,
    required this.email,
    this.displayName,
    this.photoURL,
    this.phoneNumber,
    this.defaultAddress,
    this.addresses = const [],
    this.paymentMethods = const [],
    required this.createdAt,
    this.lastLoginAt,
  });
}
```

### 7.4 Order Model (Future)
```dart
class Order {
  final String id;
  final String userId;
  final List<CartItem> items;
  final double subtotal;
  final double shippingCost;
  final double tax;
  final double total;
  final OrderStatus status;
  final Address shippingAddress;
  final PaymentMethod paymentMethod;
  final DateTime createdAt;
  final DateTime? updatedAt;
  
  Order({
    required this.id,
    required this.userId,
    required this.items,
    required this.subtotal,
    required this.shippingCost,
    required this.tax,
    required this.total,
    required this.status,
    required this.shippingAddress,
    required this.paymentMethod,
    required this.createdAt,
    this.updatedAt,
  });
}

enum OrderStatus {
  pending,
  confirmed,
  processing,
  shipped,
  delivered,
  cancelled,
  refunded,
}
```

---

## 8. API Specifications

### 8.1 REST API Endpoints

#### Products API
```http
GET /api/products
GET /api/products/{id}
GET /api/products/category/{category}
GET /api/products/search?q={query}
GET /api/products/featured
GET /api/products/flash-sale
```

#### Categories API
```http
GET /api/categories
GET /api/categories/{id}
GET /api/categories/{id}/products
```

#### Cart API (Future)
```http
GET /api/cart
POST /api/cart/items
PUT /api/cart/items/{id}
DELETE /api/cart/items/{id}
DELETE /api/cart
```

#### Orders API (Future)
```http
GET /api/orders
POST /api/orders
GET /api/orders/{id}
PUT /api/orders/{id}/status
```

### 8.2 Response Formats

#### Success Response
```json
{
  "success": true,
  "data": {
    "products": [
      {
        "id": 1,
        "name": "เสื้อยืด Premium Cotton",
        "price": 890,
        "originalPrice": 1290,
        "brand": "Nike",
        "category": "เสื้อผ้าผู้ชาย",
        "image": "https://images.unsplash.com/photo-xxx",
        "rating": 4.5,
        "reviews": 234,
        "discount": 31,
        "isBestSeller": true,
        "isNew": false,
        "isLiked": false
      }
    ]
  },
  "meta": {
    "total": 100,
    "page": 1,
    "perPage": 20,
    "totalPages": 5
  }
}
```

#### Error Response
```json
{
  "success": false,
  "error": {
    "code": "PRODUCT_NOT_FOUND",
    "message": "Product with ID 123 not found",
    "details": null
  }
}
```

### 8.3 Request/Response Examples

#### Get Products
```http
GET /api/products?category=เสื้อผ้าผู้ชาย&page=1&limit=20

Response:
{
  "success": true,
  "data": {
    "products": [...],
    "pagination": {
      "currentPage": 1,
      "totalPages": 5,
      "totalItems": 100,
      "itemsPerPage": 20
    }
  }
}
```

#### Search Products
```http
GET /api/products/search?q=เสื้อยืด&brand=Nike&minPrice=500&maxPrice=2000

Response:
{
  "success": true,
  "data": {
    "products": [...],
    "filters": {
      "brands": ["Nike", "Adidas"],
      "categories": ["เสื้อผ้าผู้ชาย"],
      "priceRange": {
        "min": 500,
        "max": 2000
      }
    }
  }
}
```

---

## 9. Security Requirements

### 9.1 Data Protection
- **Encryption**: All sensitive data encrypted at rest and in transit
- **Data Minimization**: Collect only necessary user data
- **Data Retention**: Automatic deletion of old data per policy
- **Backup Security**: Encrypted backups with access controls

### 9.2 Authentication & Authorization
- **Multi-Factor Authentication**: Optional for user accounts
- **Session Management**: Secure token-based authentication
- **Password Policy**: Strong password requirements
- **Account Lockout**: Temporary lockout after failed attempts

### 9.3 Network Security
- **HTTPS Only**: All communications over HTTPS
- **Certificate Pinning**: Prevent man-in-the-middle attacks
- **API Rate Limiting**: Prevent abuse and DDoS
- **Input Validation**: Sanitize all user inputs

### 9.4 Mobile Security
- **Code Obfuscation**: Protect against reverse engineering
- **Root/Jailbreak Detection**: Optional security measure
- **Secure Storage**: Use platform secure storage APIs
- **Runtime Protection**: Detect and prevent tampering

---

## 10. Performance Requirements

### 10.1 Response Time Requirements
| Operation | Target Time | Maximum Time |
|-----------|-------------|--------------|
| App Launch | < 2.0s | < 3.0s |
| Screen Navigation | < 200ms | < 300ms |
| Image Loading | < 800ms | < 1.5s |
| Search Results | < 300ms | < 500ms |
| Add to Cart | < 100ms | < 200ms |
| Product Details | < 400ms | < 600ms |

### 10.2 Memory Requirements
| Device Type | Target | Maximum |
|-------------|--------|---------|
| Low-end (2GB RAM) | < 80MB | < 120MB |
| Mid-range (4GB RAM) | < 100MB | < 150MB |
| High-end (6GB+ RAM) | < 120MB | < 200MB |

### 10.3 Network Optimization
- **Image Optimization**: WebP format, multiple resolutions
- **Caching Strategy**: Cache images and API responses
- **Lazy Loading**: Load content as needed
- **Compression**: Gzip compression for API responses
- **CDN**: Content delivery network for images

### 10.4 Battery Optimization
- **Background Processing**: Minimize background tasks
- **Network Batching**: Batch network requests
- **Location Services**: Use only when necessary
- **Push Notifications**: Efficient notification handling

---

## 11. Testing Requirements

### 11.1 Unit Testing
```dart
// Example Unit Test
void main() {
  group('Product Model Tests', () {
    test('should create product from JSON', () {
      final json = {
        'id': 1,
        'name': 'Test Product',
        'price': 100.0,
        'brand': 'Test Brand',
        'category': 'Test Category',
        'image': 'test.jpg',
        'rating': 4.5,
        'reviews': 10,
      };
      
      final product = Product.fromJson(json);
      
      expect(product.id, 1);
      expect(product.name, 'Test Product');
      expect(product.price, 100.0);
    });
    
    test('should calculate discount correctly', () {
      final product = Product(
        id: 1,
        name: 'Test',
        price: 800,
        originalPrice: 1000,
        brand: 'Test',
        category: 'Test',
        image: 'test.jpg',
        rating: 4.0,
        reviews: 10,
      );
      
      expect(product.discountPercentage, 20);
    });
  });
}
```

### 11.2 Widget Testing
```dart
void main() {
  group('ProductCard Widget Tests', () {
    testWidgets('should display product information', (tester) async {
      final product = Product(
        id: 1,
        name: 'Test Product',
        price: 100,
        brand: 'Test Brand',
        category: 'Test',
        image: 'test.jpg',
        rating: 4.5,
        reviews: 10,
      );
      
      await tester.pumpWidget(MaterialApp(
        home: ProductCard(product: product),
      ));
      
      expect(find.text('Test Product'), findsOneWidget);
      expect(find.text('Test Brand'), findsOneWidget);
      expect(find.text('฿100'), findsOneWidget);
    });
    
    testWidgets('should trigger onTap callback', (tester) async {
      var tapped = false;
      
      await tester.pumpWidget(MaterialApp(
        home: ProductCard(
          product: testProduct,
          onTap: () => tapped = true,
        ),
      ));
      
      await tester.tap(find.byType(ProductCard));
      expect(tapped, true);
    });
  });
}
```

### 11.3 Integration Testing
```dart
void main() {
  group('Shopping Flow Integration Tests', () {
    testWidgets('complete shopping flow', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      
      // Navigate to product
      await tester.tap(find.text('เสื้อผ้าผู้ชาย'));
      await tester.pumpAndSettle();
      
      // Add to cart
      await tester.tap(find.byIcon(Icons.add_shopping_cart));
      await tester.pumpAndSettle();
      
      // Verify cart badge
      expect(find.text('1'), findsOneWidget);
      
      // Navigate to cart
      await tester.tap(find.byIcon(Icons.shopping_cart));
      await tester.pumpAndSettle();
      
      // Verify product in cart
      expect(find.text('เสื้อยืด Premium Cotton'), findsOneWidget);
    });
  });
}
```

### 11.4 Performance Testing
- **Load Testing**: Test with large product datasets
- **Memory Leak Testing**: Monitor memory usage over time
- **Battery Usage Testing**: Measure power consumption
- **Network Testing**: Test with slow/unreliable connections

### 11.5 Testing Coverage Goals
- **Unit Tests**: 80% code coverage minimum
- **Widget Tests**: All custom widgets tested
- **Integration Tests**: Critical user flows covered
- **E2E Tests**: Main shopping scenarios automated

---

## 12. Deployment Specifications

### 12.1 Build Configuration

#### Android Build
```gradle
android {
    compileSdkVersion 34
    
    defaultConfig {
        applicationId "com.fashionshop.app"
        minSdkVersion 21
        targetSdkVersion 34
        versionCode 1
        versionName "1.0.0"
    }
    
    buildTypes {
        release {
            minifyEnabled true
            shrinkResources true
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
        }
        debug {
            debuggable true
            applicationIdSuffix ".debug"
        }
    }
}
```

#### iOS Build
```yaml
# ios/Runner/Info.plist
<key>CFBundleIdentifier</key>
<string>com.fashionshop.app</string>
<key>CFBundleVersion</key>
<string>1</string>
<key>CFBundleShortVersionString</key>
<string>1.0.0</string>
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <false/>
</dict>
```

### 12.2 Environment Configuration
```dart
class Environment {
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://api.fashionshop.com',
  );
  
  static const bool isProduction = bool.fromEnvironment(
    'PRODUCTION',
    defaultValue: false,
  );
  
  static const String appVersion = String.fromEnvironment(
    'APP_VERSION',
    defaultValue: '1.0.0',
  );
}
```

### 12.3 CI/CD Pipeline
```yaml
# .github/workflows/build.yml
name: Build and Deploy

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main ]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.19.0'
      - run: flutter pub get
      - run: flutter test
      - run: flutter analyze

  build-android:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter build apk --release
      - uses: actions/upload-artifact@v3
        with:
          name: android-apk
          path: build/app/outputs/flutter-apk/app-release.apk

  build-ios:
    needs: test
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter build ios --release --no-codesign
      - uses: actions/upload-artifact@v3
        with:
          name: ios-app
          path: build/ios/iphoneos/Runner.app
```

### 12.4 Release Process
1. **Version Bump**: Update version in pubspec.yaml
2. **Changelog**: Update CHANGELOG.md with new features/fixes
3. **Testing**: Run full test suite
4. **Build**: Create release builds for all platforms
5. **Store Upload**: Upload to App Store and Google Play
6. **Deployment**: Deploy backend changes if any
7. **Monitoring**: Monitor crash reports and analytics

### 12.5 App Store Requirements

#### Google Play Store
- **Target API Level**: 34 (Android 14)
- **App Bundle**: Required for new apps
- **Privacy Policy**: Required URL
- **Content Rating**: Appropriate rating
- **App Signing**: Google Play App Signing

#### Apple App Store
- **iOS Version**: Minimum iOS 11.0
- **App Store Guidelines**: Compliance required
- **Privacy Labels**: Required declarations
- **App Review**: Human review process
- **TestFlight**: Beta testing platform

---

## Appendices

### A. Glossary
- **Flutter**: Google's UI toolkit for building natively compiled applications
- **Dart**: Programming language optimized for client development
- **Material Design**: Design system created by Google
- **API**: Application Programming Interface
- **CI/CD**: Continuous Integration/Continuous Deployment
- **GDPR**: General Data Protection Regulation
- **SDK**: Software Development Kit

### B. References
- [Flutter Documentation](https://docs.flutter.dev/)
- [Material Design Guidelines](https://material.io/design)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Firebase Documentation](https://firebase.google.com/docs)
- [Google Play Console](https://developer.android.com/distribute/console)
- [App Store Connect](https://developer.apple.com/app-store-connect/)

### C. Version History
| Version | Date | Changes |
|---------|------|---------|
| 1.0.0 | 2025-11-14 | Initial specification document |

---

**Document Status**: Draft  
**Last Updated**: November 14, 2025  
**Next Review**: December 14, 2025