import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Document } from 'mongoose';

@Schema({ timestamps: true })
export class Product extends Document {
  @Prop({ required: true })
  name: string;

  @Prop({ required: true })
  description: string;

  @Prop({ required: true, type: Number })
  price: number;

  @Prop({ type: Number, default: null })
  originalPrice: number;

  @Prop({ required: true })
  category: string;

  @Prop({ required: true })
  imageUrl: string;

  @Prop({ type: Number, default: 0 })
  rating: number;

  @Prop({ type: Number, default: 0 })
  reviewCount: number;

  @Prop({ type: [String], default: [] })
  colors: string[];

  @Prop({ type: [String], default: [] })
  sizes: string[];

  @Prop({ type: Boolean, default: false })
  isOnSale: boolean;
}

export const ProductSchema = SchemaFactory.createForClass(Product);
