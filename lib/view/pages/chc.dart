import 'package:flutter/material.dart';

class QuoteListPage extends StatelessWidget {
  final List<Quote> quotes = [
    Quote(
      text:
          'The only limit to our realization of tomorrow is our doubts of today.',
      author: 'Franklin D. Roosevelt',
      tags: ['inspiration', 'future'],
    ),
    Quote(
      text: 'Life is what happens when you’re busy making other plans.',
      author: 'John Lennon',
      tags: ['life', 'plans'],
    ),
    // Add more quotes here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quotes'),
      ),
      body: ListView.builder(
        itemCount: quotes.length,
        itemBuilder: (context, index) {
          return QuoteCard(quote: quotes[index]);
        },
      ),
    );
  }
}

class Quote {
  final String text;
  final String author;
  final List<String> tags;

  Quote({required this.text, required this.author, required this.tags});
}

class QuoteCard extends StatelessWidget {
  final Quote quote;

  QuoteCard({required this.quote});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              quote.text,
              style: TextStyle(
                fontSize: 18.0,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '- ${quote.author}',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Wrap(
              spacing: 6.0,
              children:
                  quote.tags.map((tag) => Chip(label: Text(tag))).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
