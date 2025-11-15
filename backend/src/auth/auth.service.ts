import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';

@Injectable()
export class AuthService {
  constructor(private jwtService: JwtService) {}

  async login(email: string, password: string) {
    const user = {
      id: 'user-123',
      email,
      displayName: 'User Name',
    };

    const payload = { sub: user.id, email: user.email };
    const accessToken = this.jwtService.sign(payload);

    return {
      user,
      tokens: {
        accessToken,
        refreshToken: this.jwtService.sign(payload, { expiresIn: '7d' }),
        expiresIn: 3600,
      },
    };
  }

  async register(email: string, password: string, displayName: string) {
    const user = {
      id: `user-${Date.now()}`,
      email,
      displayName,
    };

    const payload = { sub: user.id, email: user.email };
    const accessToken = this.jwtService.sign(payload);

    return {
      user,
      tokens: {
        accessToken,
        refreshToken: this.jwtService.sign(payload, { expiresIn: '7d' }),
        expiresIn: 3600,
      },
    };
  }

  async refreshToken(refreshToken: string) {
    try {
      const payload = this.jwtService.verify(refreshToken);
      const newPayload = { sub: payload.sub, email: payload.email };
      
      return {
        accessToken: this.jwtService.sign(newPayload),
        refreshToken: this.jwtService.sign(newPayload, { expiresIn: '7d' }),
        expiresIn: 3600,
      };
    } catch (error) {
      throw new Error('Invalid refresh token');
    }
  }
}
