import { Controller, Get, Post, Put, Delete, Body, Param } from '@nestjs/common';
import { ApiTags, ApiOperation } from '@nestjs/swagger';
import { CartService } from './cart.service';
import { ApiResponse as ApiResponseDto } from '../common/dto/api-response.dto';

@ApiTags('cart')
@Controller('cart')
export class CartController {
  constructor(private readonly cartService: CartService) {}

  @Get()
  @ApiOperation({ summary: 'Get cart' })
  getCart() {
    const cart = this.cartService.getCart();
    return ApiResponseDto.success({ cart });
  }

  @Post('items')
  @ApiOperation({ summary: 'Add item to cart' })
  addItem(@Body() body: any) {
    const cart = this.cartService.addItem('guest', body);
    return ApiResponseDto.success({ cart });
  }

  @Put('items/:id')
  @ApiOperation({ summary: 'Update cart item' })
  updateItem(@Param('id') id: string, @Body() body: any) {
    const cart = this.cartService.updateItem('guest', id, body.quantity);
    return ApiResponseDto.success({ cart });
  }

  @Delete('items/:id')
  @ApiOperation({ summary: 'Remove cart item' })
  removeItem(@Param('id') id: string) {
    const cart = this.cartService.removeItem('guest', id);
    return ApiResponseDto.success({ cart });
  }

  @Delete()
  @ApiOperation({ summary: 'Clear cart' })
  clearCart() {
    const cart = this.cartService.clearCart('guest');
    return ApiResponseDto.success({ cart });
  }
}
