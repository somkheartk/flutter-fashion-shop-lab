import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { Product } from './entities/product.entity';
import { ProductQueryDto } from './dto/product-query.dto';
import { PaginationMeta } from '../common/dto/api-response.dto';

@Injectable()
export class ProductsService {
  constructor(
    @InjectModel(Product.name)
    private productModel: Model<Product>,
  ) {}

  async findAll(query: ProductQueryDto) {
    const { page = 1, limit = 20, category, search } = query;
    
    const filter: any = {};

    if (category) {
      filter.category = category;
    }

    if (search) {
      filter.$or = [
        { name: { $regex: search, $options: 'i' } },
        { description: { $regex: search, $options: 'i' } },
      ];
    }

    const skip = (page - 1) * limit;
    
    const [products, total] = await Promise.all([
      this.productModel
        .find(filter)
        .sort({ createdAt: -1 })
        .skip(skip)
        .limit(limit)
        .exec(),
      this.productModel.countDocuments(filter).exec(),
    ]);

    const pagination = new PaginationMeta(page, total, limit);

    return {
      products,
      pagination,
    };
  }

  async findOne(id: string): Promise<Product> {
    const product = await this.productModel.findById(id).exec();
    
    if (!product) {
      throw new NotFoundException(`Product with ID ${id} not found`);
    }

    return product;
  }

  async findFeatured(limit: number = 10): Promise<Product[]> {
    return this.productModel
      .find({ isOnSale: true })
      .sort({ rating: -1 })
      .limit(limit)
      .exec();
  }

  async search(query: string): Promise<Product[]> {
    return this.productModel
      .find({
        $or: [
          { name: { $regex: query, $options: 'i' } },
          { description: { $regex: query, $options: 'i' } },
        ],
      })
      .limit(20)
      .exec();
  }
}
