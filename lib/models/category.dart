import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final Image image;

  const Category({
    @required this.id,
    @required this.title,
    @required this.image,
    this.color = Colors.orange,
  });
}
