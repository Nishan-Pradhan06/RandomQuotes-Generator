import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learngin/view/components/appbar.dart';

import '../../model/custom_app_bar.dart';

class FavouriteListCard extends StatefulWidget {
  const FavouriteListCard({Key? key}) : super(key: key);

  @override
  State<FavouriteListCard> createState() => _FavouriteListCardState();
}

class _FavouriteListCardState extends State<FavouriteListCard> {
  List<QuotesModel> _favoriteQuotes = [];
  bool _isLoading = true;

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void loadData() {
    // Simulate loading data
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
        // Initialize your favorite quotes here, or fetch them from a database
        _favoriteQuotes = [
          QuotesModel(
            sId: "1",
            content: "Favorite quote 1",
            author: "Author 1",
            tags: ["inspiration"],
          ),
          QuotesModel(
            sId: "2",
            content: "Favorite quote 2",
            author: "Author 2",
            tags: ["motivation"],
          ),
        ];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(209, 196, 233, 1),
      appBar: CustomAppBar(
        model: CustomAppBarModel(
          title: 'Favourites',
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _favoriteQuotes.isNotEmpty
              ? ListView.builder(
                  itemCount: _favoriteQuotes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 5),
                      child: IntrinsicHeight(
                        child: _buildQuoteContainer(
                          _favoriteQuotes[index].content ?? '',
                          _favoriteQuotes[index].author ?? '',
                          _favoriteQuotes[index].tags ?? [],
                          index,
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
                ),
    );
  }

  Widget _buildQuoteContainer(
      String quote, String author, List<String> tags, int index) {
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
                // Handle favorite toggle
              },
            ),
          ),
        ],
      ),
    );
  }
}

class QuotesModel {
  String? sId;
  String? content;
  String? author;
  List<String>? tags;

  QuotesModel({this.sId, this.content, this.author, this.tags});

  QuotesModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    content = json['content'];
    author = json['author'];
    tags = json['tags'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['content'] = content;
    data['author'] = author;
    data['tags'] = tags;
    return data;
  }
}
