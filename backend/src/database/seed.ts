import { DataSource } from 'typeorm';
import { Product } from '../products/entities/product.entity';
import { Category } from '../categories/entities/category.entity';

export async function seedDatabase(dataSource: DataSource) {
  const productRepository = dataSource.getRepository(Product);
  const categoryRepository = dataSource.getRepository(Category);

  const existingProducts = await productRepository.count();
  if (existingProducts > 0) {
    console.log('✅ Database already seeded');
    return;
  }

  // Seed Categories
  const categories = [
    { name: 'Fashions', icon: '👗', color: '4ECE5B' },
    { name: 'Electronic', icon: '📱', color: 'FFB84D' },
    { name: 'Sports & Outdoor', icon: '⚽', color: 'FF6B6B' },
    { name: 'Babies & Toys', icon: '🧸', color: '4ECDC4' },
    { name: 'Home & Lifestyle', icon: '🏠', color: '45B7D1' },
    { name: 'Food & Delivery', icon: '🍕', color: '96CEB4' },
  ];

  await categoryRepository.save(categories);
  console.log('✅ Categories seeded');

  // Seed Products (from Flutter dummy data)
  const products = [
    {
      name: 'Women Jacket',
      description: 'Premium quality women jacket perfect for any occasion',
      price: 55.00,
      originalPrice: 75.00,
      category: 'Women',
      imageUrl: 'https://images.unsplash.com/photo-1591047139829-d91aecb6caea?w=400',
      rating: 4.5,
      reviewCount: 120,
      colors: ['Black', 'Brown', 'Gray'],
      sizes: ['S', 'M', 'L', 'XL'],
      isOnSale: true,
    },
    {
      name: 'America Dress',
      description: 'Stylish american style dress for modern women',
      price: 45.00,
      originalPrice: 0,
      category: 'Women',
      imageUrl: 'https://images.unsplash.com/photo-1595777457583-95e059d581b8?w=400',
      rating: 4.2,
      reviewCount: 85,
      colors: ['Red', 'Blue', 'White'],
      sizes: ['XS', 'S', 'M', 'L'],
      isOnSale: false,
    },
    {
      name: 'Hip Shirt',
      description: 'Comfortable hip style shirt for casual wear',
      price: 35.00,
      originalPrice: 0,
      category: 'Women',
      imageUrl: 'https://images.unsplash.com/photo-1603252109360-909baaf261c7?w=400',
      rating: 4.0,
      reviewCount: 64,
      colors: ['Pink', 'White', 'Purple'],
      sizes: ['S', 'M', 'L'],
      isOnSale: false,
    },
    {
      name: 'Cotton Blazer',
      description: 'Professional cotton blazer for office wear',
      price: 65.00,
      originalPrice: 0,
      category: 'Women',
      imageUrl: 'https://images.unsplash.com/photo-1594633312681-425c7b97ccd1?w=400',
      rating: 4.7,
      reviewCount: 142,
      colors: ['Navy', 'Black', 'Gray'],
      sizes: ['S', 'M', 'L', 'XL'],
      isOnSale: false,
    },
    {
      name: 'Men Combo Shirt',
      description: 'Versatile combo shirt perfect for any occasion',
      price: 42.00,
      originalPrice: 0,
      category: 'Men',
      imageUrl: 'https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?w=400',
      rating: 4.3,
      reviewCount: 96,
      colors: ['White', 'Blue', 'Black'],
      sizes: ['M', 'L', 'XL', 'XXL'],
      isOnSale: false,
    },
    {
      name: 'Blue Hoodie Sweater',
      description: 'Comfortable blue hoodie sweater for cold weather',
      price: 38.00,
      originalPrice: 0,
      category: 'Men',
      imageUrl: 'https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=400',
      rating: 4.1,
      reviewCount: 73,
      colors: ['Blue', 'Gray', 'Black'],
      sizes: ['S', 'M', 'L', 'XL'],
      isOnSale: false,
    },
    {
      name: 'Prince Trendy Shirt',
      description: 'Trendy prince style shirt for special occasions',
      price: 48.00,
      originalPrice: 0,
      category: 'Men',
      imageUrl: 'https://images.unsplash.com/photo-1564859117892-3c8e1b3d7e64?w=400',
      rating: 4.4,
      reviewCount: 89,
      colors: ['White', 'Cream', 'Black'],
      sizes: ['M', 'L', 'XL'],
      isOnSale: false,
    },
  ];

  await productRepository.save(products);
  console.log(`✅ Products seeded (${products.length} products)`);
}
