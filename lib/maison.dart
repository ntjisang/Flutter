import 'package:flutter/material.dart';

class Maison {
  final String imageUrl;
  final int price;
  final String ville;
  final String quartier;
  bool isFavorite;



  Maison({
    required this.imageUrl,
    required this.price,
    required this.ville,
    required this.quartier,
    this.isFavorite = false,

  });
}
