import { Injectable } from '@nestjs/common';

@Injectable()
export class UsersService {
  private users = new Map<string, any>();

  getProfile(userId: string = 'guest') {
    return this.users.get(userId) || {
      id: userId,
      email: 'user@example.com',
      displayName: 'Guest User',
      addresses: [],
    };
  }

  updateProfile(userId: string, data: any) {
    const user = this.getProfile(userId);
    Object.assign(user, data);
    this.users.set(userId, user);
    return user;
  }

  addAddress(userId: string, address: any) {
    const user = this.getProfile(userId);
    if (!user.addresses) user.addresses = [];
    user.addresses.push({ id: Date.now().toString(), ...address });
    this.users.set(userId, user);
    return user;
  }
}
