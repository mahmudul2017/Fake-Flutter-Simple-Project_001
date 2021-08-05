import 'package:flutter/material.dart';

class UserDetailPage extends StatefulWidget {
  Map userList;

  UserDetailPage(this.userList);

  @override
  _UserDetailPageState createState() => _UserDetailPageState(userList);
}

class _UserDetailPageState extends State<UserDetailPage> {
  Map userList;

  _UserDetailPageState(this.userList);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [

                CircleAvatar(
                  radius: 100.0,
                  backgroundImage:
                  NetworkImage("${userList['avatar']}"),
                  backgroundColor: Colors.transparent,
                ),

                /*SizedBox(
                  height: 400,
                  width: 600,
                  child: Image.network(userList['avatar']),
                ),*/

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text('${userList['id']}', style: TextStyle(
                      fontSize: 18,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text('${userList['first_name']}', style: TextStyle(
                      fontSize: 18,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text('${userList['last_name']}', style: TextStyle(
                      fontSize: 18,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text('${userList['email']}', style: TextStyle(
                      fontSize: 18,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
