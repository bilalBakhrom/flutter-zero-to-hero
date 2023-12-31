import 'package:flutter/material.dart';
import 'package:qutoes/quote.dart';
import 'package:qutoes/quote_card.dart';

void main() {
  runApp(const MaterialApp(
    home: QuoteList(),
  ));
}

class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote('Be yourself, everyone else is already taken', 'Oscar Wilde'),
    Quote('Be yourself, everyone else is already taken', 'Oscar Wilde'),
    Quote('I have nothing to declare except my genius', 'Umar Yusuf'),
    Quote('The truth is rarely pure and never simple', 'Abdullah Bobur'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      appBar: AppBar(
        title: const Text(
          "Awesome Quotes",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: quotes
            .map((quote) => QuoteCard(quote, () {
                  setState(() {
                    quotes.remove(quote);
                  });
                }))
            .toList(),
      ),
    );
  }
}
