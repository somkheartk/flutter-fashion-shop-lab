# 🔌 API Documentation - Fashion Shop

## 📖 Table of Contents
- [1. Overview](#1-overview)
- [2. Authentication](#2-authentication)
- [3. Products API](#3-products-api)
- [4. Categories API](#4-categories-api)
- [5. Cart API](#5-cart-api)
- [6. User API](#6-user-api)
- [7. Orders API](#7-orders-api)
- [8. Error Handling](#8-error-handling)
- [9. Rate Limiting](#9-rate-limiting)
- [10. Examples](#10-examples)

---

## 1. Overview

### Base URL
```
Production: https://api.fashionshop.com/v1
Staging: https://staging-api.fashionshop.com/v1
Development: http://localhost:3000/v1
```

### HTTP Methods
- `GET` - Retrieve data
- `POST` - Create new resource
- `PUT` - Update existing resource
- `PATCH` - Partial update
- `DELETE` - Remove resource

### Content Type
All requests and responses use `application/json` content type.

### Common Headers
```http
Content-Type: application/json
Accept: application/json
User-Agent: FashionShop-Mobile/1.0.0
Authorization: Bearer {token}
```

---

## 2. Authentication

### Bearer Token Authentication
```http
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

### Login
```http
POST /auth/login
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "password123"
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "user": {
      "id": "12345",
      "email": "user@example.com",
      "displayName": "John Doe",
      "photoURL": "https://example.com/avatar.jpg"
    },
    "tokens": {
      "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
      "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
      "expiresIn": 3600
    }
  }
}
```

### Refresh Token
```http
POST /auth/refresh
Content-Type: application/json

{
  "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

---

## 3. Products API

### Get All Products
```http
GET /products?page=1&limit=20&category=เสื้อผ้าผู้ชาย&brand=Nike&minPrice=500&maxPrice=2000&sort=price_asc
```

**Query Parameters:**
| Parameter | Type | Description | Default |
|-----------|------|-------------|---------|
| page | integer | Page number | 1 |
| limit | integer | Items per page (max 100) | 20 |
| category | string | Product category | - |
| brand | string | Product brand | - |
| minPrice | number | Minimum price | - |
| maxPrice | number | Maximum price | - |
| sort | string | Sort order (price_asc, price_desc, rating_desc, newest) | newest |
| search | string | Search query | - |

**Response:**
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
        "images": [
          "https://images.unsplash.com/photo-xxx",
          "https://images.unsplash.com/photo-yyy"
        ],
        "rating": 4.5,
        "reviews": 234,
        "discount": 31,
        "isBestSeller": true,
        "isNew": false,
        "isLiked": false,
        "description": "เสื้อยืดคุณภาพสูงจากผ้าคอตตอน 100%",
        "attributes": {
          "material": "Cotton 100%",
          "care": "Machine wash cold",
          "origin": "Thailand"
        },
        "variants": [
          {
            "id": "1-red-m",
            "color": "Red",
            "size": "M",
            "stock": 10,
            "sku": "NIKE-TEE-RED-M"
          }
        ],
        "tags": ["casual", "comfortable", "premium"],
        "createdAt": "2025-01-01T00:00:00Z",
        "updatedAt": "2025-01-15T10:30:00Z"
      }
    ],
    "pagination": {
      "currentPage": 1,
      "totalPages": 25,
      "totalItems": 500,
      "itemsPerPage": 20,
      "hasNextPage": true,
      "hasPrevPage": false
    },
    "filters": {
      "categories": [
        {
          "name": "เสื้อผ้าผู้ชาย",
          "count": 150
        },
        {
          "name": "เสื้อผ้าผู้หญิง",
          "count": 200
        }
      ],
      "brands": [
        {
          "name": "Nike",
          "count": 50
        },
        {
          "name": "Adidas",
          "count": 40
        }
      ],
      "priceRange": {
        "min": 100,
        "max": 5000
      }
    }
  }
}
```

### Get Single Product
```http
GET /products/{id}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "product": {
      "id": 1,
      "name": "เสื้อยืด Premium Cotton",
      "price": 890,
      "originalPrice": 1290,
      "brand": "Nike",
      "category": "เสื้อผ้าผู้ชาย",
      "images": [
        "https://images.unsplash.com/photo-xxx",
        "https://images.unsplash.com/photo-yyy",
        "https://images.unsplash.com/photo-zzz"
      ],
      "rating": 4.5,
      "reviews": 234,
      "discount": 31,
      "description": "เสื้อยืดคุณภาพสูงจากผ้าคอตตอน 100% นุ่มสบาย ระบายอากาศได้ดี เหมาะสำหรับการใส่ในชีวิตประจำวัน",
      "features": [
        "ผ้าคอตตอน 100%",
        "ระบายอากาศได้ดี",
        "ไม่หด ไม่ซีด",
        "ซักง่าย แห้งเร็ว"
      ],
      "specifications": {
        "material": "Cotton 100%",
        "weight": "180 GSM",
        "care": "Machine wash cold, tumble dry low",
        "origin": "Thailand",
        "brand": "Nike"
      },
      "variants": [
        {
          "id": "1-red-s",
          "color": "Red",
          "size": "S",
          "stock": 5,
          "sku": "NIKE-TEE-RED-S"
        },
        {
          "id": "1-red-m",
          "color": "Red",
          "size": "M",
          "stock": 10,
          "sku": "NIKE-TEE-RED-M"
        }
      ],
      "reviews": [
        {
          "id": "rev-001",
          "userId": "user-123",
          "userName": "สมใจ ใจดี",
          "rating": 5,
          "comment": "เสื้อดีมาก นุ่มสบาย ใส่แล้วเก๋",
          "createdAt": "2025-01-10T15:30:00Z",
          "helpful": 12
        }
      ],
      "relatedProducts": [2, 3, 4, 5],
      "tags": ["casual", "comfortable", "premium"],
      "seo": {
        "title": "เสื้อยืด Premium Cotton Nike - คุณภาพสูง",
        "description": "เสื้อยืดคุณภาพสูงจาก Nike ผ้าคอตตอน 100%",
        "keywords": ["เสื้อยืด", "Nike", "Cotton", "Premium"]
      }
    }
  }
}
```

### Search Products
```http
GET /products/search?q=เสื้อยืด Nike&category=เสื้อผ้าผู้ชาย
```

### Featured Products
```http
GET /products/featured?type=bestseller&limit=10
```

**Query Parameters:**
| Parameter | Type | Description |
|-----------|------|-------------|
| type | string | featured, bestseller, new, sale |
| limit | integer | Number of products (default: 10) |

### Flash Sale Products
```http
GET /products/flash-sale
```

**Response:**
```json
{
  "success": true,
  "data": {
    "flashSale": {
      "id": "flash-001",
      "title": "Flash Sale สุดสัปดาห์",
      "startTime": "2025-01-15T00:00:00Z",
      "endTime": "2025-01-17T23:59:59Z",
      "timeRemaining": 7200,
      "products": [
        {
          "id": 1,
          "name": "เสื้อยืดโอเวอร์ไซส์",
          "originalPrice": 399,
          "salePrice": 199,
          "discount": 50,
          "image": "https://images.unsplash.com/photo-xxx",
          "stock": 25,
          "sold": 15
        }
      ]
    }
  }
}
```

---

## 4. Categories API

### Get All Categories
```http
GET /categories
```

**Response:**
```json
{
  "success": true,
  "data": {
    "categories": [
      {
        "id": 1,
        "name": "ผู้ชาย",
        "slug": "men",
        "image": "https://images.unsplash.com/photo-xxx",
        "icon": "man",
        "productCount": 250,
        "subcategories": [
          {
            "id": 11,
            "name": "เสื้อผ้าผู้ชาย",
            "slug": "mens-clothing",
            "productCount": 150
          },
          {
            "id": 12,
            "name": "รองเท้าผู้ชาย",
            "slug": "mens-shoes",
            "productCount": 100
          }
        ]
      },
      {
        "id": 2,
        "name": "ผู้หญิง",
        "slug": "women",
        "image": "https://images.unsplash.com/photo-yyy",
        "icon": "woman",
        "productCount": 300,
        "subcategories": [
          {
            "id": 21,
            "name": "เสื้อผ้าผู้หญิง",
            "slug": "womens-clothing",
            "productCount": 200
          }
        ]
      }
    ]
  }
}
```

### Get Category Products
```http
GET /categories/{id}/products?page=1&limit=20&sort=newest
```

---

## 5. Cart API

### Get Cart
```http
GET /cart
Authorization: Bearer {token}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "cart": {
      "id": "cart-123",
      "userId": "user-123",
      "items": [
        {
          "id": "item-001",
          "product": {
            "id": 1,
            "name": "เสื้อยืด Premium Cotton",
            "price": 890,
            "image": "https://images.unsplash.com/photo-xxx",
            "brand": "Nike"
          },
          "quantity": 2,
          "selectedVariant": {
            "color": "Red",
            "size": "M"
          },
          "unitPrice": 890,
          "totalPrice": 1780,
          "addedAt": "2025-01-15T10:30:00Z"
        }
      ],
      "summary": {
        "itemCount": 2,
        "subtotal": 1780,
        "shipping": 100,
        "tax": 178,
        "discount": 0,
        "total": 2058
      },
      "updatedAt": "2025-01-15T10:30:00Z"
    }
  }
}
```

### Add Item to Cart
```http
POST /cart/items
Authorization: Bearer {token}
Content-Type: application/json

{
  "productId": 1,
  "quantity": 2,
  "variantId": "1-red-m"
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "item": {
      "id": "item-002",
      "product": {
        "id": 1,
        "name": "เสื้อยืด Premium Cotton",
        "price": 890,
        "image": "https://images.unsplash.com/photo-xxx"
      },
      "quantity": 2,
      "selectedVariant": {
        "color": "Red",
        "size": "M"
      },
      "totalPrice": 1780
    },
    "cart": {
      "itemCount": 3,
      "total": 3838
    }
  }
}
```

### Update Cart Item
```http
PUT /cart/items/{itemId}
Authorization: Bearer {token}
Content-Type: application/json

