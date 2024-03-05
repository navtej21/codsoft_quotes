import 'package:codsoft_quote_app/homepage.dart';
import 'package:codsoft_quote_app/quotespage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
    routes: {'_quotes': (context) => QuotePage()},
  ));
}
