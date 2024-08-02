import 'package:flutter/material.dart';
import '../model/quotes_model.dart';
import 'package:http/http.dart' as http;

class QuotesProviders extends ChangeNotifier {
  static const apiQuotes = 'https://api.quotable.io/random';
  bool isLoading = true;
  String error = '';
  QuotesModel quotes = QuotesModel(
    id: '',
    content: '',
    author: '',
    tags: [],
  );

  QuotesProviders() {
    getDataFromAPI();
  }

  Future<void> getDataFromAPI() async {
    try {
      isLoading = true;
      notifyListeners();
      final response = await http.get(Uri.parse(apiQuotes));
      if (response.statusCode == 200) {
        quotes = quotesModelFromJson(response.body);
        error = '';
      } else {
        error = response.statusCode.toString();
      }
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
