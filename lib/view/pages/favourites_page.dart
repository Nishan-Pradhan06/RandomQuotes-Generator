import 'package:flutter/material.dart';
import 'package:learngin/model/custom_app_bar.dart';
import 'package:learngin/view/components/appbar.dart';
import '../components/fav_card_components.dart';

class FavouritesListCard extends StatelessWidget {
  const FavouritesListCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: CustomAppBar(
        model: CustomAppBarModel(title: 'Favourites'),
      ),
      body: ListView(
        children: const [
          FavListCardComponents(),
        ],
      ),
    );
  }
}
