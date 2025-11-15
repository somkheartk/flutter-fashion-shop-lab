import { Controller, Get, Param, Query, ParseIntPipe } from '@nestjs/common';
import { ApiTags, ApiOperation, ApiResponse, ApiQuery } from '@nestjs/swagger';
import { ProductsService } from './products.service';
import { ProductQueryDto } from './dto/product-query.dto';
import { ApiResponse as ApiResponseDto } from '../common/dto/api-response.dto';

@ApiTags('products')
@Controller('products')
export class ProductsController {
  constructor(private readonly productsService: ProductsService) {}

  @Get()
  @ApiOperation({ summary: 'Get all products with filters' })
  @ApiResponse({ status: 200, description: 'Return all products' })
  async findAll(@Query() query: ProductQueryDto) {
    const result = await this.productsService.findAll(query);
    return ApiResponseDto.success(
      { products: result.products },
      { pagination: result.pagination }
    );
  }

  @Get('search')
  @ApiOperation({ summary: 'Search products' })
  @ApiQuery({ name: 'q', required: true })
  @ApiResponse({ status: 200, description: 'Return search results' })
  async search(@Query('q') query: string) {
    const products = await this.productsService.search(query);
    return ApiResponseDto.success({ products });
  }

  @Get('featured')
  @ApiOperation({ summary: 'Get featured products' })
  @ApiQuery({ name: 'limit', required: false, type: Number })
  @ApiResponse({ status: 200, description: 'Return featured products' })
  async getFeatured(
    @Query('limit', new ParseIntPipe({ optional: true })) limit: number = 10,
  ) {
    const products = await this.productsService.findFeatured(limit);
    return ApiResponseDto.success({ products });
  }

  @Get(':id')
  @ApiOperation({ summary: 'Get product by ID' })
  @ApiResponse({ status: 200, description: 'Return product details' })
  @ApiResponse({ status: 404, description: 'Product not found' })
  async findOne(@Param('id', ParseIntPipe) id: number) {
    const product = await this.productsService.findOne(id);
    return ApiResponseDto.success({ product });
  }
}
