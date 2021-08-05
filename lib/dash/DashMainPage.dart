import 'package:flutter/material.dart';
import 'package:flutter_firstproject/dash/DashBoardPage.dart';
import 'package:flutter_firstproject/payment/PaymentPage.dart';
import 'package:flutter_firstproject/profile/ProfilePage.dart';
import 'package:flutter_firstproject/service/ServicePage.dart';

class DashMainPage extends StatefulWidget {
  String username;

  DashMainPage({this.username});

  @override
  _DashMainPagePageState createState() => _DashMainPagePageState(username);
}

class _DashMainPagePageState extends State<DashMainPage> {
  String username;
  int _currentIndex = 0;
  String pass;

  _DashMainPagePageState(this.username);

  final tabItems = [
    DashBoardPage(),
    ServicePage(),
    PaymentPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Text(username)
          //tabItems[_currentIndex]

          /*Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget> [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Center(
                      child: Text(
                    "HI, $username",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.blue,
                    ),
                  )),
                )
              ],
            ),
          ),*/
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.yellow,
          currentIndex: _currentIndex,
          iconSize: 30,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.blue
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.room_service),
                label: "Service",
                backgroundColor: Colors.blue
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.payment),
                label: "Payment",
                backgroundColor: Colors.blue
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.account_box_outlined),
                label: "Profile",
                backgroundColor: Colors.blue
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
