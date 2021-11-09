import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(const BigApp());
}
class BigApp extends StatelessWidget {
  const BigApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
      Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        body:
        Scaffold(
          backgroundColor: Color.fromRGBO(51, 240, 127, 0.52),
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: Text('TreeKode',
              style: TextStyle(
                fontFamily: ('Work_Sands'),
                fontSize: 30,
                fontWeight: FontWeight.bold,

                //fontStyle: FontStyle.italic,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Colors.black,

          ),
          body:
          Container(
            padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
            child:
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      )
                  ),
                  width: double.maxFinite,
                  height: double.maxFinite,
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage('https://media.discordapp.net/attachments/843384733135273996/907518700683419678/Untitled_design_4.jpg?width=671&height=671'),
                        radius: 40,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text('Detect The Disease ',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        )
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child:Text('In Your Plants ',
                            style: TextStyle(
                              color: Color.fromRGBO(125, 232, 107, 1),
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0,1.0),
                              blurRadius: 6.0,
                            ),
                            ],
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),

                        width: 350,
                        height: 350,
                        child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 50, 65, 50),
                            child: IconButton(onPressed: null, icon: Icon(
                              Icons.cloud_upload,
                              size: 100,
                              color: Color.fromRGBO(117, 164, 136, 0.49),
                            )
                            ),
                          ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                          child:Text('Upload Image To',
                              style: TextStyle(
                                color: Color.fromRGBO(125, 232, 107, 1),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,

                              )
                          ),
                        ),
                          Container(
                            padding: EdgeInsets.fromLTRB(00, 10, 0, 0),
                            child:Text('detect disease ',
                                style: TextStyle(
                                  //color: Color.fromRGBO(125, 232, 107, 1),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                )
                            ),
                          ),
                        ],

                        ),
                      ),
                    ],
                  ),
                ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,

            items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home,
                color: Colors.black,
                ),
                title: Text('Home'),
                backgroundColor: Colors.green,
              activeIcon: Icon(Icons.home,
              color: Colors.black,
              ),

            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text('Search'),
                backgroundColor: Colors.yellow
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
              backgroundColor: Colors.blue,
            ),
          ],
          ),
        ),
        ),
    );
  }
}




