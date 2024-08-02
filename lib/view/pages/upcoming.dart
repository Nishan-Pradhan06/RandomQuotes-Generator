import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learngin/providers/favourites_providers.dart';
import 'package:provider/provider.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Consumer<FavouritesProviders>(
        builder: (context, favProvide, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite, color: Colors.red.shade800)),
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
