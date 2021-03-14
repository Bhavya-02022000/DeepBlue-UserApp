import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:userapp/screens/home.dart';
import 'package:userapp/screens/newRegistration.dart';

class QRScreen extends StatefulWidget {
  @override
  _QRScreenState createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  final auth = FirebaseAuth.instance;
  User user;
  var name = '';
  var myDate = '';
  var org;
  var lastname1 = '';
  @override
  void initState() {
    user = auth.currentUser;
    getname();
    super.initState();
  }

  void getname() async {
    final prefs = await SharedPreferences.getInstance();
    final myString = prefs.getString('Name') ?? '';
    final lastname = prefs.getString('LastName') ??
        ''; // final myStringOrg = prefs.getString('org') ?? '';
    setState(() {
      name = myString;
      lastname1 = lastname;
    });
    String date = DateTime.now().toString();
    date = date.split('.')[0];
    date = date.replaceAll('-', '');
    date = date.replaceAll(' ', '');
    date = date.replaceAll(':', '');
    date = date.toString();
    date = date.substring(2, 12);
    print(date);
    setState(() {
      myDate = date;
      // org = myStringOrg;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            title: Text('QrCode')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),

              child:Center(
                child: Container(
                  child: QrImage(
                    data:
                        user.uid + " " + name + "_" + lastname1 + " " + myDate,
                    version: QrVersions.auto,
                    size: 300.0,
                  ),
                ),
              ),

        ),
      ),
    );
  }
}
