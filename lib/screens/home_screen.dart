import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
// import 'package:learngin/screens/second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String quotes = "😁Generate Random quotes😁";
  String author = "";
  // int length =int.parse("");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple.shade100,
        appBar: AppBar(
          title: Text(
            "Random Quotes",
            style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 20)),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                // height: 150,
                height: MediaQuery.of(context).size.height / 3,
                // decoration: BoxDecoration(border: Border.all(width: 8)),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 25, left: 10, right: 10, bottom: 10),
                      child: Text(
                        quotes,
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
                    Padding(
                      padding: const EdgeInsets.only(top: 20, right: 30),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "-$author",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Center(
                child: CupertinoButton.filled(
                  // disabledColor: CupertinoColors.quaternarySystemFill,
                  onPressed: () async {
                    var url = Uri.parse('https://api.quotable.io/random');
                    var response = await http.get(url);
                    debugPrint('Response status: ${response.statusCode}');
                    debugPrint('Response body: ${response.body}');
                    var data = jsonDecode(response.body);
                    quotes = data["content"];
                    author = data["author"];

                    // ignore: use_build_context_synchronously
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => SecondScreen(
                    //       authorName: author,
                    //       quoteText: quotes,
                    //     ),
                    //   ),
                    // );

                    setState(() {
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 100),
                        child: Text(
                          quotes,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      );
                    });
                  },
                  child: const Text("Generate"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
