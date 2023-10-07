import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:learngin/screens/second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String quotes = "😁Generate Random quotes😁";
  String author = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Random Quotes"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
              child: Text(
                quotes,
                textAlign: TextAlign.start,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 30),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "-$author",
                  style: const TextStyle(fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Center(
                child: ElevatedButton(
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
