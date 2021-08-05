import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_firstproject/listView/UserDetailPage.dart';
import 'package:http/http.dart' as http;

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  String userData;
  Map userMap;
  List userList;

  Future getUserListApi() async {
    var response =
        await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    if (response.statusCode == 200) {
      setState(() {
        //userData = response.body;
        userMap = json.decode(response.body);
        userList = userMap['data'];
      });
    }
  }

  @override
  void initState() {
    //--- api call first
    getUserListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserDetailPage(userList[index])),
              );
              print(userList[index]);
            },
            title: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(userList[index]['avatar']),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "User Information - ",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Id : ${userList[index]['id'].toString()}",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        Text(
                          "First Name : ${userList[index]['first_name'].toString()}",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        Text(
                          "Last Name : ${userList[index]['last_name'].toString()}",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        Text(
                          "Id: ${userList[index]['email'].toString()}",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: userList == null ? 0 : userList.length,
      )),
    );
  }
}
