import 'package:flutter/material.dart';
import 'package:learngin/model/quotes_model.dart';

class FavouritesProviders extends ChangeNotifier {
  bool isLoading = true;
  String err = '';
  final List<QuotesModel> favourites = [];
  List<QuotesModel> get favQuotes => favourites;
  void addToFav(QuotesModel quotes) {
    favourites.add(quotes);
    notifyListeners();
  }

  void removeFromFav(QuotesModel quotes) {
    favourites.remove(quotes);
    notifyListeners();
  }
}
