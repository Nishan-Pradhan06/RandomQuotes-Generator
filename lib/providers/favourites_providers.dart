import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learngin/model/quotes_model.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class FavouritesProviders extends ChangeNotifier {
  final List<QuotesModel> _favourites = [];
  bool isLoading = false;

  List<QuotesModel> get favQuotes => _favourites;

  bool isFav(QuotesModel quote) {
    return _favourites.contains(quote);
  }

  void addToFav(QuotesModel quote) async {
    if (!_favourites.contains(quote)) {
      _favourites.add(quote);
      await saveFavourties();
      notifyListeners();
      _showToast("Added to favorites");
    }
  }

  void removeFromFav(QuotesModel quote) async {
    if (_favourites.contains(quote)) {
      _favourites.remove(quote);
      await saveFavourties();
      notifyListeners();
      _showToast("Removed from favorites");
    }
  }

  Future<void> fetchFavourites() async {
    setLoading(true);
    await loadFavourites();
    // await Future.delayed(const Duration(seconds: 2));
    setLoading(false);
  }

  void setLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  Future<void> saveFavourties() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favQuoteString =
        _favourites.map((quote) => json.encode(quote.toJson())).toList();
    await prefs.setStringList('favourites', favQuoteString);
  }

  Future<void> loadFavourites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favQuoteString = prefs.getStringList('favourites');
    if (favQuoteString != null) {
      _favourites.clear();
      _favourites.addAll(favQuoteString
          .map((quote) => QuotesModel.fromJson(json.decode(quote))));
      notifyListeners();
    }
  }
}
