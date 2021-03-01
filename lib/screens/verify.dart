import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:userapp/screens/home.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyScreen extends StatefulWidget {
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final auth = FirebaseAuth.instance;
  User user;
  Timer timer;

  @override
  void initState() {
    user = auth.currentUser;
    user.sendEmailVerification();
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('An Email is sent to ${user.email}. Please Verify'),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      final prefs = await SharedPreferences.getInstance();
      final myString = prefs.getString('Name') ?? '';
      final user = FirebaseAuth.instance.currentUser;
      String date = DateTime.now().toString();
      // FirebaseDatabase.instance
      //     .reference()
      //     .child('admin')
      //     .child(date.substring(0, date.indexOf(' ')))
      //     .child(user.uid)
      //     .update({
      //   'name': myString,
      //   'temp': '39.2',
      //   'date': DateTime.now().toString(),
      //   'status': 'safe'
      // });
      FirebaseDatabase.instance
          .reference()
          .child('users')
          .child(user.uid)
          .set({
        'date': date.substring(0, date.indexOf(' ')),
        'temp': '',
        'name': myString,
        // 'org':''
      });
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }
}
