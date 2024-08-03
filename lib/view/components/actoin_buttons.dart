import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learngin/providers/favourites_providers.dart';
import 'package:provider/provider.dart';
import 'package:learngin/model/quotes_model.dart';

class ActionButtons extends StatelessWidget {
  final QuotesModel quote;

  const ActionButtons({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Consumer<FavouritesProviders>(
        builder: (context, favProvider, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  if (favProvider.isFav == true) {
                    favProvider.addToFav(quote);
                  } else {
                    favProvider.removeFromFav(quote);
                  }
                },
                icon: Icon(
                  Icons.favorite,
                  color: favProvider.isFav == true
                      ? Colors.red.shade800
                      : Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  final snackBar = SnackBar(
                    backgroundColor: Colors.green,
                    content: Text(
                      'Downloaded Successfully',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );

                  const Duration(microseconds: 3);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                icon: const Icon(Icons.download),
              ),
              IconButton(
                onPressed: () {
                  final snackBar = SnackBar(
                    backgroundColor: Colors.green,
                    content: Text(
                      'Share Successfully',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );

                  const Duration(microseconds: 3);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                icon: const Icon(Icons.share_sharp),
              ),
            ],
          );
        },
      ),
    );
  }
}
