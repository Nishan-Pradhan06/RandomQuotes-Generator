// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteListCard extends StatefulWidget {
  const FavouriteListCard({super.key});

  @override
  State<FavouriteListCard> createState() => _FavouriteListCardState();
}

class _FavouriteListCardState extends State<FavouriteListCard> {
  bool _isFavorite = false;
  bool _isLoading = true;
  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void loadData() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(209, 196, 233, 1),
        appBar: appBar(),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child: IntrinsicHeight(
                      child: _buildQuoteContainer(),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child: IntrinsicHeight(
                      child: _buildQuoteContainer(),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildQuoteContainer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 35, left: 10, right: 10, bottom: 10),
            child: Text(
              "quotes",
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: .4,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  if (_isFavorite) {
                    // Remove from favorites (implement your logic here)
                  } else {
                    // Add to favorites (implement your logic here)
                  }

                  setState(() {
                    _isFavorite = !_isFavorite;
                  });
                },
                icon: _isFavorite
                    ? const Icon(Icons.favorite, color: Colors.deepPurple)
                    : const Icon(Icons.favorite_border),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 30, bottom: 5),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "-author",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.deepPurple.shade400,
      foregroundColor: Colors.black,
      title: Text(
        "favourite",
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
