# Fashion Shop Assets

This folder contains the images used in the Fashion Shop app.

For now, the app uses online images from Unsplash. If you want to use local images, you can place them in this folder and update the image URLs in the dummy_data.dart file.

## Image Requirements
- Product images should be at least 400x400 pixels
- Use JPG or PNG format
- Keep file sizes under 1MB for better performance

## Usage
To use local images instead of online images:
1. Add your images to this folder
2. Update the imageUrl field in the products array in `lib/constants/dummy_data.dart`
3. Change from 'https://...' to 'assets/images/your_image.jpg'