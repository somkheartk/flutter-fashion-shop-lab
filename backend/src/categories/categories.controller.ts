import { Controller, Get, Param, Query, ParseIntPipe } from '@nestjs/common';
import { ApiTags, ApiOperation, ApiResponse } from '@nestjs/swagger';
import { CategoriesService } from './categories.service';
import { ApiResponse as ApiResponseDto } from '../common/dto/api-response.dto';

@ApiTags('categories')
@Controller('categories')
export class CategoriesController {
  constructor(private readonly categoriesService: CategoriesService) {}

  @Get()
  @ApiOperation({ summary: 'Get all categories' })
  @ApiResponse({ status: 200, description: 'Return all categories' })
  async findAll() {
    const categories = await this.categoriesService.findAll();
    return ApiResponseDto.success({ categories });
  }

  @Get(':id')
  @ApiOperation({ summary: 'Get category by ID' })
  @ApiResponse({ status: 200, description: 'Return category' })
  async findOne(@Param('id', ParseIntPipe) id: number) {
    const category = await this.categoriesService.findOne(id);
    return ApiResponseDto.success({ category });
  }

  @Get(':id/products')
  @ApiOperation({ summary: 'Get products in category' })
  @ApiResponse({ status: 200, description: 'Return products' })
  async getCategoryProducts(
    @Param('id', ParseIntPipe) id: number,
    @Query('page', new ParseIntPipe({ optional: true })) page: number = 1,
    @Query('limit', new ParseIntPipe({ optional: true })) limit: number = 20,
  ) {
    const result = await this.categoriesService.getCategoryProducts(id, page, limit);
    return ApiResponseDto.success(
      { products: result.products },
      { pagination: result.pagination }
    );
  }
}
