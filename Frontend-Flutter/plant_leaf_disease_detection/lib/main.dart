import 'package:flutter/material.dart';

void main() {
  runApp(const BigApp());
}
class BigApp extends StatelessWidget {
  const BigApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal[100],
        appBar: AppBar(
          title: Text(
              'TreeKode'
          ),
          titleTextStyle: (
          TextStyle(
              fontFamily: 'Great_Vibes',
            fontSize: 50,
          )
          ),
          backgroundColor: Colors.teal,
        ),
      )
    );
  }
}