{
  "quantity": 3
}
```

### Remove Cart Item
```http
DELETE /cart/items/{itemId}
Authorization: Bearer {token}
```

### Clear Cart
```http
DELETE /cart
Authorization: Bearer {token}
```

---

## 6. User API

### Get User Profile
```http
GET /users/profile
Authorization: Bearer {token}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "user": {
      "id": "user-123",
      "email": "user@example.com",
      "displayName": "John Doe",
      "photoURL": "https://example.com/avatar.jpg",
      "phoneNumber": "+66812345678",
      "dateOfBirth": "1990-01-01",
      "gender": "male",
      "addresses": [
        {
          "id": "addr-001",
          "type": "home",
          "name": "บ้าน",
          "recipientName": "John Doe",
          "phoneNumber": "+66812345678",
          "address": "123 ถนนสุขุมวิท",
          "district": "คลองเตย",
          "province": "กรุงเทพมหานคร",
          "postalCode": "10110",
          "isDefault": true
        }
      ],
      "preferences": {
        "newsletter": true,
        "smsNotifications": false,
        "pushNotifications": true,
        "language": "th",
        "currency": "THB"
      },
      "statistics": {
        "totalOrders": 15,
        "totalSpent": 25000,
        "favoriteCategory": "เสื้อผ้าผู้ชาย",
        "memberSince": "2024-01-01T00:00:00Z"
      }
    }
  }
}
```

### Update User Profile
```http
PUT /users/profile
Authorization: Bearer {token}
Content-Type: application/json

