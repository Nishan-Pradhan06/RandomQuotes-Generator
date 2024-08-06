import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learngin/view/components/no_fav.dart';
import 'package:learngin/view/components/skelentonizer.dart';
import 'package:provider/provider.dart';
import '../../core/theme/colors.dart';
import '../../providers/favourites_providers.dart';

class FavListCardComponents extends StatefulWidget {
  const FavListCardComponents({super.key});

  @override
  _FavListCardComponentsState createState() => _FavListCardComponentsState();
}

class _FavListCardComponentsState extends State<FavListCardComponents> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchFavourites();
    });
  }

  Future<void> _fetchFavourites() async {
    final favProvider =
        Provider.of<FavouritesProviders>(context, listen: false);
    await favProvider.fetchFavourites();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FavouritesProviders>(
      builder: (context, favProvider, child) {
        if (favProvider.isLoading) {
          return ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) => const SkelentonizerLoading(),
          );
        }

        return favProvider.favQuotes.isEmpty
            ? const NoFav()
            : ListView.builder(
                itemCount: favProvider.favQuotes.length,
                itemBuilder: (context, index) {
                  final quote = favProvider.favQuotes[index];
                  return IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
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
                                    quote.content,
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
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "- ${quote.author}",
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Wrap(
                                          spacing: 6,
                                          runSpacing: 6,
                                          children: quote.tags.map((tag) {
                                            return Chip(
                                              label: Text(
                                                tag,
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              backgroundColor:
                                                  BrandColors.primary,
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 1,
                                                      horizontal: 6),
                                              labelPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 1),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: BrandColors.primary,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.favorite,
                                            color: Colors.red.shade600,
                                          ),
                                          onPressed: () {
                                            favProvider.removeFromFav(quote);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}
