import { Injectable } from '@nestjs/common';

@Injectable()
export class OrdersService {
  private orders = new Map<string, any[]>();

  getOrders(userId: string = 'guest', status?: string) {
    const userOrders = this.orders.get(userId) || [];
    if (status && status !== 'all') {
      return userOrders.filter(order => order.status === status);
    }
    return userOrders;
  }

  getOrder(userId: string, orderId: string) {
    const orders = this.getOrders(userId);
    return orders.find(order => order.id === orderId);
  }

  createOrder(userId: string, orderData: any) {
    const order = {
      id: `order-${Date.now()}`,
      orderNumber: `FSH-${Date.now()}`,
      status: 'pending',
      createdAt: new Date().toISOString(),
      ...orderData,
    };

    const userOrders = this.orders.get(userId) || [];
    userOrders.push(order);
    this.orders.set(userId, userOrders);
    return order;
  }

  cancelOrder(userId: string, orderId: string, reason: any) {
    const orders = this.orders.get(userId) || [];
    const order = orders.find(o => o.id === orderId);
    if (order) {
      order.status = 'cancelled';
      order.cancellationReason = reason;
    }
    return order;
  }
}
