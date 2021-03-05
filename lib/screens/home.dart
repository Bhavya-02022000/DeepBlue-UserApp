import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:userapp/screens/admin.dart';
import 'package:userapp/screens/details.dart';
import 'package:userapp/screens/login.dart';
import 'package:userapp/screens/organization.dart';
import 'package:userapp/screens/pdfpage.dart';
import 'package:userapp/screens/qr.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Buttons(),
    );
  }
}

class Buttons extends StatefulWidget {
  @override
  _ButtonsState createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  var dbRef = new Map();
  var nameOfUser = '';
  double tempOfUser = 0;
  var dateOfUser = '';
  var lastnameOfUser = '';
  var res;
  Timer timer;
  var containercolor = [
    Colors.white,
    Colors.green[100],
    Colors.green[300],
    Colors.green[400]
  ];
  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      this.fetchingData();
    });
    super.initState();
  }
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  fetchingData() async {
    final user = FirebaseAuth.instance.currentUser;

    dbRef = (await FirebaseDatabase.instance
            .reference()
            .child('users')
            .child(user.uid)
            .once())
        .value;
    setState(() {
      dbRef = dbRef;
      nameOfUser = dbRef['name'];
      tempOfUser = dbRef['temp'];
      dateOfUser = dbRef['date'];
      lastnameOfUser = dbRef['lastName'];
    });

    setState(() {
      if (dbRef['temp'] < 38) {
        res = 'You are Safe';

        containercolor = [
          Colors.white,
          Colors.green[100],
          Colors.green[300],
          Colors.green[400]
        ];
      } else {
        res = 'You are at Risk';
        containercolor = [
          Colors.white,
          Colors.red[100],
          Colors.red[300],
          Colors.red[400]
        ];
      }
    });
  }

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
              dispose();
              FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Login()));
            },
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          /* image: DecorationImage(
              image: AssetImage('assets/undraw_my_app_re_gxtj.png'), fit: BoxFit.cover),*/
          gradient: LinearGradient(
              colors: [
                Color(0xFFE3F2FD),
                Color(0xFFBBDEFB),
                Color(0xFF90CAF9),
                Color(0xFF64B5F6),
              ],

              // colors: [Colors.blue[400], Colors.blue],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter),
        ),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          // padding: EdgeInsets.symmetric(
          //   horizontal: 40.0,
          //   vertical: 120.0,
          // ),
          child: Padding(
            padding: EdgeInsets.only(
                left: 15.0, right: 15.0, bottom: 20.0, top: 8.0),
            child: Column(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.11,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      stops: [0.15, 0.4, 0.7, 1],
                                      colors: containercolor)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      'img/status.png',
                                      height: 60.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      res ?? '',
                                      style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      // children: [
                                      //   Text(nameOfUser,
                                      //       style: TextStyle(fontSize: 16)),
                                      //   SizedBox(
                                      //     height: 10,
                                      //   ),
                                      //   Text("Temperature: " + tempOfUser,
                                      //       style: TextStyle(fontSize: 12)),
                                      //   SizedBox(
                                      //     height: 10,
                                      //   ),
                                      //   Text("Date: " + dateOfUser,
                                      //       style: TextStyle(fontSize: 12))
                                      // ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                    Card(
                      color: Colors.lightBlue[50],
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text("Welcome: " + nameOfUser + ' ' + lastnameOfUser,
                                            style: TextStyle(fontSize: 20)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Text(
                                                    "Temperature: " +
                                                        tempOfUser.toString() ?? '',
                                                    style: TextStyle(
                                                        fontSize: 15)),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 70),
                                                child: Text(
                                                    "Date: " + dateOfUser,
                                                    style: TextStyle(
                                                        fontSize: 15)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // children: [
                              //   Text(nameOfUser,
                              //       style: TextStyle(fontSize: 16)),
                              //   SizedBox(
                              //     height: 10,
                              //   ),
                              //   Text("Temperature: " + tempOfUser,
                              //       style: TextStyle(fontSize: 12)),
                              //   SizedBox(
                              //     height: 10,
                              //   ),
                              //   Text("Date: " + dateOfUser,
                              //       style: TextStyle(fontSize: 12))
                              // ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            Column(
                              children: [
                                ScanQR(),
                                PdfViewerButton()
                                // UserDetails(),
                              ],
                            ),
                            Column(
                              children: [
                                AdminDetails(),
                                OrganisationPage(),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ScanQR extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.0, bottom: 2.0, left: 5),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.43,
        height: MediaQuery.of(context).size.height * 0.27,
        child: RaisedButton(
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
          ),
          elevation: 3.0,
          color: Colors.blue[50],
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ),
        ),
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
      padding: EdgeInsets.only(top: 5, bottom: 2.0, left: 15.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.43,
        height: MediaQuery.of(context).size.height * 0.22,
        child: RaisedButton(
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
                      .child('adminName')
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
              Image(
                alignment: Alignment.center,
                image: AssetImage('img/adminDetails.jpg'),
              ),
              Text('Admin Details'),
            ],
          ),
          elevation: 3.0,
          color: Colors.grey[100],
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}

class OrganisationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 13.0, bottom: 2.0, left: 15.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.43,
        height: MediaQuery.of(context).size.height * 0.27,
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => OrganizationButtons(),
            ));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image(
                alignment: Alignment.center,
                image: AssetImage('img/joinOrg.jpg'),
              ),
              Text('Organisation'),
            ],
          ),
          elevation: 3.0,
          color: Colors.lightBlue[50],
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}

class PdfViewerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 13.0, bottom: 2.0, left: 5),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.43,
        height: MediaQuery.of(context).size.height * 0.22,
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PdfViewer(),
            ));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image(
                alignment: Alignment.center,
                image: AssetImage('img/howToUse.jpg'),
              ),
              Text('PDF'),
            ],
          ),
          elevation: 3.0,
          color: Colors.grey[100],
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(15.0),
          ),
        ),
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
