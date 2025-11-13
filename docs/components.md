# 🧩 Component Guide - Fashion Shop

## 📖 Table of Contents
- [1. Overview](#1-overview)
- [2. Design System](#2-design-system)
- [3. Layout Components](#3-layout-components)
- [4. UI Components](#4-ui-components)
- [5. Product Components](#5-product-components)
- [6. Form Components](#6-form-components)
- [7. Navigation Components](#7-navigation-components)
- [8. Utility Components](#8-utility-components)
- [9. Usage Examples](#9-usage-examples)
- [10. Best Practices](#10-best-practices)

---

## 1. Overview

### Component Architecture
แอป Fashion Shop ใช้ Widget-based architecture ของ Flutter โดยแบ่งเป็น components ต่างๆ ที่สามารถนำกลับมาใช้ได้ (Reusable Components)

### Component Categories
- **Layout Components** - จัดการโครงสร้างหน้า
- **UI Components** - Elements พื้นฐาน (Button, Card, etc.)
- **Product Components** - เฉพาะสินค้า (ProductCard, ProductGrid)
- **Form Components** - Input และ Form elements
- **Navigation Components** - การนำทาง
- **Utility Components** - Helper widgets

---

## 2. Design System

### 2.1 Color System
```dart
// lib/constants/colors.dart
class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF2196F3);
  static const Color primaryDark = Color(0xFF1976D2);
  static const Color primaryLight = Color(0xFFBBDEFB);
  
  // Secondary Colors
  static const Color secondary = Color(0xFF03DAC6);
  static const Color accent = Color(0xFFFF5722);
  
  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);
  
  // Neutral Colors
  static const Color background = Color(0xFFF5F5F5);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textLight = Color(0xFFBDBDBD);
  static const Color divider = Color(0xFFE0E0E0);
  
  // Brand Colors
  static const Color blue = Color(0xFF2196F3);
  static const Color orange = Color(0xFFFF9800);
  static const Color pink = Color(0xFFE91E63);
  static const Color purple = Color(0xFF9C27B0);
}
```

### 2.2 Typography System
```dart
// lib/constants/text_styles.dart
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // Display Text
  static TextStyle get displayLarge => GoogleFonts.kanit(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
  
  static TextStyle get displayMedium => GoogleFonts.kanit(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
  
  static TextStyle get displaySmall => GoogleFonts.kanit(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
  
  // Headlines
  static TextStyle get headlineLarge => GoogleFonts.kanit(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
  
  static TextStyle get headlineMedium => GoogleFonts.kanit(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
  
  // Body Text
  static TextStyle get bodyLarge => GoogleFonts.kanit(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );
  
  static TextStyle get bodyMedium => GoogleFonts.kanit(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );
  
  static TextStyle get bodySmall => GoogleFonts.kanit(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );
  
  // Labels
  static TextStyle get labelLarge => GoogleFonts.kanit(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
  
  static TextStyle get labelMedium => GoogleFonts.kanit(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
  
  static TextStyle get labelSmall => GoogleFonts.kanit(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: AppColors.textSecondary,
  );
}
```

### 2.3 Spacing System
```dart
// lib/constants/spacing.dart
class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
  
  // Specific Use Cases
  static const double cardPadding = 16.0;
  static const double screenPadding = 16.0;
  static const double buttonHeight = 48.0;
  static const double inputHeight = 56.0;
}
```

---

## 3. Layout Components

### 3.1 Screen Wrapper
```dart
// lib/widgets/layout/screen_wrapper.dart
class ScreenWrapper extends StatelessWidget {
  final Widget child;
  final String? title;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final Color? backgroundColor;
  final bool showAppBar;
  final bool resizeToAvoidBottomInset;
  
  const ScreenWrapper({
    super.key,
    required this.child,
    this.title,
    this.actions,
    this.floatingActionButton,
    this.backgroundColor,
    this.showAppBar = true,
    this.resizeToAvoidBottomInset = true,
  });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar ? AppBar(
        title: title != null ? Text(title!) : null,
        actions: actions,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: AppTextStyles.headlineLarge,
      ) : null,
      body: SafeArea(child: child),
      floatingActionButton: floatingActionButton,
      backgroundColor: backgroundColor ?? AppColors.background,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    );
  }
}
```

### 3.2 Section Header
```dart
// lib/widgets/layout/section_header.dart
class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? actionText;
  final VoidCallback? onActionTap;
  final Widget? icon;
  final EdgeInsets? padding;
  
  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.actionText,
    this.onActionTap,
    this.icon,
    this.padding,
  });
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Row(
        children: [
          if (icon != null) ...[
            icon!,
            const SizedBox(width: AppSpacing.sm),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.headlineLarge),
                if (subtitle != null)
                  Text(subtitle!, style: AppTextStyles.bodySmall),
              ],
            ),
          ),
          if (actionText != null && onActionTap != null)
            GestureDetector(
              onTap: onActionTap,
              child: Text(
                actionText!,
                style: AppTextStyles.labelMedium.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
```

### 3.3 Loading Wrapper
```dart
// lib/widgets/layout/loading_wrapper.dart
class LoadingWrapper extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final String? loadingText;
  
  const LoadingWrapper({
    super.key,
    required this.isLoading,
    required this.child,
    this.loadingText,
  });
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: Colors.black.withOpacity(0.3),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                  ),
                  if (loadingText != null) ...[
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      loadingText!,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
      ],
    );
  }
}
```

---

## 4. UI Components

### 4.1 Custom Button
```dart
// lib/widgets/ui/custom_button.dart
enum ButtonVariant { primary, secondary, outline, text, danger }
enum ButtonSize { small, medium, large }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final ButtonSize size;
  final Widget? icon;
  final bool isLoading;
  final bool isFullWidth;
  
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = ButtonVariant.primary,
    this.size = ButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.isFullWidth = false,
  });
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      height: _getHeight(),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: _getButtonStyle(),
        child: isLoading
            ? _buildLoadingContent()
            : _buildContent(),
      ),
    );
  }
  
  double _getHeight() {
    switch (size) {
      case ButtonSize.small:
        return 32;
      case ButtonSize.medium:
        return 48;
      case ButtonSize.large:
        return 56;
    }
  }
  
  ButtonStyle _getButtonStyle() {
    switch (variant) {
      case ButtonVariant.primary:
        return ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        );
      case ButtonVariant.secondary:
        return ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondary,
          foregroundColor: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        );
      case ButtonVariant.outline:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.primary,
          elevation: 0,
          side: BorderSide(color: AppColors.primary, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        );
      case ButtonVariant.text:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.primary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        );
      case ButtonVariant.danger:
        return ElevatedButton.styleFrom(
          backgroundColor: AppColors.error,
          foregroundColor: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        );
    }
  }
  
  Widget _buildContent() {
    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon!,
          const SizedBox(width: AppSpacing.sm),
          Text(text, style: _getTextStyle()),
        ],
      );
    }
    return Text(text, style: _getTextStyle());
  }
  
  Widget _buildLoadingContent() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Text('กำลังโหลด...', style: _getTextStyle()),
      ],
    );
  }
  
  TextStyle _getTextStyle() {
    switch (size) {
      case ButtonSize.small:
        return AppTextStyles.labelSmall;
      case ButtonSize.medium:
        return AppTextStyles.labelMedium;
      case ButtonSize.large:
        return AppTextStyles.labelLarge;
    }
  }
}
```

### 4.2 Custom Card
```dart
// lib/widgets/ui/custom_card.dart
class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final double? elevation;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  
  const CustomCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.elevation,
    this.borderRadius,
    this.onTap,
  });
  
  @override
  Widget build(BuildContext context) {
    Widget card = Container(
      padding: padding ?? const EdgeInsets.all(AppSpacing.md),
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.surface,
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: elevation ?? 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
    
    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: card,
      );
    }
    
    return card;
  }
}
```

### 4.3 Badge Component
```dart
// lib/widgets/ui/badge.dart
enum BadgeVariant { primary, secondary, success, error, warning, info }

class Badge extends StatelessWidget {
  final String text;
  final BadgeVariant variant;
  final bool isSmall;
  
  const Badge({
    super.key,
    required this.text,
    this.variant = BadgeVariant.primary,
    this.isSmall = false,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? 6 : 8,
        vertical: isSmall ? 2 : 4,
      ),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(isSmall ? 8 : 12),
      ),
      child: Text(
        text,
        style: (isSmall ? AppTextStyles.labelSmall : AppTextStyles.labelMedium)
            .copyWith(color: _getTextColor()),
      ),
    );
  }
  
  Color _getBackgroundColor() {
    switch (variant) {
      case BadgeVariant.primary:
        return AppColors.primary;
      case BadgeVariant.secondary:
        return AppColors.secondary;
      case BadgeVariant.success:
        return AppColors.success;
      case BadgeVariant.error:
        return AppColors.error;
      case BadgeVariant.warning:
        return AppColors.warning;
      case BadgeVariant.info:
        return AppColors.info;
    }
  }
  
  Color _getTextColor() {
    switch (variant) {
      case BadgeVariant.warning:
        return AppColors.textPrimary;
      default:
        return Colors.white;
    }
  }
}
```

---

## 5. Product Components

### 5.1 Product Card
```dart
// lib/widgets/product/product_card.dart
class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;
  final VoidCallback? onAddToCart;
  final VoidCallback? onToggleWishlist;
  final bool showQuickActions;
  final ProductCardSize size;
  
  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
    this.onAddToCart,
    this.onToggleWishlist,
    this.showQuickActions = true,
    this.size = ProductCardSize.medium,
  });
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomCard(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductImage(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBrandName(),
                    const SizedBox(height: 2),
                    _buildProductName(),
                    const SizedBox(height: 4),
                    _buildRating(),
                    const Spacer(),
                    _buildPricing(),
                    if (showQuickActions) ...[
                      const SizedBox(height: AppSpacing.sm),
                      _buildQuickActions(),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildProductImage() {
    return Stack(
      children: [
        Container(
          height: _getImageHeight(),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              product.image,
              width: double.infinity,
              height: _getImageHeight(),
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return _buildImagePlaceholder();
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return _buildImageLoading();
              },
            ),
          ),
        ),
        _buildImageBadges(),
        _buildWishlistButton(),
      ],
    );
  }
  
  Widget _buildImageBadges() {
    return Positioned(
      top: AppSpacing.sm,
      left: AppSpacing.sm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (product.discount != null && product.discount! > 0)
            Badge(
              text: '-${product.discount}%',
              variant: BadgeVariant.error,
              isSmall: true,
            ),
          if (product.isNew ?? false) ...[
            const SizedBox(height: 4),
            Badge(
              text: 'ใหม่',
              variant: BadgeVariant.success,
              isSmall: true,
            ),
          ],
          if (product.isBestSeller ?? false) ...[
            const SizedBox(height: 4),
            Badge(
              text: 'ขายดี',
              variant: BadgeVariant.warning,
              isSmall: true,
            ),
          ],
        ],
      ),
    );
  }
  
  Widget _buildWishlistButton() {
    return Positioned(
      top: AppSpacing.sm,
      right: AppSpacing.sm,
      child: GestureDetector(
        onTap: onToggleWishlist,
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            (product.isLiked ?? false) ? Icons.favorite : Icons.favorite_border,
            size: 16,
            color: (product.isLiked ?? false) ? AppColors.error : AppColors.textLight,
          ),
        ),
      ),
    );
  }
  
  Widget _buildBrandName() {
    return Text(
      product.brand,
      style: AppTextStyles.labelSmall.copyWith(
        color: AppColors.textLight,
      ),
    );
  }
  
  Widget _buildProductName() {
    return Text(
      product.name,
      style: _getNameTextStyle(),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
  
  Widget _buildRating() {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: _getRatingIconSize(),
          color: AppColors.orange,
        ),
        const SizedBox(width: 2),
        Text(
          product.rating.toString(),
          style: AppTextStyles.labelSmall.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          '(${product.reviews})',
          style: AppTextStyles.labelSmall.copyWith(
            color: AppColors.textLight,
          ),
        ),
      ],
    );
  }
  
  Widget _buildPricing() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (product.originalPrice != null) ...[
          Text(
            '฿${product.originalPrice!.toStringAsFixed(0)}',
            style: AppTextStyles.labelSmall.copyWith(
              color: AppColors.textLight,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          const SizedBox(height: 2),
        ],
        Text(
          '฿${product.price.toStringAsFixed(0)}',
          style: _getPriceTextStyle().copyWith(
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
  
  Widget _buildQuickActions() {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: 'ดู',
            variant: ButtonVariant.outline,
            size: ButtonSize.small,
            onPressed: onTap,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: CustomButton(
            text: 'ซื้อ',
            variant: ButtonVariant.primary,
            size: ButtonSize.small,
            icon: const Icon(Icons.add_shopping_cart, size: 14),
            onPressed: onAddToCart,
          ),
        ),
      ],
    );
  }
  
  // Helper methods
  double _getImageHeight() {
    switch (size) {
      case ProductCardSize.small:
        return 80;
      case ProductCardSize.medium:
        return 120;
      case ProductCardSize.large:
        return 160;
    }
  }
  
  TextStyle _getNameTextStyle() {
    switch (size) {
      case ProductCardSize.small:
        return AppTextStyles.labelSmall;
      case ProductCardSize.medium:
        return AppTextStyles.labelMedium;
      case ProductCardSize.large:
        return AppTextStyles.bodyMedium;
    }
  }
  
  TextStyle _getPriceTextStyle() {
    switch (size) {
      case ProductCardSize.small:
        return AppTextStyles.labelMedium;
      case ProductCardSize.medium:
        return AppTextStyles.labelLarge;
      case ProductCardSize.large:
        return AppTextStyles.bodyLarge;
    }
  }
  
  double _getRatingIconSize() {
    switch (size) {
      case ProductCardSize.small:
        return 10;
      case ProductCardSize.medium:
        return 12;
      case ProductCardSize.large:
        return 16;
    }
  }
  
  Widget _buildImagePlaceholder() {
    return Container(
      width: double.infinity,
      height: _getImageHeight(),
      color: AppColors.background,
      child: Icon(
        Icons.image,
        size: 40,
        color: AppColors.textLight,
      ),
    );
  }
  
  Widget _buildImageLoading() {
    return Container(
      width: double.infinity,
      height: _getImageHeight(),
      color: AppColors.background,
      child: const Center(
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }
}

enum ProductCardSize { small, medium, large }
```

### 5.2 Product Grid
```dart
// lib/widgets/product/product_grid.dart
class ProductGrid extends StatelessWidget {
  final List<Product> products;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double childAspectRatio;
  final Function(Product)? onProductTap;
  final Function(Product)? onAddToCart;
  final Function(Product)? onToggleWishlist;
  final bool showQuickActions;
  final ProductCardSize cardSize;
  
  const ProductGrid({
    super.key,
    required this.products,
    this.crossAxisCount = 2,
    this.crossAxisSpacing = 12,
    this.mainAxisSpacing = 12,
    this.childAspectRatio = 0.75,
    this.onProductTap,
    this.onAddToCart,
    this.onToggleWishlist,
    this.showQuickActions = true,
    this.cardSize = ProductCardSize.medium,
  });
  
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          product: product,
          size: cardSize,
          showQuickActions: showQuickActions,
          onTap: () => onProductTap?.call(product),
          onAddToCart: () => onAddToCart?.call(product),
          onToggleWishlist: () => onToggleWishlist?.call(product),
        );
      },
    );
  }
}
```

---

## 6. Form Components

### 6.1 Custom Text Field
```dart
// lib/widgets/form/custom_text_field.dart
class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onSuffixIconTap;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final bool enabled;
  final int maxLines;
  final int? maxLength;
  
  const CustomTextField({
    super.key,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconTap,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
    this.maxLines = 1,
    this.maxLength,
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Text(
            labelText!,
            style: AppTextStyles.labelMedium,
          ),
          const SizedBox(height: AppSpacing.sm),
        ],
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          enabled: enabled,
          maxLines: maxLines,
          maxLength: maxLength,
          style: AppTextStyles.bodyMedium,
          decoration: InputDecoration(
            hintText: hintText,
            helperText: helperText,
            errorText: errorText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon != null
                ? GestureDetector(onTap: onSuffixIconTap, child: suffixIcon)
                : null,
            filled: true,
            fillColor: enabled ? AppColors.surface : AppColors.background,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.divider),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.divider),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.error, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.md,
            ),
          ),
        ),
      ],
    );
  }
}
```

### 6.2 Search Bar
```dart
// lib/widgets/form/search_bar.dart
class CustomSearchBar extends StatefulWidget {
  final String? hintText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final VoidCallback? onFilterTap;
  final bool showFilter;
  
  const CustomSearchBar({
    super.key,
    this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.onFilterTap,
    this.showFilter = true,
  });
  
  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _controller = TextEditingController();
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
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
        controller: _controller,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        style: AppTextStyles.bodyMedium,
        decoration: InputDecoration(
          hintText: widget.hintText ?? '🔍 ค้นหาสินค้า...',
          hintStyle: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textLight,
          ),
          prefixIcon: Container(
            padding: const EdgeInsets.all(12),
            child: Icon(
              Icons.search_rounded,
              color: AppColors.primary,
              size: 20,
            ),
          ),
          suffixIcon: widget.showFilter
              ? GestureDetector(
                  onTap: widget.onFilterTap,
                  child: Container(
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
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
        ),
      ),
    );
  }
}
```

---

## 7. Navigation Components

### 7.1 Bottom Navigation Bar
```dart
// lib/widgets/navigation/custom_bottom_nav.dart
class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<BottomNavItem> items;
  
  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.surface,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textLight,
        selectedLabelStyle: AppTextStyles.labelSmall,
        unselectedLabelStyle: AppTextStyles.labelSmall,
        elevation: 8,
        items: items
            .map((item) => BottomNavigationBarItem(
                  icon: Icon(item.inactiveIcon),
                  activeIcon: Icon(item.activeIcon),
                  label: item.label,
                ))
            .toList(),
      ),
    );
  }
}

class BottomNavItem {
  final IconData activeIcon;
  final IconData inactiveIcon;
  final String label;
  
  const BottomNavItem({
    required this.activeIcon,
    required this.inactiveIcon,
    required this.label,
  });
}
```

### 7.2 App Bar
```dart
// lib/widgets/navigation/custom_app_bar.dart
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double elevation;
  
  const CustomAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.actions,
    this.leading,
    this.centerTitle = true,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation = 0,
  });
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleWidget ?? (title != null ? Text(title!) : null),
      actions: actions,
      leading: leading,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor ?? Colors.transparent,
      foregroundColor: foregroundColor ?? AppColors.textPrimary,
      elevation: elevation,
      titleTextStyle: AppTextStyles.headlineLarge,
      surfaceTintColor: Colors.transparent,
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
```

---

## 8. Utility Components

### 8.1 Empty State
```dart
// lib/widgets/utility/empty_state.dart
class EmptyState extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? icon;
  final String? actionText;
  final VoidCallback? onActionTap;
  
  const EmptyState({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.actionText,
    this.onActionTap,
  });
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              icon!,
              const SizedBox(height: AppSpacing.lg),
            ],
            Text(
              title,
              style: AppTextStyles.headlineMedium,
              textAlign: TextAlign.center,
            ),
            if (subtitle != null) ...[
              const SizedBox(height: AppSpacing.sm),
              Text(
                subtitle!,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (actionText != null && onActionTap != null) ...[
              const SizedBox(height: AppSpacing.lg),
              CustomButton(
                text: actionText!,
                onPressed: onActionTap,
                variant: ButtonVariant.primary,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
```

### 8.2 Error State
```dart
// lib/widgets/utility/error_state.dart
class ErrorState extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? actionText;
  final VoidCallback? onRetry;
  
  const ErrorState({
    super.key,
    required this.title,
    this.subtitle,
    this.actionText,
    this.onRetry,
  });
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: AppColors.error,
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              title,
              style: AppTextStyles.headlineMedium,
              textAlign: TextAlign.center,
            ),
            if (subtitle != null) ...[
              const SizedBox(height: AppSpacing.sm),
              Text(
                subtitle!,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (onRetry != null) ...[
              const SizedBox(height: AppSpacing.lg),
              CustomButton(
                text: actionText ?? 'ลองใหม่',
                onPressed: onRetry,
                variant: ButtonVariant.primary,
                icon: const Icon(Icons.refresh),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
```

---

## 9. Usage Examples

### 9.1 Basic Screen Implementation
```dart
class ProductListScreen extends StatefulWidget {
  final String category;
  
  const ProductListScreen({super.key, required this.category});
  
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> products = [];
  bool isLoading = true;
  String? error;
  
  @override
  void initState() {
    super.initState();
    _loadProducts();
  }
  
  Future<void> _loadProducts() async {
    try {
      setState(() {
        isLoading = true;
        error = null;
      });
      
      final loadedProducts = await ProductService.getProducts(
        category: widget.category,
      );
      
      setState(() {
        products = loadedProducts;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      title: widget.category,
      child: LoadingWrapper(
        isLoading: isLoading,
        loadingText: 'กำลังโหลดสินค้า...',
        child: _buildContent(),
      ),
    );
  }
  
  Widget _buildContent() {
    if (error != null) {
      return ErrorState(
        title: 'เกิดข้อผิดพลาด',
        subtitle: error,
        onRetry: _loadProducts,
      );
    }
    
    if (products.isEmpty) {
      return EmptyState(
        title: 'ไม่พบสินค้า',
        subtitle: 'ลองเปลี่ยนหมวดหมู่หรือค้นหาใหม่',
        icon: Icon(
          Icons.inventory_2_outlined,
          size: 64,
          color: AppColors.textLight,
        ),
      );
    }
    
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        children: [
          SectionHeader(
            title: 'สินค้าทั้งหมด',
            subtitle: '${products.length} รายการ',
          ),
          const SizedBox(height: AppSpacing.md),
          ProductGrid(
            products: products,
            crossAxisCount: 2,
            onProductTap: _onProductTap,
            onAddToCart: _onAddToCart,
            onToggleWishlist: _onToggleWishlist,
          ),
        ],
      ),
    );
  }
  
  void _onProductTap(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailScreen(product: product),
      ),
    );
  }
  
  void _onAddToCart(Product product) {
    // Add to cart logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('เพิ่ม ${product.name} ลงตะกร้าแล้ว'),
        backgroundColor: AppColors.success,
        action: SnackBarAction(
          label: 'ดูตะกร้า',
          textColor: Colors.white,
          onPressed: () {
            // Navigate to cart
          },
        ),
      ),
    );
  }
  
  void _onToggleWishlist(Product product) {
    setState(() {
      // Toggle wishlist logic
      final index = products.indexWhere((p) => p.id == product.id);
      if (index != -1) {
        products[index] = products[index].copyWith(
          isLiked: !(products[index].isLiked ?? false),
        );
      }
    });
  }
}
```

### 9.2 Form Implementation
```dart
class UserProfileForm extends StatefulWidget {
  const UserProfileForm({super.key});
  
  @override
  State<UserProfileForm> createState() => _UserProfileFormState();
}

class _UserProfileFormState extends State<UserProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  
  bool _isLoading = false;
  
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      title: 'แก้ไขโปรไฟล์',
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                labelText: 'ชื่อ-นามสกุล',
                hintText: 'กรอกชื่อของคุณ',
                controller: _nameController,
                prefixIcon: const Icon(Icons.person_outline),
              ),
              const SizedBox(height: AppSpacing.md),
              CustomTextField(
                labelText: 'อีเมล',
                hintText: 'กรอกอีเมลของคุณ',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email_outlined),
              ),
              const SizedBox(height: AppSpacing.md),
              CustomTextField(
                labelText: 'เบอร์โทรศัพท์',
                hintText: 'กรอกเบอร์โทรศัพท์',
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                prefixIcon: const Icon(Icons.phone_outlined),
              ),
              const SizedBox(height: AppSpacing.xl),
              CustomButton(
                text: 'บันทึก',
                onPressed: _isLoading ? null : _saveProfile,
                isLoading: _isLoading,
                isFullWidth: true,
                variant: ButtonVariant.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() => _isLoading = true);
    
    try {
      // Save profile logic
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('บันทึกข้อมูลเรียบร้อยแล้ว'),
          backgroundColor: AppColors.success,
        ),
      );
      
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('เกิดข้อผิดพลาด: $e'),
          backgroundColor: AppColors.error,
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }
}
```

---

## 10. Best Practices

### 10.1 Component Design Principles
1. **Single Responsibility**: แต่ละ component ทำหน้าที่เดียว
2. **Reusability**: สามารถนำไปใช้ในที่อื่นได้
3. **Customizable**: มี parameters สำหรับปรับแต่ง
4. **Consistent**: ใช้ design system เดียวกัน
5. **Accessible**: รองรับ accessibility

### 10.2 Performance Guidelines
1. **Use const constructors** เมื่อเป็นไปได้
2. **Avoid rebuilding widgets** ที่ไม่จำเป็น
3. **Use ListView.builder** สำหรับรายการยาว
4. **Optimize image loading** ด้วย caching
5. **Minimize widget depth** เพื่อลด render cost

### 10.3 Code Organization
```
lib/
├── widgets/
│   ├── layout/
│   │   ├── screen_wrapper.dart
│   │   ├── section_header.dart
│   │   └── loading_wrapper.dart
│   ├── ui/
│   │   ├── custom_button.dart
│   │   ├── custom_card.dart
│   │   └── badge.dart
│   ├── product/
│   │   ├── product_card.dart
│   │   └── product_grid.dart
│   ├── form/
│   │   ├── custom_text_field.dart
│   │   └── search_bar.dart
│   ├── navigation/
│   │   ├── custom_bottom_nav.dart
│   │   └── custom_app_bar.dart
│   └── utility/
│       ├── empty_state.dart
│       └── error_state.dart
```

### 10.4 Testing Components
```dart
// test/widgets/product/product_card_test.dart
void main() {
  group('ProductCard Widget Tests', () {
    late Product testProduct;
    
    setUp(() {
      testProduct = Product(
        id: 1,
        name: 'Test Product',
        price: 100,
        brand: 'Test Brand',
        category: 'Test Category',
        image: 'test.jpg',
        rating: 4.5,
        reviews: 10,
      );
    });
    
    testWidgets('should display product information', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(product: testProduct),
          ),
        ),
      );
      
      expect(find.text('Test Product'), findsOneWidget);
      expect(find.text('Test Brand'), findsOneWidget);
      expect(find.text('฿100'), findsOneWidget);
      expect(find.text('4.5'), findsOneWidget);
    });
    
    testWidgets('should trigger onTap callback', (tester) async {
      var tapped = false;
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(
              product: testProduct,
              onTap: () => tapped = true,
            ),
          ),
        ),
      );
      
      await tester.tap(find.byType(ProductCard));
      expect(tapped, true);
    });
  });
}
```

### 10.5 Component Documentation
```dart
/// A card widget for displaying product information.
/// 
/// This widget displays product details including image, name, brand,
/// rating, price, and action buttons. It supports different sizes and
/// customizable callbacks for user interactions.
/// 
/// Example usage:
/// ```dart
/// ProductCard(
///   product: product,
///   size: ProductCardSize.medium,
///   onTap: () => Navigator.push(...),
///   onAddToCart: () => cartService.addItem(product),
/// )
/// ```
class ProductCard extends StatelessWidget {
  /// The product to display
  final Product product;
  
  /// Callback when the card is tapped
  final VoidCallback? onTap;
  
  /// Callback when add to cart button is pressed
  final VoidCallback? onAddToCart;
  
  /// The size variant of the card
  final ProductCardSize size;
  
  /// Whether to show quick action buttons
  final bool showQuickActions;
}
```

---

**Document Status**: Complete  
**Last Updated**: November 14, 2025  
**Next Review**: December 14, 2025