{
  "displayName": "John Smith",
  "phoneNumber": "+66812345678",
  "dateOfBirth": "1990-01-01"
}
```

### Add Address
```http
POST /users/addresses
Authorization: Bearer {token}
Content-Type: application/json

{
  "type": "office",
  "name": "ที่ทำงาน",
  "recipientName": "John Doe",
  "phoneNumber": "+66812345678",
  "address": "456 ถนนพหลโยธิน",
  "district": "จตุจักร",
  "province": "กรุงเทพมหานคร",
  "postalCode": "10900",
  "isDefault": false
}
```

---

## 7. Orders API

### Create Order
```http
POST /orders
Authorization: Bearer {token}
Content-Type: application/json

{
  "items": [
    {
      "productId": 1,
      "variantId": "1-red-m",
      "quantity": 2,
      "unitPrice": 890
    }
  ],
  "shippingAddress": {
    "recipientName": "John Doe",
    "phoneNumber": "+66812345678",
    "address": "123 ถนนสุขุมวิท",
    "district": "คลองเตย",
    "province": "กรุงเทพมหานคร",
    "postalCode": "10110"
  },
  "paymentMethod": {
    "type": "credit_card",
    "provider": "visa",
    "token": "card_token_123"
  },
  "couponCode": "SAVE10"
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "order": {
      "id": "order-123",
      "orderNumber": "FSH-2025-001",
      "status": "pending",
      "items": [
        {
          "product": {
            "id": 1,
            "name": "เสื้อยืด Premium Cotton",
            "image": "https://images.unsplash.com/photo-xxx"
          },
          "quantity": 2,
          "unitPrice": 890,
          "totalPrice": 1780
        }
      ],
      "summary": {
        "subtotal": 1780,
        "shipping": 100,
        "tax": 178,
        "discount": 178,
        "total": 1880
      },
      "shippingAddress": {
        "recipientName": "John Doe",
        "phoneNumber": "+66812345678",
        "address": "123 ถนนสุขุมวิท คลองเตย กรุงเทพมหานคร 10110"
      },
      "tracking": {
        "number": null,
        "url": null
      },
      "createdAt": "2025-01-15T10:30:00Z",
      "estimatedDelivery": "2025-01-18T10:30:00Z"
    }
  }
}
```

### Get User Orders
```http
GET /orders?page=1&limit=10&status=all
Authorization: Bearer {token}
```

**Query Parameters:**
| Parameter | Type | Description |
|-----------|------|-------------|
| page | integer | Page number |
| limit | integer | Items per page |
| status | string | pending, confirmed, shipped, delivered, cancelled |

### Get Order Details
```http
GET /orders/{orderId}
Authorization: Bearer {token}
```

### Cancel Order
```http
POST /orders/{orderId}/cancel
Authorization: Bearer {token}
Content-Type: application/json

