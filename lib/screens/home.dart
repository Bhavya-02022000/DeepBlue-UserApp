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
//     return Card(
//       elevation: 3,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: Wrap(
//         children: <Widget>[
//           Container(
//             width: MediaQuery.of(context).size.width * 0.9,
//             height: MediaQuery.of(context).size.height * 0.11,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(10)),
//                 gradient: LinearGradient(
//                     begin: Alignment.centerLeft,
//                     end: Alignment.centerRight,
//                     stops: [0.15, 0.4, 0.7, 1],
//                     colors: containercolor)
// //        image: DecorationImage(
// //          image: image(),
// //          fit: BoxFit.fill,
// //        ),
//                 ),
//             child: Center(
//               child: Row(
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.only(left: 30, right: 10.0),
//                     child: new Container(
//                       child: new Image.asset(
//                         'images/Dashboard/undraw_speed_test_wxl0.png',
//                         height: 60.0,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   Flexible(
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 50.0),
//                       child: Text(
//                         res ?? "You are safe",
//                         style: TextStyle(fontSize: 20, color: Colors.black),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );

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
  var tempOfUser = '';
  var dateOfUser = '';
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
    });

    setState(() {
      if (int.parse(dbRef['temp']) < 90) {
        res = 'Safe';

        containercolor = [
          Colors.white,
          Colors.green[100],
          Colors.green[300],
          Colors.green[400]
        ];
      } else {
        res = 'Unsafe';
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
                                  stops: [
                                    0.15,
                                    0.4,
                                    0.7,
                                    1
                                  ],
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
                                padding: const EdgeInsets.only(left:150.0,top: 20),
                                child: Column(
                                  children: [
                                    Text(nameOfUser,
                                        style: TextStyle(fontSize: 16)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                    Text("Temperature: " + tempOfUser,
                                        style: TextStyle(fontSize: 12)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                    Text("Date: " + dateOfUser,
                                        style: TextStyle(fontSize: 12))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   width: MediaQuery.of(context).size.width * 0.9,
                        //   // height: MediaQuery.of(context).size.height * 0.11,
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: Text("Temperature: " + tempOfUser,
                        //         style: TextStyle(fontSize: 14)),
                        //   ),
                        // ),
                        // Container(
                        //   width: MediaQuery.of(context).size.width * 0.9,
                        //   // height: MediaQuery.of(context).size.height * 0.11,
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: Text("Date: " + dateOfUser,
                        //         style: TextStyle(fontSize: 14)),
                        //   ),
                        // ),
                      ],
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        ScanQR(),
                        PdfViewerButton()
                        // UserDetails(),
                      ],
                    ),
                    Row(
                      children: [
                        AdminDetails(),
                        OrganisationPage(),
                      ],
                    ),
                    // PdfViewerButton()
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

// class Buttons extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('DeepBlue'),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(
//               Icons.logout,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               FirebaseAuth.instance.signOut();
//               Navigator.of(context).pushReplacement(
//                   MaterialPageRoute(builder: (context) => Login()));
//             },
//           )
//         ],
//       ),
//       body: Padding(
//         padding:
//             EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20.0, top: 8.0),
//         child: Column(
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: new ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: 1,
//                       itemBuilder: (BuildContext context, int index) {
//                         return Card(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text("Name: " + dbRef['name'],
//                                     style: TextStyle(
//                                         fontSize: 25,
//                                         fontWeight: FontWeight.bold)),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text("Date: " + dbRef['date'],
//                                     style: TextStyle(
//                                       fontSize: 15,
//                                     )),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text(
//                                   "Temperature: " + dbRef['temp'].toString(),
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       }),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Row(
//                       children: [
//                         ScanQR(),
//                         PdfViewerButton()
//                         // UserDetails(),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         AdminDetails(),
//                         OrganisationPage(),
//                       ],
//                     ),
//                     // PdfViewerButton()
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class ScanQR extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, bottom: 2.0, left: 5.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.43,
        height: MediaQuery.of(context).size.height * 0.25,
        child: ElevatedButton(
            onPressed: () {
              // var org = (await FirebaseDatabase.instance
              //           .reference()
              //           .child('users')
              //           .child(user.uid)
              //           .child('org')
              //           .once())
              //       .value;
              //   final prefs = await SharedPreferences.getInstance();
              //   prefs.setString('org', org);
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
      padding: EdgeInsets.only(top: 8.0, bottom: 2.0, left: 5.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.43,
        height: MediaQuery.of(context).size.height * 0.25,
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
            )),
      ),
    );
  }
}

class OrganisationPage extends StatelessWidget {
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
            )),
      ),
    );
  }
}

class PdfViewerButton extends StatelessWidget {
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
