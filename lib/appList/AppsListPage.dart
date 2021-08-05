import 'package:flutter/material.dart';
import 'package:flutter_firstproject/model/AppsList.dart';
import 'package:flutter_firstproject/sqFlite/SqFliteHelper.dart';
import 'AppsDetailsPage.dart';

class AppsListPage extends StatefulWidget {

  @override
  _AppsListPageState createState() => _AppsListPageState();
}

class _AppsListPageState extends State<AppsListPage> {
  final _appNameController = TextEditingController();
  var dbHelper;
  Future<List<AppsList>> appsList;
  String appName;

  @override
  void initState() {
    super.initState();
    dbHelper = SqFliteHelper();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [

              Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.6), BlendMode.dstATop),
                    image: AssetImage("images/login_logo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Container(
                child: TextField(
                  controller: _appNameController,
                  decoration: InputDecoration(
                    labelText: 'Enter app name',
                  ),
                  onChanged: (value) {
                    appName = value;
                  },
                ),
                padding: EdgeInsets.fromLTRB(32, 32, 32, 32),
              ),

              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [

                    TextButton(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Text(
                          "Save",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.lightBlueAccent,
                      ),
                      onPressed: () {
                        setState(() {
                          AppsList appsList = AppsList(null, appName);
                          var data = dbHelper.saveToDB(appsList);
                          print(data);
                        });
                      },
                    ),

                    SizedBox(
                      width: 16,
                    ),

                    TextButton(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Text(
                          "Apps List",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.lightBlueAccent,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AppsDetailsPage()),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

