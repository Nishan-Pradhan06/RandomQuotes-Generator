import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const MenuDrawer({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }
}
