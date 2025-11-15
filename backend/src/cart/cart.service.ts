import { Injectable } from '@nestjs/common';

@Injectable()
export class CartService {
  private carts = new Map<string, any>();

  getCart(userId: string = 'guest') {
    return this.carts.get(userId) || { items: [], summary: { subtotal: 0, total: 0 } };
  }

  addItem(userId: string, item: any) {
    const cart = this.getCart(userId);
    cart.items.push({ id: Date.now().toString(), ...item });
    this.updateSummary(cart);
    this.carts.set(userId, cart);
    return cart;
  }

  updateItem(userId: string, itemId: string, quantity: number) {
    const cart = this.getCart(userId);
    const item = cart.items.find(i => i.id === itemId);
    if (item) {
      item.quantity = quantity;
      this.updateSummary(cart);
      this.carts.set(userId, cart);
    }
    return cart;
  }

  removeItem(userId: string, itemId: string) {
    const cart = this.getCart(userId);
    cart.items = cart.items.filter(i => i.id !== itemId);
    this.updateSummary(cart);
    this.carts.set(userId, cart);
    return cart;
  }

  clearCart(userId: string) {
    this.carts.delete(userId);
    return { items: [], summary: { subtotal: 0, total: 0 } };
  }

  private updateSummary(cart: any) {
    cart.summary.subtotal = cart.items.reduce((sum, item) => sum + (item.price * item.quantity), 0);
    cart.summary.total = cart.summary.subtotal;
  }
}
