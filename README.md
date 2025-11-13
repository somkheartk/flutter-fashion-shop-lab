# 🛍️ Fashion Shop - แอปขายเสื้อผ้า

แอปขายเสื้อผ้าและแฟชั่น พัฒนาด้วย Flutter สำหรับ iOS, Android และ Web

---

## 📱 คุณสมบัติหลัก

### 🏠 หน้าหลัก
- 🔍 **ค้นหาสินค้า** - ค้นหาได้รวดเร็ว
- 🏷️ **หมวดหมู่** - 6 ประเภท (ผู้ชาย, ผู้หญิง, เด็ก, รองเท้า, กระเป๋า, เครื่องประดับ)
- 🎯 **Banner โปรโมชั่น** - ข้อเสนอพิเศษ
- ⚡ **Flash Sale** - ลดราคาจำกัดเวลา
- 🔥 **สินค้ายอดนิยม** - Top Performing
- 👔 **แบรนด์ดัง** - Nike, Adidas, Zara, H&M
- 📦 **สินค้าแต่ละหมวด** - แสดง 4 คอลัมน์

### 🛒 ช้อปปิ้ง
- ➕ **เพิ่มลงตะกร้า** - Add to Cart
- 👁️ **ดูรายละเอียด** - Quick View
- ❤️ **รายการโปรด** - Wishlist
- ⭐ **คะแนนรีวิว** - Rating & Reviews
- 💰 **ราคาพิเศษ** - ราคาปกติ/ลดราคา

### 🎨 การออกแบบ
- 🎯 **Material Design 3** - UI ทันสมัย
- 🇹🇭 **ฟอนต์ Kanit** - รองรับภาษาไทย
- 📱 **Responsive** - รองรับทุกหน้าจอ
- ✨ **Animation** - เคลื่อนไหวลื่นไหล

---

## 🚀 เริ่มต้นใช้งาน

### ความต้องการ
- Flutter 3.19+
- Dart 3.3+
- Android Studio หรือ VS Code

### ติดตั้ง
```bash
# 1. Clone โปรเจค
git clone https://github.com/somkheartk/flutter-fashion-shop-lab.git
cd flutter-fashion-shop-lab

# 2. ติดตั้ง dependencies
flutter pub get

# 3. รันแอป
flutter run

# หรือรันบน Chrome
flutter run -d chrome
```

---

## 📁 โครงสร้างโปรเจค

```
lib/
├── main.dart                 # จุดเริ่มต้นแอป
├── constants/
│   └── colors.dart          # สี theme
├── screens/
│   ├── home/
│   │   └── home_screen.dart      # หน้าหลัก
│   ├── cart/
│   │   └── cart_screen.dart      # ตะกร้าสินค้า
│   └── category/
│       └── category_screen.dart  # หมวดหมู่
└── widgets/
    └── banner_card.dart          # Banner component
```

---

## 🛠️ เทคโนโลยี

- **Flutter 3.19+** - Framework หลัก
- **Dart 3.3+** - ภาษาโปรแกรม
- **Google Fonts** - ฟอนต์ Kanit
- **Material Design 3** - UI Components
- **Unsplash** - รูปภาพสินค้า

---

## 🎯 สิ่งที่กำลังพัฒนา

- [ ] ระบบสมาชิก (Login/Register)
- [ ] เชื่อมต่อ API จริง
- [ ] ระบบชำระเงิน
- [ ] การแจ้งเตือน Push Notification

---

## 📚 เอกสารเพิ่มเติม

- [API Documentation](docs/api.md) - คู่มือ API
- [Component Guide](docs/components.md) - คู่มือ Components
- [Software Specification](docs/software-specification.md) - ข้อกำหนดซอฟต์แวร์

---

## 👨‍💻 ผู้พัฒนา

**Somkheart K.**  
📧 Email: somkheart@gmail.com  
🐙 GitHub: [@somkheartk](https://github.com/somkheartk)

---

## 📄 License

MIT License - ใช้งานได้อย่างอิสระ

---

<div align="center">

**Fashion Shop** - สร้างด้วย ❤️ และ Flutter

[📥 Download](https://github.com/somkheartk/flutter-fashion-shop-lab/releases) • [📖 Docs](docs/) • [🐛 Issues](https://github.com/somkheartk/flutter-fashion-shop-lab/issues)

</div>