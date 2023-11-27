import 'package:flutter/material.dart';
import 'currency_converter_screen.dart';

void main() => runApp(CurrencyConverterApp());

class CurrencyConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      debugShowCheckedModeBanner: false,
      home: CurrencyConverter(),
    );
  }
}
