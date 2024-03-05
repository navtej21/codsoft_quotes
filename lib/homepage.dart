import 'dart:async';

import 'package:codsoft_quote_app/quote.dart';
import 'package:codsoft_quote_app/quotespage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var index = 0;
  List<dynamic> lst = [
    [
      "Life is what happens when you're busy making other plans.",
      "John Lennon"
    ],
    [
      "In the end, it's not the years in your life that count. It's the life in your years.",
      "Abraham Lincoln"
    ],
    ["The only thing we have to fear is fear itself.", "Franklin D. Roosevelt"]
  ];

  late List<Quote> lst2 =
      lst.map((e) => Quote(quote: e[0], author: e[1])).toList();
  @override
  void initState() {
    setState(() {
      Timer.periodic(Duration(seconds: 2), (timer) {
        setState(() {
          index = (index + 1) % lst.length;
        });
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 84, 12, 7),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Column(
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "''",
                            style: TextStyle(fontSize: 45),
                          ),
                          Text(
                            lst2[index].quote,
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "- " + lst2[index].author,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: Container(
                        padding: EdgeInsets.all(32),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QuotePage()));
                          },
                          child: Text(
                            "Click For More Quotes",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QuotePage()));
              },
            )
          ],
        ));
  }
}
