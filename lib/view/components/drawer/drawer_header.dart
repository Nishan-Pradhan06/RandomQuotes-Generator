import 'package:flutter/material.dart';
import 'package:learngin/core/theme/colors.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: const Text(
        'Quotes',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      accountEmail: const Text('nishanpradhan.com.np'),
      currentAccountPicture: CircleAvatar(
        child: ClipOval(
          child: Image.asset(
            'assets/logo.png',
            width: 95,
            height: 95,
          ),
        ),
      ),
      decoration: const BoxDecoration(
        color: BrandColors.primary,
        image: DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1635350181304-be3f00f5af76?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
