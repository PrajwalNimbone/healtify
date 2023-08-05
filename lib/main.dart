import 'package:flutter/material.dart';
import 'package:healtify/input_page.dart';

void main() {
  runApp(Healtify());
}

class Healtify extends StatelessWidget {
  const Healtify({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21)
      ),
        home: Inputpage(),
    );
  }
}
