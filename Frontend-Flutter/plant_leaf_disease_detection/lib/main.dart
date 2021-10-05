import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green,
          appBar: AppBar(
            backgroundColor: const Color(0xFF151026),
            title: Text('TreeKode'),
            leading: GestureDetector(
              onTap: () {/*listener to be added here */},
              child: Icon(
                 Icons.menu,
            ),
          ),
          body: Center(child: Column(children: <Widget>[

            Container(
              margin: EdgeInsets.all(25),
              child: FlatButton(
                child: Text('Image Preview', style: TextStyle(fontSize: 20.0),),
                onPressed: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: FlatButton(
                child: Text('Detect', style: TextStyle(fontSize: 20.0),),
                color: const Color(0xFF151026),
                textColor: Colors.white,
                onPressed: () {},
              ),
            ),

          ]
          ))
      ),
    );
  }
}