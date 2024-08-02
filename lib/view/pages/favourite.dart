import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learngin/providers/favourites_providers.dart';
import 'package:provider/provider.dart';
import '../../model/custom_app_bar.dart';
import '../../model/quotes_model.dart';
import '../components/appbar.dart';

class FavouriteListCard extends StatelessWidget {
  const FavouriteListCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(209, 196, 233, 1),
      appBar: CustomAppBar(
        model: CustomAppBarModel(
          title: 'Favourites',
        ),
      ),
      body: Consumer<FavouritesProviders>(
        builder: (context, favProvider, child) {
          return favProvider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : favProvider.favQuotes.isNotEmpty
                  ? ListView.builder(
                      itemCount: favProvider.favQuotes.length,
                      itemBuilder: (context, index) {
                        final quote = favProvider.favQuotes[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 5),
                          child: IntrinsicHeight(
                            child: _buildQuoteContainer(
                              quote.content,
                              quote.author,
                              quote.tags,
                              context,
                              quote,
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        'No favourites',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: .4,
                          ),
                        ),
                      ),
                    );
        },
      ),
    );
  }

  Widget _buildQuoteContainer(String quote, String author, List<String> tags,
      BuildContext context, QuotesModel quotes) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  quote,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: .4,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "- $author",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 6,
                  children: tags
                      .map((tag) => Chip(
                            label: Text(
                              tag,
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            backgroundColor: Colors.deepPurple.shade400,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 6),
                            labelPadding:
                                const EdgeInsets.symmetric(horizontal: 6),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.red.shade600,
              ),
              onPressed: () {
                Provider.of<FavouritesProviders>(context, listen: false)
                    .removeFromFav(quotes);
              },
            ),
          ),
        ],
      ),
    );
  }
}
