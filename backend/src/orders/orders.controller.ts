import { Controller, Get, Post, Body, Param, Query } from '@nestjs/common';
import { ApiTags, ApiOperation } from '@nestjs/swagger';
import { OrdersService } from './orders.service';
import { ApiResponse as ApiResponseDto } from '../common/dto/api-response.dto';

@ApiTags('orders')
@Controller('orders')
export class OrdersController {
  constructor(private readonly ordersService: OrdersService) {}

  @Get()
  @ApiOperation({ summary: 'Get orders' })
  getOrders(@Query('status') status?: string) {
    const orders = this.ordersService.getOrders('guest', status);
    return ApiResponseDto.success({ orders });
  }

  @Get(':id')
  @ApiOperation({ summary: 'Get order details' })
  getOrder(@Param('id') id: string) {
    const order = this.ordersService.getOrder('guest', id);
    return ApiResponseDto.success({ order });
  }

  @Post()
  @ApiOperation({ summary: 'Create order' })
  createOrder(@Body() body: any) {
    const order = this.ordersService.createOrder('guest', body);
    return ApiResponseDto.success({ order });
  }

  @Post(':id/cancel')
  @ApiOperation({ summary: 'Cancel order' })
  cancelOrder(@Param('id') id: string, @Body() body: any) {
    const order = this.ordersService.cancelOrder('guest', id, body);
    return ApiResponseDto.success({ order });
  }
}
