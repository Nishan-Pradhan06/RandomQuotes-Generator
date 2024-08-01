import 'package:flutter/material.dart';
import 'package:learngin/view/components/button_component.dart';
import 'package:learngin/view/pages/favourites_page.dart';
import '../../model/custom_app_bar.dart';
import '../components/appbar.dart';
import '../components/quotes_card_components.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: CustomDrawer(),
      appBar: CustomAppBar(
        model: CustomAppBarModel(
          title: 'Random Quotes',
          icon: Icons.favorite,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FavouritesListCard(),
              ),
            );
          },
        ),
      ),
      body: const Column(
        children: [
          QuotesCardComponents(),
          Expanded(
            child: ButtonComponent(),
          ),
        ],
      ),
    );
  }
}
