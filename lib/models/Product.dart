import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/black_velvet_1.jpeg",
      "assets/images/black_velvet_2.jpeg",
      "assets/images/black_velvet_3.jpeg",
      "assets/images/black_velvet_4.jpeg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Black Velvet Cake 500g",
    price: 500.00,
    description: "Enjoy this delicious black velvet cake with whipped frosting – a tasty dessert treat.",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/butter_2.jpeg",
      "assets/images/butter_1.jpeg",
      "assets/images/butter_3.jpeg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Butterscotch Cake Plain 500g",
    price: 450.00,
    description: "A soft and moist cake with the subtle flavour of caramel and butter, and sprinkled through with cashew nuts.",
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/butter-cake-plain-1.jpeg",
      "assets/images/butter-cake-plain-2.jpeg",
      "assets/images/butter-cake-plain-3.jpeg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Butter Cake Plain 500g",
    price: 400.00,
    description: "A soft, gently sweet, fluffy cake with the richness of butter, generously topped with broken cashew nuts.",
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/butter-cake-plain-1.jpeg",
      "assets/images/butter-cake-plain-2.jpeg",
      "assets/images/butter-cake-plain-3.jpeg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Butter Cake Plain 500g",
    price: 400.00,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];
List<Product> demoProducts2 = [

  Product(
    id: 5,
    images: [
      "assets/images/butter-cake-plain-1.jpeg",
      "assets/images/butter-cake-plain-2.jpeg",
      "assets/images/butter-cake-plain-3.jpeg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Butter Cake Plain 500g",
    price: 400.00,
    description: "A soft, gently sweet, fluffy cake with the richness of butter, generously topped with broken cashew nuts.",
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 8,
    images: [
      "assets/images/black_velvet_1.jpeg",
      "assets/images/black_velvet_2.jpeg",
      "assets/images/black_velvet_3.jpeg",
      "assets/images/black_velvet_4.jpeg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Black Velvet Cake 500g",
    price: 500.00,
    description: "Enjoy this delicious black velvet cake with whipped frosting – a tasty dessert treat.",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 7,
    images: [
      "assets/images/butter_2.jpeg",
      "assets/images/butter_1.jpeg",
      "assets/images/butter_3.jpeg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Butterscotch Cake Plain 500g",
    price: 450.00,
    description: "A soft and moist cake with the subtle flavour of caramel and butter, and sprinkled through with cashew nuts.",
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 6,
    images: [
      "assets/images/butter-cake-plain-1.jpeg",
      "assets/images/butter-cake-plain-2.jpeg",
      "assets/images/butter-cake-plain-3.jpeg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Butter Cake Plain 500g",
    price: 400.00,
    description: "A soft, gently sweet, fluffy cake with the richness of butter, generously topped with broken cashew nuts.",
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
];
const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
