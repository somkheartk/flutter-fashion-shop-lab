# Fashion Shop API - NestJS Backend

Backend API สำหรับ Flutter Fashion Shop application ที่สร้างด้วย NestJS และ MongoDB

## 🚀 Features

- **RESTful API** พร้อม Swagger documentation
- **Product Management** - ดู, ค้นหา, กรองสินค้า
- **Categories** - จัดการหมวดหมู่สินค้า
- **Shopping Cart** - ระบบตะกร้าสินค้า
- **User Management** - จัดการโปรไฟล์ผู้ใช้
- **Order Management** - สร้างและติดตามคำสั่งซื้อ
- **Authentication** - JWT authentication
- **Database** - MongoDB with Mongoose
- **Validation** - Request validation
- **Rate Limiting** - ป้องกันการใช้งานมากเกินไป
- **CORS** - รองรับ Flutter app

## 📋 Requirements

- Node.js 18+
- npm or yarn
- MongoDB 5.0+

## 🛠️ Installation

```bash
# ติดตั้ง dependencies
cd backend
npm install

# สร้างไฟล์ .env
cp .env.example .env
```

## ⚙️ Configuration

แก้ไขไฟล์ `.env`:

```env
NODE_ENV=development
PORT=3000
API_PREFIX=v1
MONGODB_URI=mongodb://localhost:27017/fashion_shop
JWT_SECRET=your-secret-key-change-in-production
JWT_EXPIRES_IN=3600
THROTTLE_TTL=60
THROTTLE_LIMIT=100
CORS_ORIGINS=http://localhost:3000,http://localhost:8080
```

## 🏃 Running the Application

```bash
# Development mode
npm run start:dev

# Production mode
npm run build
npm run start:prod
```

API จะทำงานที่:
- **API Server**: http://localhost:3000
- **API Documentation**: http://localhost:3000/api-docs
- **API Endpoint**: http://localhost:3000/v1

## 📚 API Endpoints

### Products
- `GET /v1/products` - รายการสินค้าทั้งหมด
- `GET /v1/products/:id` - ดูรายละเอียดสินค้า
- `GET /v1/products/search?q=query` - ค้นหาสินค้า
- `GET /v1/products/featured?limit=10` - สินค้าแนะนำ

### Categories
- `GET /v1/categories` - รายการหมวดหมู่ทั้งหมด
- `GET /v1/categories/:id` - ดูรายละเอียดหมวดหมู่
- `GET /v1/categories/:id/products` - สินค้าในหมวดหมู่

### Cart
- `GET /v1/cart` - ดูตะกร้าสินค้า
- `POST /v1/cart/items` - เพิ่มสินค้าในตะกร้า
- `PUT /v1/cart/items/:id` - แก้ไขสินค้าในตะกร้า
- `DELETE /v1/cart/items/:id` - ลบสินค้าออกจากตะกร้า
- `DELETE /v1/cart` - ล้างตะกร้า

### Users
- `GET /v1/users/profile` - ดูโปรไฟล์
- `PUT /v1/users/profile` - แก้ไขโปรไฟล์
- `POST /v1/users/addresses` - เพิ่มที่อยู่

### Orders
- `GET /v1/orders` - รายการคำสั่งซื้อ
- `GET /v1/orders/:id` - ดูรายละเอียดคำสั่งซื้อ
- `POST /v1/orders` - สร้างคำสั่งซื้อใหม่
- `POST /v1/orders/:id/cancel` - ยกเลิกคำสั่งซื้อ

### Authentication
- `POST /v1/auth/login` - เข้าสู่ระบบ
- `POST /v1/auth/register` - ลงทะเบียน
- `POST /v1/auth/refresh` - Refresh token

## 📖 API Documentation

เมื่อเริ่มต้นเซิร์ฟเวอร์แล้ว เข้าไปที่ http://localhost:3000/api-docs เพื่อดู Swagger UI documentation

## 🗄️ Database

ใช้ MongoDB database ซึ่งจะถูกสร้างอัตโนมัติเมื่อรันครั้งแรก พร้อม seed ข้อมูลเริ่มต้น

**Database Collections:**

- **Products**: _id, name, description, price, originalPrice, category, imageUrl, rating, reviewCount, colors, sizes, isOnSale, createdAt, updatedAt
- **Categories**: _id, name, icon, color

## 🏗️ Project Structure

```
backend/
├── src/
│   ├── auth/           # Authentication module
│   ├── cart/           # Shopping cart module
│   ├── categories/     # Categories module
│   ├── products/       # Products module
│   ├── users/          # Users module
│   ├── orders/         # Orders module
│   ├── common/         # Shared utilities
│   ├── database/       # Database seed
│   ├── app.module.ts   # Root module
│   └── main.ts         # Entry point
├── .env.example
├── .gitignore
├── nest-cli.json
├── package.json
├── tsconfig.json
└── README.md
```

## 🔒 Security Features

- JWT-based authentication
- Request validation
- Rate limiting
- CORS configuration
- Environment variables
- SQL injection protection

## 🤝 Integration with Flutter App

API นี้ถูกออกแบบมาเพื่อใช้กับ Flutter Fashion Shop app:

1. แก้ไข API base URL ใน Flutter app ให้ชี้มาที่ backend นี้
2. ตั้งค่า CORS_ORIGINS ใน .env ให้ตรงกับ Flutter app
3. ใช้ API endpoints ตามที่ระบุไว้

ตัวอย่างการใช้งานใน Flutter:

```dart
class ApiClient {
  static const String baseUrl = 'http://localhost:3000/v1';
  
  static Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
    );
    return json.decode(response.body);
  }
}
```

## 📝 License

MIT

## 👨‍💻 Developer

**Somkheart K.**  
GitHub: [@somkheartk](https://github.com/somkheartk)
