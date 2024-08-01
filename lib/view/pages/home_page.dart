import 'package:flutter/material.dart';
import 'package:learngin/core/theme/colors.dart';
import 'package:learngin/view/pages/favourite.dart';

import '../../model/custom_app_bar.dart';
import '../components/appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      backgroundColor: BrandColors.kBackground,
      appBar: CustomAppBar(
        model: CustomAppBarModel(
          title: 'Random Quotes',
          icon: Icons.favorite,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FavouriteListCard(),
              ),
            );
          },
        ),
      ),
    );
  }
}