{
  "reason": "เปลี่ยนใจ",
  "comment": "ต้องการสินค้าสีอื่น"
}
```

---

## 8. Error Handling

### Error Response Format
```json
{
  "success": false,
  "error": {
    "code": "PRODUCT_NOT_FOUND",
    "message": "Product with ID 123 not found",
    "details": {
      "productId": 123,
      "timestamp": "2025-01-15T10:30:00Z"
    }
  }
}
```

### Common Error Codes

#### 4xx Client Errors
| Code | HTTP Status | Description |
|------|-------------|-------------|
| INVALID_REQUEST | 400 | Invalid request format or parameters |
| UNAUTHORIZED | 401 | Authentication required |
| FORBIDDEN | 403 | Access denied |
| NOT_FOUND | 404 | Resource not found |
| VALIDATION_ERROR | 422 | Request validation failed |
| RATE_LIMITED | 429 | Too many requests |

#### 5xx Server Errors
| Code | HTTP Status | Description |
|------|-------------|-------------|
| INTERNAL_ERROR | 500 | Internal server error |
| SERVICE_UNAVAILABLE | 503 | Service temporarily unavailable |
| GATEWAY_TIMEOUT | 504 | Gateway timeout |

### Validation Errors
```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Validation failed",
    "details": {
      "errors": [
        {
          "field": "email",
          "message": "Invalid email format",
          "code": "INVALID_EMAIL"
        },
        {
          "field": "quantity",
          "message": "Quantity must be greater than 0",
          "code": "INVALID_QUANTITY"
        }
      ]
    }
  }
}
```

---

## 9. Rate Limiting

### Rate Limits
| Endpoint | Limit | Window |
|----------|-------|--------|
| Authentication | 5 requests | 15 minutes |
| Product Search | 100 requests | 1 hour |
| Cart Operations | 50 requests | 15 minutes |
| Order Creation | 10 requests | 1 hour |
| General API | 1000 requests | 1 hour |

### Rate Limit Headers
```http
X-RateLimit-Limit: 1000
X-RateLimit-Remaining: 999
X-RateLimit-Reset: 1642694400
Retry-After: 3600
```

### Rate Limit Exceeded Response
```json
{
  "success": false,
  "error": {
    "code": "RATE_LIMITED",
    "message": "Too many requests. Please try again later.",
    "details": {
      "limit": 1000,
      "resetTime": "2025-01-15T11:30:00Z"
    }
  }
}
```

---

## 10. Examples

### Flutter HTTP Client Setup
```dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiClient {
  static const String baseUrl = 'https://api.fashionshop.com/v1';
  
  static Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    
    return _handleResponse(response);
  }
  
  static Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(body),
    );
    
    return _handleResponse(response);
  }
  
  static Map<String, dynamic> _handleResponse(http.Response response) {
    final data = json.decode(response.body);
    
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    } else {
      throw ApiException(
        code: data['error']['code'],
        message: data['error']['message'],
        statusCode: response.statusCode,
      );
    }
  }
}

