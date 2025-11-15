import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, Like } from 'typeorm';
import { Product } from './entities/product.entity';
import { ProductQueryDto } from './dto/product-query.dto';
import { PaginationMeta } from '../common/dto/api-response.dto';

@Injectable()
export class ProductsService {
  constructor(
    @InjectRepository(Product)
    private productsRepository: Repository<Product>,
  ) {}

  async findAll(query: ProductQueryDto) {
    const { page = 1, limit = 20, category, search } = query;
    
    const queryBuilder = this.productsRepository.createQueryBuilder('product');

    if (category) {
      queryBuilder.andWhere('product.category = :category', { category });
    }

    if (search) {
      queryBuilder.andWhere(
        '(product.name LIKE :search OR product.description LIKE :search)',
        { search: `%${search}%` }
      );
    }

    queryBuilder.orderBy('product.createdAt', 'DESC');

    const skip = (page - 1) * limit;
    queryBuilder.skip(skip).take(limit);

    const [products, total] = await queryBuilder.getManyAndCount();
    const pagination = new PaginationMeta(page, total, limit);

    return {
      products,
      pagination,
    };
  }

  async findOne(id: number): Promise<Product> {
    const product = await this.productsRepository.findOne({ where: { id } });
    
    if (!product) {
      throw new NotFoundException(`Product with ID ${id} not found`);
    }

    return product;
  }

  async findFeatured(limit: number = 10): Promise<Product[]> {
    return this.productsRepository.find({
      where: { isOnSale: true },
      take: limit,
      order: { rating: 'DESC' },
    });
  }

  async search(query: string): Promise<Product[]> {
    return this.productsRepository.find({
      where: [
        { name: Like(`%${query}%`) },
        { description: Like(`%${query}%`) },
      ],
      take: 20,
    });
  }
}
