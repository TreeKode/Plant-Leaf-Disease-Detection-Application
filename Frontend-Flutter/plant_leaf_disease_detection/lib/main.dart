import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar:
            PreferredSize(
              preferredSize: Size.fromHeight(80.0),
              child: AppBar(
                  title: Center(child: Text('TreeKode')),
                  backgroundColor : Colors.green[900],
                  // leading: Icon(Icons.menu),

              ),
            ),
        bottomNavigationBar: BottomNavigationBar(
         type: BottomNavigationBarType.fixed,
          onTap: (value){
           //respond
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box_sharp),
              label: 'Profile',
            ) ,
            BottomNavigationBarItem(
                icon: Icon(Icons.menu),
              label: 'Menu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Search',
            ),
          ],
        ),
      ),
    ),
  );
}

