import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:userapp/screens/admin.dart';
import 'package:userapp/screens/details.dart';
import 'package:userapp/screens/login.dart';
import 'package:userapp/screens/organization.dart';
import 'package:userapp/screens/qr.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Buttons(),
    );
  }
}

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeepBlue'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Login()));
            },
          )
        ],
      ),
      body: Padding(
        padding:
            EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20.0, top: 8.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ScanQR(),
                    UserDetails(),
                    AdminDetails(),
                    OrganizationPage()
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ScanQR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, bottom: 2.0, left: 5.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.43,
        height: MediaQuery.of(context).size.height * 0.25,
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => QRScreen(),
              ));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image(
                  alignment: Alignment.center,
                  image: AssetImage('img/QR.jpg'),
                ),
                Text('QR Code'),
              ],
            )),
      ),
    );
  }
}

class UserDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, bottom: 2.0, left: 5.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.43,
        height: MediaQuery.of(context).size.height * 0.25,
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailsScreen(),
              ));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image(
                  alignment: Alignment.center,
                  image: AssetImage('img/userDetails.jpg'),
                ),
                Text('User Details'),
              ],
            )),
      ),
    );
  }
}

class AdminDetails extends StatefulWidget {
  @override
  _AdminDetailsState createState() => _AdminDetailsState();
}

class _AdminDetailsState extends State<AdminDetails> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.43,
        height: MediaQuery.of(context).size.height * 0.1,
        child: ElevatedButton(
            onPressed: () async {
              var emailID = (await FirebaseDatabase.instance
                      .reference()
                      .child('adminName')
                      .child(user.uid)
                      .child('email')
                      .once())
                  .value;
              print(emailID.toString());
              if (user.email == emailID) {
                var org = (await FirebaseDatabase.instance
                        .reference()
                        .child('users')
                        .child(user.uid)
                        .child('org')
                        .once())
                    .value;
                final prefs = await SharedPreferences.getInstance();
                prefs.setString('org', org);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AdminScreen(),
                ));
              } else {
                showAlertDialog(context);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                // Image(
                //   alignment: Alignment.center,
                //   image: AssetImage('img/userDetails.jpg'),
                // ),
                Text('Admin Details'),
              ],
            )),
      ),
    );
  }
}

class OrganizationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, bottom: 2.0, left: 5.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.43,
        height: MediaQuery.of(context).size.height * 0.1,
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => OrganizationButtons(),
              ));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                // Image(
                //   alignment: Alignment.center,
                //   image: AssetImage('img/userDetails.jpg'),
                // ),
                Text('Ogranization'),
              ],
            )),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Alert"),
    content: Text("You don't have access."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
