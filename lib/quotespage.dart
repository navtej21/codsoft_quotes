import 'dart:math';

import 'package:codsoft_quote_app/quote.dart'; // Assuming Quote class is defined in quote.dart
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({Key? key}) : super(key: key);

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  List<List<dynamic>> lst = [
    ["The only way to do great work is to love what you do.", "Steve Jobs"],
    ["Believe you can and you're halfway there.", "Theodore Roosevelt"],
    [
      "The future belongs to those who believe in the beauty of their dreams.",
      "Eleanor Roosevelt"
    ],
    ["The best way to predict the future is to create it.", "Peter Drucker"]
  ];
  late List<Quote> lst2 =
      lst.map((e) => Quote(quote: e[0], author: e[1])).toList();

  int index = 0;

  void nextquote() {
    setState(() {
      if (index < lst2.length - 1) {
        index += 1;
      }
    });
  }

  void previousquote() {
    setState(() {
      if (index > 0) {
        index -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Quotes',
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(50),
          color: Colors.redAccent,
          width: 350,
          height: 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "''",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              Text(
                "${lst2[index].quote}",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "-${lst2[index].author}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.arrow_back), label: "back"),
          BottomNavigationBarItem(icon: Icon(Icons.share), label: "share"),
          BottomNavigationBarItem(
              icon: Icon(Icons.arrow_forward), label: "next")
        ],
        onTap: (index) {
          if (index == 0) {
            previousquote();
          } else if (index == 2) {
            nextquote();
          } else if (index == 1) {
            Share.share("${lst2[index].quote}");
          }
        },
      ),
    );
  }
}
