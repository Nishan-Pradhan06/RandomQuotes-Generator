import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _quotes;
  String? _author;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _getQuotes() async {
    try {
      var url = Uri.parse('https://api.quotable.io/random');
      var response = await http.get(url);
      debugPrint('Response status: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');
      var data = jsonDecode(response.body);
      setState(() {
        _quotes = data["content"];
        _author = data["author"];
        _isLoading = false;
      });
    } catch (error) {
      // Handle error, e.g., show an error message
      debugPrint('Error fetching quotes: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(209, 196, 233, 1),
        appBar: appBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: IntrinsicHeight(
                  child: _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : _buildQuoteContainer(),
                ),
              ),
              _buildGenerateButton(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.deepPurple.shade400,
      foregroundColor: Colors.black,
      title: Text(
        "Random Quotes",
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildQuoteContainer() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  _quotes ?? "😃Click 'Generate' for quotes😃",
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
              if (_quotes != null) // Only show the Row if quotes are not null
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, right: 30, bottom: 5),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "-$_author",
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
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget _buildGenerateButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Center(
        child: CupertinoButton.filled(
          pressedOpacity: 0.8,
          onPressed: () {
            setState(() {
              _isLoading = true;
            });
            _getQuotes().then((_) {
              setState(() {
                _isLoading = false;
              });
            });
          },
          child: const Text("Generate"),
        ),
      ),
    );
  }
}
