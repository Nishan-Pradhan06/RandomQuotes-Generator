import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:learngin/view/components/button_component.dart';
import 'package:learngin/view/pages/custom_drawer_component.dart';
import 'package:learngin/view/pages/favourites_page.dart';
import 'package:learngin/view/pages/no_internet_pages.dart';
import 'package:provider/provider.dart';
import '../../model/custom_app_bar.dart';
import '../../providers/internet_connectivity_providers.dart';
import '../../providers/quotes_providers.dart';
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
      body: Consumer<ConnectivityProvider>(
        builder: (context, connectivityProvider, child) {
          if (connectivityProvider.connectivityResult ==
              ConnectivityResult.none) {
            return const NoInternetPage();
          } else {
            return Consumer<QuotesProviders>(
              builder: (context, quotesProvider, child) {
                return Column(
                  children: [
                    QuotesCardComponents(quote: quotesProvider.quotes),
                    const Spacer(),
                    const Expanded(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: ButtonComponent(),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
