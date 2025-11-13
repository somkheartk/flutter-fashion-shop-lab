import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/colors.dart';
import '../cart/cart_screen.dart';
import 'simple_notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final PageController _bannerController = PageController();
  int _currentBannerIndex = 0;
  String selectedProductCategory = 'ทั้งหมด';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartScreen()),
          );
        },
        backgroundColor: AppColors.primary,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Icon(Icons.shopping_cart_outlined, color: Colors.white),
            // Simple badge (static for now)
            Positioned(
              right: -6,
              top: -6,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: AppColors.error,
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
                child: Center(
                  child: Text(
                    '3',
                    style: GoogleFonts.kanit(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              _buildHeader(),
              const SizedBox(height: 16),

              // Search Bar
              _buildSearchBar(),
              const SizedBox(height: 24),

              // Quick Actions
              _buildQuickActions(),
              const SizedBox(height: 24),

              // Categories
              _buildCategoriesSection(),
              const SizedBox(height: 24),

              // Banner
              _buildBannerSection(),
              const SizedBox(height: 24),

              // Flash Sale Section
              _buildFlashSaleSection(),
              const SizedBox(height: 24),

              // Top Performing Products
              _buildTopPerformingSection(),
              const SizedBox(height: 24),

              // Popular Brands
              _buildPopularBrandsSection(),
              const SizedBox(height: 24),

              // All Products
              _buildAllProductsSection(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'สวัสดี ',
                      style: GoogleFonts.kanit(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Text(
                      'คุณลูกค้า',
                      style: GoogleFonts.kanit(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text('👋', style: TextStyle(fontSize: 20)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'ค้นพบแฟชั่นใหม่ๆ ที่เหมาะกับคุณ',
                  style: GoogleFonts.kanit(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SimpleNotificationScreen(),
                ),
              );
            },
            child: Stack(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary,
                        AppColors.primary.withOpacity(0.8),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.notifications_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                // Notification badge
                Positioned(
                  top: 2,
                  right: 2,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: const BoxDecoration(
                      color: AppColors.error,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '2',
                        style: GoogleFonts.kanit(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.1),
              blurRadius: 12,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: '🔍 ค้นหาเสื้อผ้า เครื่องประดับ หรือแบรนด์ที่ชื่นชอب...',
            hintStyle: GoogleFonts.kanit(
              color: AppColors.textLight,
              fontSize: 14,
            ),
            prefixIcon: Container(
              padding: const EdgeInsets.all(12),
              child: Icon(
                Icons.search_rounded,
                color: AppColors.primary,
                size: 20,
              ),
            ),
            suffixIcon: Container(
              padding: const EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.tune_rounded,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoriesSection() {
    final categories = [
      {
        'name': 'ผู้ชาย',
        'image':
            'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300&h=300&fit=crop&crop=face',
        'icon': Icons.man,
      },
      {
        'name': 'ผู้หญิง',
        'image':
            'https://images.unsplash.com/photo-1494790108755-2616b612b15c?w=300&h=300&fit=crop&crop=face',
        'icon': Icons.woman,
      },
      {
        'name': 'เด็ก',
        'image':
            'https://images.unsplash.com/photo-1503454537195-1dcabb73ffb9?w=300&h=300&fit=crop',
        'icon': Icons.child_care,
      },
      {
        'name': 'รองเท้า',
        'image':
            'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=300&h=300&fit=crop',
        'icon': Icons.sports_motorsports,
      },
      {
        'name': 'เครื่องประดับ',
        'image':
            'https://images.unsplash.com/photo-1515562141207-7a88fb7ce338?w=300&h=300&fit=crop',
        'icon': Icons.diamond,
      },
      {
        'name': 'กระเป๋า',
        'image':
            'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=300&h=300&fit=crop',
        'icon': Icons.backpack,
      },
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'หมวดหมู่',
                style: GoogleFonts.kanit(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                'ดูทั้งหมด',
                style: GoogleFonts.kanit(
                  fontSize: 14,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return GestureDetector(
                onTap: () {
                  // Navigate to category page
                },
                child: Container(
                  width: 80,
                  margin: const EdgeInsets.only(right: 12),
                  child: Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            category['image'] as String,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Icon(
                                  category['icon'] as IconData,
                                  color: AppColors.primary,
                                  size: 24,
                                ),
                              );
                            },
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        category['name'] as String,
                        style: GoogleFonts.kanit(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBannerSection() {
    final banners = [
      {
        'title': 'ลดราคาสูงสุด 70%',
        'subtitle': 'Flash Sale วันนี้เท่านั้น!',
        'buttonText': 'ช็อปเลย',
        'gradient': [AppColors.orange, AppColors.error],
        'emoji': '🔥',
      },
      {
        'title': 'ส่วนลดสมาชิกใหม่',
        'subtitle': 'รับคูปอง 50% ฟรี',
        'buttonText': 'สมัครเลย',
        'gradient': [AppColors.primary, AppColors.secondary],
        'emoji': '🎁',
      },
      {
        'title': 'จัดส่งฟรี',
        'subtitle': 'สั่งซื้อขั้นต่ำ 500 บาท',
        'buttonText': 'เริ่มช็อป',
        'gradient': [AppColors.blue, AppColors.purple],
        'emoji': '🚚',
      },
      {
        'title': 'แฟชั่นใหม่มาแล้ว',
        'subtitle': 'คอลเลคชั่น 2024',
        'buttonText': 'ดูสินค้า',
        'gradient': [AppColors.purple, AppColors.pink],
        'emoji': '✨',
      },
    ];

    return Column(
      children: [
        SizedBox(
          height: 150,
          child: PageView.builder(
            controller: _bannerController,
            itemCount: banners.length,
            onPageChanged: (index) {
              setState(() {
                _currentBannerIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final banner = banners[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: banner['gradient'] as List<Color>,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: (banner['gradient'] as List<Color>)[0].withOpacity(
                        0.3,
                      ),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // Background decoration
                    Positioned(
                      right: -20,
                      top: -20,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 20,
                      bottom: -10,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    // Content
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                banner['emoji'] as String,
                                style: const TextStyle(fontSize: 24),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  banner['title'] as String,
                                  style: GoogleFonts.kanit(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            banner['subtitle'] as String,
                            style: GoogleFonts.kanit(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                          const Spacer(),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Text(
                                banner['buttonText'] as String,
                                style: GoogleFonts.kanit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: (banner['gradient'] as List<Color>)[0],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        // Page indicators
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            banners.length,
            (index) => GestureDetector(
              onTap: () {
                _bannerController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: _currentBannerIndex == index ? 24 : 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: _currentBannerIndex == index
                      ? AppColors.primary
                      : AppColors.textLight.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTopPerformingSection() {
    final popularProducts = [
      {
        'name': 'เสื้อยืดคอตตอน Premium',
        'price': 590,
        'originalPrice': 790,
        'rating': 4.8,
        'image':
            'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400&h=400&fit=crop',
        'brand': 'Nike',
        'isHot': true,
      },
      {
        'name': 'กางเกงยีนส์ขายาว Slim Fit',
        'price': 1290,
        'originalPrice': 1590,
        'rating': 4.6,
        'image':
            'https://images.unsplash.com/photo-1542272604-787c3835535d?w=400&h=400&fit=crop',
        'brand': 'Levi\'s',
        'isHot': false,
      },
      {
        'name': 'เดรสดอกไม้แฟชั่น',
        'price': 890,
        'originalPrice': 1290,
        'rating': 4.9,
        'image':
            'https://images.unsplash.com/photo-1515372039744-b8f02a3ae446?w=400&h=400&fit=crop',
        'brand': 'Zara',
        'isHot': true,
      },
      {
        'name': 'รองเท้าผ้าใบ Running',
        'price': 2190,
        'originalPrice': 2790,
        'rating': 4.7,
        'image':
            'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400&h=400&fit=crop',
        'brand': 'Adidas',
        'isHot': false,
      },
      {
        'name': 'เสื้อเชิ้ตแขนยาว Oxford',
        'price': 990,
        'originalPrice': 1390,
        'rating': 4.5,
        'image':
            'https://images.unsplash.com/photo-1596755094514-f87e34085b2c?w=400&h=400&fit=crop',
        'brand': 'Uniqlo',
        'isHot': false,
      },
      {
        'name': 'กระโปรงทรงเอ สีพาสเทล',
        'price': 690,
        'originalPrice': 990,
        'rating': 4.8,
        'image':
            'https://images.unsplash.com/photo-1583496661160-fb5886a13804?w=400&h=400&fit=crop',
        'brand': 'H&M',
        'isHot': true,
      },
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'สินค้ายอดนิยม',
                style: GoogleFonts.kanit(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                'ดูทั้งหมด',
                style: GoogleFonts.kanit(
                  fontSize: 14,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: popularProducts.length,
            itemBuilder: (context, index) {
              final product = popularProducts[index];
              return GestureDetector(
                onTap: () {
                  // Navigate to product detail
                },
                child: Container(
                  width: 180,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 160,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12),
                              ),
                              child: Image.network(
                                product['image'] as String,
                                width: double.infinity,
                                height: 160,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: double.infinity,
                                    height: 160,
                                    color: Colors.grey[200],
                                    child: const Icon(
                                      Icons.image,
                                      size: 40,
                                      color: Colors.grey,
                                    ),
                                  );
                                },
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Container(
                                        width: double.infinity,
                                        height: 160,
                                        color: Colors.grey[200],
                                        child: const Center(
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                          ),
                                        ),
                                      );
                                    },
                              ),
                            ),
                          ),
                          if (product['isHot'] as bool) ...[
                            Positioned(
                              top: 8,
                              left: 8,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.error,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  'HOT',
                                  style: GoogleFonts.kanit(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.favorite_border,
                                size: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product['brand'] as String,
                                style: GoogleFonts.kanit(
                                  fontSize: 10,
                                  color: AppColors.textLight,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                product['name'] as String,
                                style: GoogleFonts.kanit(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textPrimary,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 12,
                                    color: AppColors.orange,
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    (product['rating'] as double).toString(),
                                    style: GoogleFonts.kanit(
                                      fontSize: 10,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  if (product['originalPrice'] != null) ...[
                                    Text(
                                      '฿${product['originalPrice']}',
                                      style: GoogleFonts.kanit(
                                        fontSize: 10,
                                        color: AppColors.textLight,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                  ],
                                  Text(
                                    '฿${product['price']}',
                                    style: GoogleFonts.kanit(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'บริการด่วน',
            style: GoogleFonts.kanit(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildQuickActionCard(
                  icon: Icons.flash_on,
                  title: 'Flash Sale',
                  subtitle: 'ลดสูงสุด 70%',
                  color: AppColors.orange,
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildQuickActionCard(
                  icon: Icons.local_shipping,
                  title: 'จัดส่งฟรี',
                  subtitle: 'สั่งซื้อขั้นต่ำ ฿500',
                  color: AppColors.blue,
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildQuickActionCard(
                  icon: Icons.verified,
                  title: 'ของแท้ 100%',
                  subtitle: 'รับประกันคุณภาพ',
                  color: AppColors.success,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: GoogleFonts.kanit(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              subtitle,
              style: GoogleFonts.kanit(
                fontSize: 10,
                color: AppColors.textLight,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFlashSaleSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.flash_on, color: AppColors.orange, size: 24),
                  const SizedBox(width: 8),
                  Text(
                    'Flash Sale',
                    style: GoogleFonts.kanit(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'เหลือ 2:45:30',
                  style: GoogleFonts.kanit(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.orange,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _getFlashSaleProducts().length,
            itemBuilder: (context, index) {
              final product = _getFlashSaleProducts()[index];
              return GestureDetector(
                onTap: () {
                  // Navigate to product detail
                },
                child: Container(
                  width: 140,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 100,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(12),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12),
                              ),
                              child: Image.network(
                                product['image'] as String,
                                width: double.infinity,
                                height: 100,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: double.infinity,
                                    height: 100,
                                    color: Colors.grey[200],
                                    child: const Center(
                                      child: Icon(
                                        Icons.image,
                                        size: 30,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  );
                                },
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Container(
                                        width: double.infinity,
                                        height: 100,
                                        color: Colors.grey[200],
                                        child: const Center(
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                          ),
                                        ),
                                      );
                                    },
                              ),
                            ),
                          ),
                          Positioned(
                            top: 8,
                            left: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.error,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                '-${product['discount']}%',
                                style: GoogleFonts.kanit(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product['name'] as String,
                                style: GoogleFonts.kanit(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textPrimary,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Text(
                                    '฿${product['originalPrice']}',
                                    style: GoogleFonts.kanit(
                                      fontSize: 10,
                                      color: AppColors.textLight,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '฿${product['salePrice']}',
                                    style: GoogleFonts.kanit(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.error,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              // Flash Sale Add to Cart Button
                              GestureDetector(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'เพิ่ม ${product['name']} ลงตะกร้าแล้ว! (Flash Sale)',
                                        style: GoogleFonts.kanit(fontSize: 12),
                                      ),
                                      backgroundColor: AppColors.success,
                                      duration: const Duration(seconds: 2),
                                      action: SnackBarAction(
                                        label: 'ดูตะกร้า',
                                        textColor: Colors.white,
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => const CartScreen(),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 28,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        AppColors.error,
                                        AppColors.error.withOpacity(0.8),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(14),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.error.withOpacity(0.3),
                                        blurRadius: 4,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.flash_on,
                                        size: 14,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        'ซื้อเลย',
                                        style: GoogleFonts.kanit(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPopularBrandsSection() {
    final brands = [
      {
        'name': 'Nike',
        'logo':
            'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400&h=250&fit=crop',
        'brandLogo':
            'https://logos-world.net/wp-content/uploads/2020/04/Nike-Logo.png',
        'description': 'Just Do It',
        'products': '2,500+ สินค้า',
        'bgColor': 0xFF000000,
      },
      {
        'name': 'Adidas',
        'logo':
            'https://images.unsplash.com/photo-1556906781-9a412961c28c?w=400&h=250&fit=crop',
        'brandLogo':
            'https://logos-world.net/wp-content/uploads/2020/04/Adidas-Logo.png',
        'description': 'Impossible is Nothing',
        'products': '1,800+ สินค้า',
        'bgColor': 0xFF000000,
      },
      {
        'name': 'Uniqlo',
        'logo':
            'https://images.unsplash.com/photo-1489987707025-afc232f7ea0f?w=400&h=250&fit=crop',
        'brandLogo':
            'https://logos-world.net/wp-content/uploads/2020/11/Uniqlo-Logo.png',
        'description': 'LifeWear',
        'products': '1,200+ สินค้า',
        'bgColor': 0xFFFF0000,
      },
      {
        'name': 'H&M',
        'logo':
            'https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=400&h=250&fit=crop',
        'brandLogo':
            'https://logos-world.net/wp-content/uploads/2020/04/HM-Logo.png',
        'description': 'Fashion & Quality',
        'products': '3,000+ สินค้า',
        'bgColor': 0xFFFF0000,
      },
      {
        'name': 'Zara',
        'logo':
            'https://images.unsplash.com/photo-1483985988355-763728e1935b?w=400&h=250&fit=crop',
        'brandLogo':
            'https://logos-world.net/wp-content/uploads/2020/04/Zara-Logo.png',
        'description': 'Love Your Curves',
        'products': '2,200+ สินค้า',
        'bgColor': 0xFF000000,
      },
      {
        'name': 'Louis Vuitton',
        'logo':
            'https://images.unsplash.com/photo-1584917865442-de89df76afd3?w=400&h=250&fit=crop',
        'brandLogo':
            'https://logos-world.net/wp-content/uploads/2020/04/Louis-Vuitton-Logo.png',
        'description': 'Luxury Fashion',
        'products': '500+ สินค้า',
        'bgColor': 0xFF8B4513,
      },
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'แบรนด์ยอดนิยม',
                style: GoogleFonts.kanit(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                'ดูทั้งหมด',
                style: GoogleFonts.kanit(
                  fontSize: 14,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Horizontal Card Slider
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: brands.length,
            itemBuilder: (context, index) {
              final brand = brands[index];
              return GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'เปิดหน้า ${brand['name']}',
                        style: GoogleFonts.kanit(),
                      ),
                      backgroundColor: AppColors.primary,
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                child: Container(
                  width: 280,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color(brand['bgColor'] as int).withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      // Background image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          brand['logo'] as String,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(
                                      brand['bgColor'] as int,
                                    ).withOpacity(0.8),
                                    Color(brand['bgColor'] as int),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            );
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      // Gradient overlay
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.4),
                              Colors.transparent,
                              Colors.black.withOpacity(0.8),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),

                      // Content
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Brand name at top
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.95),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                brand['name'] as String,
                                style: GoogleFonts.kanit(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(brand['bgColor'] as int),
                                ),
                              ),
                            ),

                            const Spacer(),

                            // Description and products count at bottom
                            Text(
                              brand['description'] as String,
                              style: GoogleFonts.kanit(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              brand['products'] as String,
                              style: GoogleFonts.kanit(
                                fontSize: 12,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Shop button
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'ดูสินค้า',
                                style: GoogleFonts.kanit(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAllProductsSection() {
    final categories = [
      'เสื้อผ้าผู้ชาย',
      'เสื้อผ้าผู้หญิง',
      'รองเท้า',
      'กระเป๋า',
      'เครื่องประดับ',
    ];

    return Column(
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Icon(
                Icons.inventory_2_outlined,
                color: AppColors.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'สินค้าแนะนำ',
                style: GoogleFonts.kanit(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Build each category with promotion slides
        ...categories.asMap().entries.map((entry) {
          final index = entry.key;
          final category = entry.value;
          final productsInCategory = _getAllProducts()
              .where((product) => product['category'] == category)
              .toList();

          return Column(
            children: [
              // Category Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      category,
                      style: GoogleFonts.kanit(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      'ดูทั้งหมด',
                      style: GoogleFonts.kanit(
                        fontSize: 12,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Products Grid for this category
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: productsInCategory.length,
                  itemBuilder: (context, productIndex) {
                    final product = productsInCategory[productIndex];
                    return GestureDetector(
                      onTap: () {
                        // Navigate to product detail
                      },
                      child: Container(
                        margin: const EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 100,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(12),
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(12),
                                    ),
                                    child: Image.network(
                                      product['image'] as String,
                                      width: double.infinity,
                                      height: 100,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return Container(
                                              width: double.infinity,
                                              height: 100,
                                              color: Colors.grey[200],
                                              child: const Center(
                                                child: Icon(
                                                  Icons.image,
                                                  size: 30,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            );
                                          },
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            }
                                            return Container(
                                              width: double.infinity,
                                              height: 110,
                                              color: Colors.grey[200],
                                              child: const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                      strokeWidth: 2,
                                                    ),
                                              ),
                                            );
                                          },
                                    ),
                                  ),
                                ),

                                // Liked heart icon
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: Container(
                                    width: 28,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.9),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      (product['isLiked'] ?? false) as bool
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      size: 16,
                                      color:
                                          (product['isLiked'] ?? false) as bool
                                          ? AppColors.error
                                          : Colors.grey,
                                    ),
                                  ),
                                ),

                                // Recently viewed badge
                                Positioned(
                                  top: 8,
                                  left: 8,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.primary.withOpacity(0.9),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      'ดูแล้ว',
                                      style: GoogleFonts.kanit(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(6),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Brand
                                    Text(
                                      product['brand'] as String,
                                      style: GoogleFonts.kanit(
                                        fontSize: 9,
                                        color: AppColors.textLight,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 2),

                                    // Product name
                                    Text(
                                      product['name'] as String,
                                      style: GoogleFonts.kanit(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textPrimary,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),

                                    const SizedBox(height: 2),

                                    // Rating
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 8,
                                          color: AppColors.orange,
                                        ),
                                        const SizedBox(width: 2),
                                        Text(
                                          (product['rating'] as double)
                                              .toString(),
                                          style: GoogleFonts.kanit(
                                            fontSize: 7,
                                            color: AppColors.textSecondary,
                                          ),
                                        ),
                                      ],
                                    ),

                                    const Spacer(),

                                    // Price
                                    Row(
                                      children: [
                                        if (product['originalPrice'] !=
                                            null) ...[
                                          Text(
                                            '฿${product['originalPrice']}',
                                            style: GoogleFonts.kanit(
                                              fontSize: 7,
                                              color: AppColors.textLight,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                        ],
                                        Expanded(
                                          child: Text(
                                            '฿${product['price']}',
                                            style: GoogleFonts.kanit(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 4),

                                    // Action Buttons
                                    Row(
                                      children: [
                                        // Quick View Button
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'ดูรายละเอียด ${product['name']}',
                                                    style: GoogleFonts.kanit(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  backgroundColor:
                                                      AppColors.primary,
                                                  duration: const Duration(
                                                    seconds: 1,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              height: 22,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: AppColors.primary
                                                      .withOpacity(0.3),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: AppColors.primary
                                                    .withOpacity(0.1),
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.visibility_outlined,
                                                  size: 12,
                                                  color: AppColors.primary,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        const SizedBox(width: 4),

                                        // Add to Cart Button
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'เพิ่ม ${product['name']} ลงตะกร้าแล้ว!',
                                                    style: GoogleFonts.kanit(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  backgroundColor:
                                                      AppColors.success,
                                                  duration: const Duration(
                                                    seconds: 2,
                                                  ),
                                                  action: SnackBarAction(
                                                    label: 'ดูตะกร้า',
                                                    textColor: Colors.white,
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              const CartScreen(),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              height: 22,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    AppColors.primary,
                                                    AppColors.primary
                                                        .withOpacity(0.8),
                                                  ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: AppColors.primary
                                                        .withOpacity(0.3),
                                                    blurRadius: 3,
                                                    offset: const Offset(0, 1),
                                                  ),
                                                ],
                                              ),
                                              child: const Center(
                                                child: Icon(
                                                  Icons.add_shopping_cart,
                                                  size: 12,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Promotion slide between categories (except last)
              if (index < categories.length - 1) _buildPromotionSlide(index),

              const SizedBox(height: 20),
            ],
          );
        }),
      ],
    );
  }

  Widget _buildPromotionSlide(int index) {
    final promotions = [
      {
        'title': 'Sale 50% Off',
        'subtitle': 'เสื้อผ้าแฟชั่น',
        'image':
            'https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=800&h=300&fit=crop',
        'color': Colors.orange,
      },
      {
        'title': 'New Arrivals',
        'subtitle': 'รองเท้าใหม่ล่าสุด',
        'image':
            'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=800&h=300&fit=crop',
        'color': Colors.blue,
      },
      {
        'title': 'Premium Collection',
        'subtitle': 'กระเป๋าหรู',
        'image':
            'https://images.unsplash.com/photo-1584382296087-ac00c7263710?w=800&h=300&fit=crop',
        'color': Colors.purple,
      },
      {
        'title': 'Special Offer',
        'subtitle': 'เครื่องประดับ',
        'image':
            'https://images.unsplash.com/photo-1515562141207-7a88fb7ce338?w=800&h=300&fit=crop',
        'color': Colors.green,
      },
    ];

    final promotion = promotions[index % promotions.length];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            (promotion['color'] as Color).withOpacity(0.8),
            (promotion['color'] as Color).withOpacity(0.6),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                promotion['image'] as String,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(color: promotion['color'] as Color);
                },
              ),
            ),
          ),
          // Gradient overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.3), Colors.transparent],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ),
          // Content
          Positioned(
            left: 16,
            top: 12,
            bottom: 12,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  promotion['title'] as String,
                  style: GoogleFonts.kanit(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  promotion['subtitle'] as String,
                  style: GoogleFonts.kanit(
                    fontSize: 10,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'ดูเพิ่มเติม',
                    style: GoogleFonts.kanit(
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                      color: promotion['color'] as Color,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _getFlashSaleProducts() {
    return [
      {
        'name': 'เสื้อยืดโอเวอร์ไซส์',
        'originalPrice': 399,
        'salePrice': 199,
        'discount': 50,
        'image':
            'https://images.unsplash.com/photo-1576566588028-4147f3842f27?w=400&h=400&fit=crop',
      },
      {
        'name': 'เดรสลายดอก',
        'originalPrice': 899,
        'salePrice': 449,
        'discount': 50,
        'image':
            'https://images.unsplash.com/photo-1595777457583-95e059d581b8?w=400&h=400&fit=crop',
      },
      {
        'name': 'กางเกงขาสั้น',
        'originalPrice': 599,
        'salePrice': 359,
        'discount': 40,
        'image':
            'https://images.unsplash.com/photo-1473966968600-fa801b869a1a?w=400&h=400&fit=crop',
      },
      {
        'name': 'เสื้อเชิ้ตลินิน',
        'originalPrice': 799,
        'salePrice': 399,
        'discount': 50,
        'image':
            'https://images.unsplash.com/photo-1571945153237-4929e783af4a?w=400&h=400&fit=crop',
      },
      {
        'name': 'กระโปรงมินิ',
        'originalPrice': 699,
        'salePrice': 419,
        'discount': 40,
        'image':
            'https://images.unsplash.com/photo-1583496661160-fb5886a13804?w=400&h=400&fit=crop',
      },
      {
        'name': 'เสื้อฮู้ดดี้',
        'originalPrice': 999,
        'salePrice': 599,
        'discount': 40,
        'image':
            'https://images.unsplash.com/photo-1556821840-3a9c6fdb5671?w=400&h=400&fit=crop',
      },
    ];
  }

  List<Map<String, dynamic>> _getAllProducts() {
    return [
      // Men's Clothing
      {
        'id': 1,
        'name': 'เสื้อยืด Premium Cotton',
        'price': 890,
        'originalPrice': 1290,
        'brand': 'Nike',
        'category': 'เสื้อผ้าผู้ชาย',
        'image':
            'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400&h=400&fit=crop',
        'rating': 4.5,
        'reviews': 234,
        'discount': 31,
        'isBestSeller': true,
        'isNew': false,
        'isLiked': false,
      },
      {
        'id': 2,
        'name': 'เสื้อโปโลคลาสสิก',
        'price': 1190,
        'originalPrice': 1590,
        'brand': 'Ralph Lauren',
        'category': 'เสื้อผ้าผู้ชาย',
        'image':
            'https://images.unsplash.com/photo-1586790170083-2f9ceadc732d?w=400&h=400&fit=crop',
        'rating': 4.7,
        'reviews': 156,
        'discount': 25,
        'isBestSeller': false,
        'isNew': true,
        'isLiked': true,
      },
      {
        'id': 3,
        'name': 'เสื้อเชิ้ตออกซ์ฟอร์ด',
        'price': 1690,
        'originalPrice': 2200,
        'brand': 'Uniqlo',
        'category': 'เสื้อผ้าผู้ชาย',
        'image':
            'https://images.unsplash.com/photo-1596755094514-f87e34085b2c?w=400&h=400&fit=crop',
        'rating': 4.6,
        'reviews': 89,
        'discount': 23,
        'isBestSeller': false,
        'isNew': false,
      },
      {
        'id': 4,
        'name': 'กางเกงยีนส์ Slim Fit',
        'price': 2490,
        'originalPrice': 3200,
        'brand': "Levi's",
        'category': 'เสื้อผ้าผู้ชาย',
        'image':
            'https://images.unsplash.com/photo-1542272604-787c3835535d?w=400&h=400&fit=crop',
        'rating': 4.8,
        'reviews': 456,
        'discount': 22,
        'isBestSeller': true,
        'isNew': false,
      },
      {
        'id': 5,
        'name': 'เสื้อฮู้ดดี้ Oversize',
        'price': 2190,
        'originalPrice': 2890,
        'brand': 'Champion',
        'category': 'เสื้อผ้าผู้ชาย',
        'image':
            'https://images.unsplash.com/photo-1556821840-3a9c6fdb5671?w=400&h=400&fit=crop',
        'rating': 4.6,
        'reviews': 298,
        'discount': 24,
        'isBestSeller': false,
        'isNew': true,
        'isLiked': false,
      },
      {
        'id': 21,
        'name': 'เสื้อแจ็คเก็ตหนัง',
        'price': 3890,
        'originalPrice': 4990,
        'brand': 'Zara Man',
        'category': 'เสื้อผ้าผู้ชาย',
        'image':
            'https://images.unsplash.com/photo-1520975954732-35dd22299614?w=400&h=400&fit=crop',
        'rating': 4.4,
        'reviews': 167,
        'discount': 22,
        'isBestSeller': false,
        'isNew': true,
        'isLiked': true,
      },
      {
        'id': 22,
        'name': 'เสื้อสเวตเตอร์ไหมพรม',
        'price': 1690,
        'originalPrice': 2200,
        'brand': 'Uniqlo',
        'category': 'เสื้อผ้าผู้ชาย',
        'image':
            'https://images.unsplash.com/photo-1434389677669-e08b4cac3105?w=400&h=400&fit=crop',
        'rating': 4.3,
        'reviews': 189,
        'discount': 23,
        'isBestSeller': false,
        'isNew': false,
        'isLiked': false,
      },
      {
        'id': 23,
        'name': 'กางเกงขาสั้น Cargo',
        'price': 1290,
        'originalPrice': 1690,
        'brand': 'Pull & Bear',
        'category': 'เสื้อผ้าผู้ชาย',
        'image':
            'https://images.unsplash.com/photo-1473966968600-fa801b869a1a?w=400&h=400&fit=crop',
        'rating': 4.1,
        'reviews': 234,
        'discount': 24,
        'isBestSeller': true,
        'isNew': false,
        'isLiked': true,
      },
      {
        'id': 24,
        'name': 'เสื้อแทงก์ท็อป',
        'price': 590,
        'originalPrice': 790,
        'brand': 'H&M',
        'category': 'เสื้อผ้าผู้ชาย',
        'image':
            'https://images.unsplash.com/photo-1618354691373-d851c5c3a990?w=400&h=400&fit=crop',
        'rating': 4.0,
        'reviews': 145,
        'discount': 25,
        'isBestSeller': false,
        'isNew': false,
        'isLiked': false,
      },

      // Women's Clothing
      {
        'id': 6,
        'name': 'เดรสลายดอกไม้',
        'price': 1890,
        'originalPrice': 2490,
        'brand': 'Zara',
        'category': 'เสื้อผ้าผู้หญิง',
        'image':
            'https://images.unsplash.com/photo-1595777457583-95e059d581b8?w=400&h=400&fit=crop',
        'rating': 4.9,
        'reviews': 312,
        'discount': 24,
        'isBestSeller': true,
        'isNew': true,
      },
      {
        'id': 7,
        'name': 'เสื้อบลาวส์ไหม',
        'price': 2290,
        'originalPrice': 2990,
        'brand': 'H&M',
        'category': 'เสื้อผ้าผู้หญิง',
        'image':
            'https://images.unsplash.com/photo-1434389677669-e08b4cac3105?w=400&h=400&fit=crop',
        'rating': 4.4,
        'reviews': 198,
        'discount': 23,
        'isBestSeller': false,
        'isNew': false,
      },
      {
        'id': 8,
        'name': 'กระโปรงพลีท',
        'price': 1490,
        'originalPrice': 1990,
        'brand': 'COS',
        'category': 'เสื้อผ้าผู้หญิง',
        'image':
            'https://images.unsplash.com/photo-1583496661160-fb5886a13804?w=400&h=400&fit=crop',
        'rating': 4.3,
        'reviews': 76,
        'discount': 25,
        'isBestSeller': false,
        'isNew': true,
      },
      {
        'id': 9,
        'name': 'เสื้อแจ็คเก็ตยีนส์',
        'price': 1690,
        'originalPrice': 2200,
        'brand': "Levi's",
        'category': 'เสื้อผ้าผู้หญิง',
        'image':
            'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=400&h=400&fit=crop',
        'rating': 4.5,
        'reviews': 145,
        'discount': 23,
        'isBestSeller': false,
        'isNew': false,
        'isLiked': true,
      },
      {
        'id': 25,
        'name': 'เดรสคอเต่าไหมพรม',
        'price': 2290,
        'originalPrice': 2990,
        'brand': 'COS',
        'category': 'เสื้อผ้าผู้หญิง',
        'image':
            'https://images.unsplash.com/photo-1515372039744-b8f02a3ae446?w=400&h=400&fit=crop',
        'rating': 4.7,
        'reviews': 189,
        'discount': 23,
        'isBestSeller': true,
        'isNew': true,
        'isLiked': false,
      },
      {
        'id': 26,
        'name': 'เสื้อเชิ้ตลายทาง',
        'price': 1490,
        'originalPrice': 1990,
        'brand': 'Mango',
        'category': 'เสื้อผ้าผู้หญิง',
        'image':
            'https://images.unsplash.com/photo-1544441893-675973e31985?w=400&h=400&fit=crop',
        'rating': 4.2,
        'reviews': 267,
        'discount': 25,
        'isBestSeller': false,
        'isNew': false,
        'isLiked': true,
      },
      {
        'id': 27,
        'name': 'กางเกงขายาว Wide Leg',
        'price': 1890,
        'originalPrice': 2390,
        'brand': 'Zara',
        'category': 'เสื้อผ้าผู้หญิง',
        'image':
            'https://images.unsplash.com/photo-1594633312681-425c7b97ccd1?w=400&h=400&fit=crop',
        'rating': 4.6,
        'reviews': 134,
        'discount': 21,
        'isBestSeller': false,
        'isNew': true,
        'isLiked': false,
      },
      {
        'id': 28,
        'name': 'เสื้อคาร์ดิแกน',
        'price': 1990,
        'originalPrice': 2590,
        'brand': 'Uniqlo',
        'category': 'เสื้อผ้าผู้หญิง',
        'image':
            'https://images.unsplash.com/photo-1539008835657-9e8e9680c956?w=400&h=400&fit=crop',
        'rating': 4.4,
        'reviews': 156,
        'discount': 23,
        'isBestSeller': true,
        'isNew': false,
        'isLiked': true,
      },
      {
        'id': 29,
        'name': 'เดรสแขนยาวลูกไม้',
        'price': 2690,
        'originalPrice': 3490,
        'brand': 'Anthropologie',
        'category': 'เสื้อผ้าผู้หญิง',
        'image':
            'https://images.unsplash.com/photo-1469334031218-e382a71b716b?w=400&h=400&fit=crop',
        'rating': 4.8,
        'reviews': 89,
        'discount': 23,
        'isBestSeller': false,
        'isNew': true,
        'isLiked': false,
      },

      // Shoes
      {
        'id': 10,
        'name': 'รองเท้าผ้าใบ Air Max',
        'price': 4590,
        'originalPrice': 5990,
        'brand': 'Nike',
        'category': 'รองเท้า',
        'image':
            'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400&h=400&fit=crop',
        'rating': 4.8,
        'reviews': 523,
        'discount': 23,
        'isBestSeller': true,
        'isNew': false,
      },
      {
        'id': 11,
        'name': 'รองเท้าบูทหนัง',
        'price': 6990,
        'originalPrice': 8500,
        'brand': 'Dr. Martens',
        'category': 'รองเท้า',
        'image':
            'https://images.unsplash.com/photo-1449824913935-59a10b8d2000?w=400&h=400&fit=crop',
        'rating': 4.7,
        'reviews': 287,
        'discount': 18,
        'isBestSeller': false,
        'isNew': true,
      },
      {
        'id': 12,
        'name': 'รองเท้าส้นสูง',
        'price': 3290,
        'originalPrice': 4200,
        'brand': 'Christian Louboutin',
        'category': 'รองเท้า',
        'image':
            'https://images.unsplash.com/photo-1543163521-1bf539c55dd2?w=400&h=400&fit=crop',
        'rating': 4.9,
        'reviews': 167,
        'discount': 22,
        'isBestSeller': true,
        'isNew': false,
      },
      {
        'id': 13,
        'name': 'รองเท้าแตะ Slide',
        'price': 1590,
        'originalPrice': 2200,
        'brand': 'Adidas',
        'category': 'รองเท้า',
        'image':
            'https://images.unsplash.com/photo-1506629905607-d7d72308c9c6?w=400&h=400&fit=crop',
        'rating': 4.2,
        'reviews': 89,
        'discount': 28,
        'isBestSeller': false,
        'isNew': false,
        'isLiked': false,
      },
      {
        'id': 30,
        'name': 'รองเท้าผ้าใบ All Star',
        'price': 2890,
        'originalPrice': 3590,
        'brand': 'Converse',
        'category': 'รองเท้า',
        'image':
            'https://images.unsplash.com/photo-1551107696-a4b0c5a0d9a2?w=400&h=400&fit=crop',
        'rating': 4.6,
        'reviews': 456,
        'discount': 19,
        'isBestSeller': true,
        'isNew': false,
        'isLiked': true,
      },
      {
        'id': 31,
        'name': 'รองเท้าคัชชู Oxford',
        'price': 4990,
        'originalPrice': 6290,
        'brand': 'Cole Haan',
        'category': 'รองเท้า',
        'image':
            'https://images.unsplash.com/photo-1582897085656-c636d006a246?w=400&h=400&fit=crop',
        'rating': 4.8,
        'reviews': 234,
        'discount': 21,
        'isBestSeller': false,
        'isNew': true,
        'isLiked': false,
      },
      {
        'id': 32,
        'name': 'รองเท้าผ้าใบ Running',
        'price': 3690,
        'originalPrice': 4590,
        'brand': 'New Balance',
        'category': 'รองเท้า',
        'image':
            'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?w=400&h=400&fit=crop',
        'rating': 4.7,
        'reviews': 189,
        'discount': 20,
        'isBestSeller': true,
        'isNew': false,
        'isLiked': true,
      },
      {
        'id': 33,
        'name': 'รองเท้าลำลอง Loafers',
        'price': 5490,
        'originalPrice': 6990,
        'brand': 'Gucci',
        'category': 'รองเท้า',
        'image':
            'https://images.unsplash.com/photo-1560769629-975ec94e6a86?w=400&h=400&fit=crop',
        'rating': 4.9,
        'reviews': 78,
        'discount': 21,
        'isBestSeller': false,
        'isNew': true,
        'isLiked': false,
      },
      {
        'id': 34,
        'name': 'รองเท้าส้นเตี้ย Ballet',
        'price': 2290,
        'originalPrice': 2890,
        'brand': 'Tory Burch',
        'category': 'รองเท้า',
        'image':
            'https://images.unsplash.com/photo-1543163521-1bf539c55dd2?w=400&h=400&fit=crop',
        'rating': 4.5,
        'reviews': 167,
        'discount': 21,
        'isBestSeller': false,
        'isNew': false,
        'isLiked': true,
      },

      // Bags
      {
        'id': 14,
        'name': 'กระเป๋าถือหนังแท้',
        'price': 8990,
        'originalPrice': 12900,
        'brand': 'Coach',
        'category': 'กระเป๋า',
        'image':
            'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400&h=400&fit=crop',
        'rating': 4.8,
        'reviews': 145,
        'discount': 30,
        'isBestSeller': true,
        'isNew': false,
      },
      {
        'id': 15,
        'name': 'กระเป๋าเป้สะพายหลัง',
        'price': 2590,
        'originalPrice': 3490,
        'brand': 'Herschel',
        'category': 'กระเป๋า',
        'image':
            'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400&h=400&fit=crop',
        'rating': 4.5,
        'reviews': 298,
        'discount': 26,
        'isBestSeller': false,
        'isNew': true,
      },
      {
        'id': 16,
        'name': 'กระเป๋าผ้าแคนวาส',
        'price': 890,
        'originalPrice': 1290,
        'brand': 'MUJI',
        'category': 'กระเป๋า',
        'image':
            'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400&h=400&fit=crop',
        'rating': 4.3,
        'reviews': 178,
        'discount': 31,
        'isBestSeller': false,
        'isNew': false,
        'isLiked': false,
      },
      {
        'id': 35,
        'name': 'กระเป๋าถือ Crossbody',
        'price': 3490,
        'originalPrice': 4290,
        'brand': 'Michael Kors',
        'category': 'กระเป๋า',
        'image':
            'https://images.unsplash.com/photo-1584382296087-ac00c7263710?w=400&h=400&fit=crop',
        'rating': 4.6,
        'reviews': 234,
        'discount': 19,
        'isBestSeller': true,
        'isNew': false,
        'isLiked': true,
      },
      {
        'id': 36,
        'name': 'กระเป๋าสะพายเดินทาง',
        'price': 4990,
        'originalPrice': 6490,
        'brand': 'Samsonite',
        'category': 'กระเป๋า',
        'image':
            'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400&h=400&fit=crop&sig=2',
        'rating': 4.8,
        'reviews': 145,
        'discount': 23,
        'isBestSeller': false,
        'isNew': true,
        'isLiked': false,
      },
      {
        'id': 37,
        'name': 'กระเป๋าคลัทช์หนังแท้',
        'price': 6990,
        'originalPrice': 8990,
        'brand': 'YSL',
        'category': 'กระเป๋า',
        'image':
            'https://images.unsplash.com/photo-1548036328-c9fa89d128fa?w=400&h=400&fit=crop',
        'rating': 4.9,
        'reviews': 89,
        'discount': 22,
        'isBestSeller': false,
        'isNew': true,
        'isLiked': true,
      },
      {
        'id': 38,
        'name': 'กระเป๋าเป้ Minimalist',
        'price': 1990,
        'originalPrice': 2590,
        'brand': 'Fjällräven',
        'category': 'กระเป๋า',
        'image':
            'https://images.unsplash.com/photo-1496127411131-e709818b3de1?w=400&h=400&fit=crop',
        'rating': 4.4,
        'reviews': 267,
        'discount': 23,
        'isBestSeller': true,
        'isNew': false,
        'isLiked': false,
      },

      // Accessories
      {
        'id': 17,
        'name': 'แว่นกันแดด Ray-Ban',
        'price': 5990,
        'originalPrice': 7500,
        'brand': 'Ray-Ban',
        'category': 'เครื่องประดับ',
        'image':
            'https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=400&h=400&fit=crop',
        'rating': 4.9,
        'reviews': 412,
        'discount': 20,
        'isBestSeller': true,
        'isNew': false,
      },
      {
        'id': 18,
        'name': 'นาฬิกาข้อมือ',
        'price': 12990,
        'originalPrice': 15990,
        'brand': 'Seiko',
        'category': 'เครื่องประดับ',
        'image':
            'https://images.unsplash.com/photo-1524592094714-0f0654e20314?w=400&h=400&fit=crop',
        'rating': 4.7,
        'reviews': 189,
        'discount': 19,
        'isBestSeller': false,
        'isNew': true,
      },
      {
        'id': 19,
        'name': 'หมวกแก็ป Supreme',
        'price': 1590,
        'originalPrice': 2200,
        'brand': 'Supreme',
        'category': 'เครื่องประดับ',
        'image':
            'https://images.unsplash.com/photo-1588850561407-ed78c282e89b?w=400&h=400&fit=crop',
        'rating': 4.4,
        'reviews': 267,
        'discount': 28,
        'isBestSeller': false,
        'isNew': false,
      },
      {
        'id': 20,
        'name': 'เข็มขัดหนังแท้',
        'price': 2890,
        'originalPrice': 3800,
        'brand': 'Hermès',
        'category': 'เครื่องประดับ',
        'image':
            'https://images.unsplash.com/photo-1594633312681-425c7b97ccd1?w=400&h=400&fit=crop',
        'rating': 4.8,
        'reviews': 134,
        'discount': 24,
        'isBestSeller': true,
        'isNew': false,
        'isLiked': false,
      },
      {
        'id': 39,
        'name': 'สร้อยคอทองคำ',
        'price': 15990,
        'originalPrice': 19990,
        'brand': 'Tiffany & Co.',
        'category': 'เครื่องประดับ',
        'image':
            'https://images.unsplash.com/photo-1515562141207-7a88fb7ce338?w=400&h=400&fit=crop',
        'rating': 4.9,
        'reviews': 67,
        'discount': 20,
        'isBestSeller': false,
        'isNew': true,
        'isLiked': true,
      },
      {
        'id': 40,
        'name': 'แหวนเพชร Solitaire',
        'price': 89990,
        'originalPrice': 109990,
        'brand': 'Cartier',
        'category': 'เครื่องประดับ',
        'image':
            'https://images.unsplash.com/photo-1605100804763-247f67b3557e?w=400&h=400&fit=crop',
        'rating': 5.0,
        'reviews': 23,
        'discount': 18,
        'isBestSeller': true,
        'isNew': false,
        'isLiked': false,
      },
      {
        'id': 41,
        'name': 'ต่างหูมุกทอง',
        'price': 12990,
        'originalPrice': 16990,
        'brand': 'Mikimoto',
        'category': 'เครื่องประดับ',
        'image':
            'https://images.unsplash.com/photo-1506629905607-d7d72308c9c6?w=400&h=400&fit=crop&sig=3',
        'rating': 4.7,
        'reviews': 89,
        'discount': 24,
        'isBestSeller': false,
        'isNew': true,
        'isLiked': true,
      },
      {
        'id': 42,
        'name': 'กำไลเงินแท้',
        'price': 3990,
        'originalPrice': 4990,
        'brand': 'Pandora',
        'category': 'เครื่องประดับ',
        'image':
            'https://images.unsplash.com/photo-1611652022419-a9419f74343d?w=400&h=400&fit=crop',
        'rating': 4.5,
        'reviews': 156,
        'discount': 20,
        'isBestSeller': true,
        'isNew': false,
        'isLiked': false,
      },
      {
        'id': 43,
        'name': 'นาฬิกาสมาร์ทวอทช์',
        'price': 8990,
        'originalPrice': 11990,
        'brand': 'Apple',
        'category': 'เครื่องประดับ',
        'image':
            'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400&h=400&fit=crop',
        'rating': 4.8,
        'reviews': 456,
        'discount': 25,
        'isBestSeller': true,
        'isNew': true,
        'isLiked': true,
      },
    ];
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
