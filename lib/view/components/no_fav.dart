import 'package:flutter/material.dart';

class NoFav extends StatelessWidget {
  const NoFav({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Image.asset(
            'assets/emptyFav.png',
            height: 300,
            width: 300,
          ),
        ),
        const Center(
            child: Text(
          'No Favorites',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
      ],
    );
  }
}
