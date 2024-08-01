import 'package:flutter/material.dart';

class CustomAppBarModel {
  final String title;
  final IconData? icon;
  final VoidCallback? onPressed;
  final Color? iconBackgroundColor;

  CustomAppBarModel({
    required this.title,
    this.icon,
    this.onPressed,
    this.iconBackgroundColor,
  });
}
