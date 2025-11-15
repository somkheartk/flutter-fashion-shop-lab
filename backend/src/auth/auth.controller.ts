import { Controller, Post, Body } from '@nestjs/common';
import { ApiTags, ApiOperation } from '@nestjs/swagger';
import { AuthService } from './auth.service';
import { ApiResponse as ApiResponseDto } from '../common/dto/api-response.dto';

@ApiTags('auth')
@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post('login')
  @ApiOperation({ summary: 'User login' })
  async login(@Body() body: { email: string; password: string }) {
    const result = await this.authService.login(body.email, body.password);
    return ApiResponseDto.success(result);
  }

  @Post('register')
  @ApiOperation({ summary: 'User registration' })
  async register(@Body() body: { email: string; password: string; displayName: string }) {
    const result = await this.authService.register(body.email, body.password, body.displayName);
    return ApiResponseDto.success(result);
  }

  @Post('refresh')
  @ApiOperation({ summary: 'Refresh token' })
  async refresh(@Body() body: { refreshToken: string }) {
    const tokens = await this.authService.refreshToken(body.refreshToken);
    return ApiResponseDto.success(tokens);
  }
}
