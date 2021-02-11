import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:userapp/screens/home.dart';
import 'package:userapp/screens/login.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_forward),
          onPressed: () {
            var user = FirebaseAuth.instance.currentUser;
            if (user == null) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => Login(),
              ));
            } else {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ));
            }
          }),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
        title: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            "",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "Welcome to the\nDeepBlue 'ASST App'",
                    style: TextStyle(
                        fontFamily: "Bebas", fontSize: 48, color: Colors.black),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: DisplayImage(),
              ),
            ],
          )),
    );
  }
}

class DisplayImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage('img/adminDisplay.png'));
  }
}
