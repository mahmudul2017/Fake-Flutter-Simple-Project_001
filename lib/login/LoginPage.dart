import 'package:flutter/material.dart';
import 'package:flutter_firstproject/dash/DashMainPage.dart';
import 'package:flutter_firstproject/appList/AppsListPage.dart';
import 'package:flutter_firstproject/features/FeaturesPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<LoginPage> {
  final _nameController = TextEditingController();
  final _passController = TextEditingController();
  bool _nameValidate = false;
  bool _passValidate = false;
  String usernameValue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: SafeArea(
              child: Column(
            // list of widget is set to center
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
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
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Enter username',
                    errorText:
                        _nameValidate ? 'Username can\'t be empty' : null,
                  ),
                  onChanged: (value) {
                    usernameValue = value;
                  },
                ),
                padding: EdgeInsets.fromLTRB(32, 32, 32, 16),
              ),

              Container(
                child: TextField(
                  controller: _passController,
                  decoration: InputDecoration(
                    labelText: 'Enter password',
                    errorText:
                        _passValidate ? 'Password can\'t be empty' : null,
                  ),
                ),
                padding: EdgeInsets.fromLTRB(32, 0, 32, 24),
              ),

              TextButton(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.pink,
                ),
                onPressed: () {
                  setState(() {
                    _nameController.text.isEmpty
                        ? _nameValidate = true
                        : _nameValidate = false;
                    _passController.text.isEmpty
                        ? _passValidate = true
                        : _passValidate = false;

                    if(!_nameValidate && !_passValidate) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DashMainPage(username: usernameValue)),
                      );
                      _nameController.clear();
                      _passController.clear();
                    }
                  });
                },
              ),

              TextButton(
                child: Text(
                  "Add Apps Info",
                  style: TextStyle(fontSize: 24.0),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.lightBlueAccent,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AppsListPage()),
                  );
                },
              ),

              SizedBox(
                height: 32.0,
              ),

              TextButton(
                child: Text(
                  "Apps Features",
                  style: TextStyle(fontSize: 20.0),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.orangeAccent,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FeaturesPage()),
                  );
                },
              ),
            ],
          )),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.clear();
    _passController.clear();
    super.dispose();
  }
}