class ApiException implements Exception {
  final String code;
  final String message;
  final int statusCode;
  
  ApiException({
    required this.code,
    required this.message,
    required this.statusCode,
  });
}
```

### Usage Examples
```dart
// Get products
try {
  final response = await ApiClient.get('/products?category=เสื้อผ้าผู้ชาย&page=1');
  final products = response['data']['products'];
  // Handle products
} catch (e) {
  if (e is ApiException) {
    print('API Error: ${e.message}');
  }
}

// Add to cart
try {
  final response = await ApiClient.post('/cart/items', {
    'productId': 1,
    'quantity': 2,
    'variantId': '1-red-m',
  });
  // Handle success
} catch (e) {
  // Handle error
}
```

### Product Service Example
```dart
class ProductService {
  static Future<List<Product>> getProducts({
    String? category,
    int page = 1,
    int limit = 20,
  }) async {
    final params = <String, String>{
      'page': page.toString(),
      'limit': limit.toString(),
    };
    
    if (category != null) {
      params['category'] = category;
    }
    
    final query = params.entries
        .map((e) => '${e.key}=${Uri.encodeComponent(e.value)}')
        .join('&');
    
    final response = await ApiClient.get('/products?$query');
    final productsJson = response['data']['products'] as List;
    
    return productsJson.map((json) => Product.fromJson(json)).toList();
  }
  
  static Future<Product> getProduct(int id) async {
    final response = await ApiClient.get('/products/$id');
    return Product.fromJson(response['data']['product']);
  }
  
  static Future<List<Product>> searchProducts(String query) async {
    final response = await ApiClient.get('/products/search?q=${Uri.encodeComponent(query)}');
    final productsJson = response['data']['products'] as List;
    
    return productsJson.map((json) => Product.fromJson(json)).toList();
  }
}
```

---

**API Version**: v1  
**Last Updated**: November 14, 2025  
**Documentation Status**: Complete