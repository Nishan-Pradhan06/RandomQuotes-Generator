import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learngin/model/quotes_model.dart';

class FavouritesProviders extends ChangeNotifier {
  final List<QuotesModel> _favourites = [];
  bool isLoading = false;

  List<QuotesModel> get favQuotes => _favourites;

  bool isFav(QuotesModel quote) {
    return _favourites.contains(quote);
  }

  void addToFav(QuotesModel quote) {
    if (!_favourites.contains(quote)) {
      _favourites.add(quote);
      notifyListeners();
      _showToast("Added to favorites");
    }
  }

  void removeFromFav(QuotesModel quote) {
    if (_favourites.contains(quote)) {
      _favourites.remove(quote);
      notifyListeners();
      _showToast("Removed from favorites");
    }
  }

  Future<void> fetchFavourites() async {
    setLoading(true);
    // Simulate a network call or data fetch
    await Future.delayed(const Duration(seconds: 2));
    // Example: _favourites = fetchedData;
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
}
