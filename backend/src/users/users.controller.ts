import { Controller, Get, Put, Post, Body } from '@nestjs/common';
import { ApiTags, ApiOperation } from '@nestjs/swagger';
import { UsersService } from './users.service';
import { ApiResponse as ApiResponseDto } from '../common/dto/api-response.dto';

@ApiTags('users')
@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Get('profile')
  @ApiOperation({ summary: 'Get user profile' })
  getProfile() {
    const user = this.usersService.getProfile();
    return ApiResponseDto.success({ user });
  }

  @Put('profile')
  @ApiOperation({ summary: 'Update profile' })
  updateProfile(@Body() body: any) {
    const user = this.usersService.updateProfile('guest', body);
    return ApiResponseDto.success({ user });
  }

  @Post('addresses')
  @ApiOperation({ summary: 'Add address' })
  addAddress(@Body() body: any) {
    const user = this.usersService.addAddress('guest', body);
    return ApiResponseDto.success({ user });
  }
}
