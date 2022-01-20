import 'dart:ui';

import 'package:woman_grocerry/constant/constant_data.dart';

class Products {
  String? image, title, discriptions;
  int? id, price, size;
  Color? color;

  Products(
      {this.image,
      this.color,
      this.discriptions,
      this.id,
      this.price,
      this.size,
      this.title});
}

List<Products> products = [
  Products(
      id: 1,
      title: "Professional Bag",
      price: 500,
      discriptions: dummyText,
      image: "images/bag 1.webp",
      size: 12,
      color: Color(0xFF0076CB)),
  Products(
      id: 2,
      title: "Balt Bag",
      price: 450,
      discriptions: dummyText,
      image: "images/bag 2.webp",
      size: 11,
      color: Color(0xFF60B99F)),
  Products(
      id: 3,
      title: "Red Balt Bag",
      price: 600,
      discriptions: dummyText,
      image: "images/bag 3.webp",
      size: 12,
      color: Color(0xFFF96A6F)),
  Products(
      id: 4,
      title: "Simple Bag",
      price: 380,
      discriptions: dummyText,
      image: "images/bag 4.webp",
      size: 12,
      color: Color(0xFF696966)),
  Products(
      id: 5,
      title: "Traditional Bag",
      price: 700,
      discriptions: dummyText,
      image: "images/bag 5.webp",
      size: 12,
      color: Color(0xFFD5A99C)),
  Products(
      id: 6,
      title: "Oldest Bag",
      price: 250,
      discriptions: dummyText,
      image: "images/bag 6.webp",
      size: 12,
      color: Color(0xFFEDB96E)), //Color(0xFFFED7A1)),
];
