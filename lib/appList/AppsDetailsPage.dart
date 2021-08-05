import 'package:flutter/material.dart';
import 'package:flutter_firstproject/model/AppsList.dart';
import 'package:flutter_firstproject/sqFlite/SqFliteHelper.dart';

class AppsDetailsPage extends StatefulWidget {

  @override
  _AppsDetailsPageState createState() => _AppsDetailsPageState();
}

class _AppsDetailsPageState extends State<AppsDetailsPage> {
  var dbHelper;
  Future<List<AppsList>> appsList;

  @override
  void initState() {
    super.initState();
    dbHelper = SqFliteHelper();
    appsList = dbHelper.getAppsListToDB();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Text("$appsList[0]"),
        ),
      ),
    );
  }
}
