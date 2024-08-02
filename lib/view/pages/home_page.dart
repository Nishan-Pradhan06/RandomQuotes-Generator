import 'package:flutter/material.dart';
import 'package:learngin/view/components/button_component.dart';
import 'package:learngin/view/components/custom_drawer_component.dart';
import 'package:learngin/view/pages/favourites_page.dart';
import '../../model/custom_app_bar.dart';
import '../components/appbar.dart';
import '../components/quotes_card_components.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawerComponent(),
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
          Spacer(),
          Expanded(
            child: Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ButtonComponent(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
