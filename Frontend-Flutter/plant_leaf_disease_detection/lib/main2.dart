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

          body: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [

                      ],
                    ),
                    Column(
                      // children: [
                      //   CircleAvatar(
                      //     backgroundImage: NetworkImage('https://miro.medium.com/max/1200/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg'),
                      //     radius: 80,
                      //   )
                      // ],
                    ),
                    Column(
                      children: [
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}




SafeArea(
child: Container(

child: Container(
padding: EdgeInsets.fromLTRB(30, 30, 20,10),
child: Text('TreeKode',
style: TextStyle(fontFamily: 'Work_Sans',
fontWeight: FontWeight.bold ,
fontSize: 25,
),

),
),
),
),