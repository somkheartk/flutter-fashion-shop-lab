import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SimpleNotificationScreen extends StatelessWidget {
  const SimpleNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF2D3436)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'การแจ้งเตือน',
          style: GoogleFonts.kanit(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2D3436),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildNotificationCard(
            icon: Icons.shopping_cart,
            iconColor: const Color(0xFF4ECE5B),
            title: 'สั่งซื้อสำเร็จ!',
            message: 'คำสั่งซื้อ #FS2024001 ของคุณได้รับการยืนยันแล้ว',
            time: '5 นาทีที่แล้ว',
            isUnread: true,
          ),
          _buildNotificationCard(
            icon: Icons.local_offer,
            iconColor: const Color(0xFFFF9A62),
            title: 'ส่วนลดพิเศษ 50%',
            message: 'สินค้าในหมวดผู้หญิงลดราคาสูงสุด 50% วันนี้เท่านั้น!',
            time: '2 ชั่วโมงที่แล้ว',
            isUnread: true,
          ),
          _buildNotificationCard(
            icon: Icons.favorite,
            iconColor: const Color(0xFFFF6B9D),
            title: 'สินค้าที่คุณชื่นชอบลดราคา',
            message: 'Women Jacket ที่คุณใส่ในรายการโปรดลดราคา 25%',
            time: '5 ชั่วโมงที่แล้ว',
            isUnread: false,
          ),
          _buildNotificationCard(
            icon: Icons.local_shipping,
            iconColor: const Color(0xFF5B9CDF),
            title: 'การจัดส่งสำเร็จ',
            message: 'คำสั่งซื้อ #FS2024000 ถูกจัดส่งสำเร็จแล้ว',
            time: '1 วันที่แล้ว',
            isUnread: false,
          ),
          _buildNotificationCard(
            icon: Icons.new_releases,
            iconColor: const Color(0xFF9C88FF),
            title: 'สินค้าใหม่มาแล้ว!',
            message: 'คอลเลคชั่นใหม่ฤดูใบไม้ผลิ 2024 พร้อมให้ช็อปแล้ว',
            time: '2 วันที่แล้ว',
            isUnread: false,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String message,
    required String time,
    required bool isUnread,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isUnread
            ? const Color(0xFF4ECE5B).withOpacity(0.05)
            : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isUnread
              ? const Color(0xFF4ECE5B).withOpacity(0.2)
              : Colors.grey[200]!,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Icon(icon, color: iconColor, size: 24),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.kanit(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF2D3436),
                ),
              ),
            ),
            if (isUnread)
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFF4ECE5B),
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              message,
              style: GoogleFonts.kanit(
                fontSize: 14,
                color: const Color(0xFF636E72),
                height: 1.3,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              time,
              style: GoogleFonts.kanit(
                fontSize: 12,
                color: const Color(0xFF95A5A6),
              ),
            ),
          ],
        ),
        onTap: () {
          // Handle notification tap
        },
      ),
    );
  }
}
