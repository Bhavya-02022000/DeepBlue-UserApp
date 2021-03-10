import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:userapp/screens/constants.dart';

class JoinOrganisationPage extends StatefulWidget {
  @override
  _JoinOrganisationPageState createState() => _JoinOrganisationPageState();
}

class _JoinOrganisationPageState extends State<JoinOrganisationPage> {
  String orgName, orgPassword;
  final fieldTextName = TextEditingController();
  final fieldTextPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Join Organisation'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF64B5F6),
              Color(0xFF90CAF9),
              Color(0xFFBBDEFB),
              Color(0xFFE3F2FD),
            ],
            stops: [0.1, 0.4, 0.7, 0.9],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Image(
                alignment: Alignment.center,
                width: 300,
                height: 230,
                image: AssetImage('img/joinOrg1.jpg'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 60.0,
                decoration: kBoxDecorationStyle,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.business_outlined,
                      color: Colors.white,
                    ),
                    hintText: '    Enter Organisation name',
                    hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                  onChanged: (value) {
                    setState(() {
                      orgName = value.trim();
                    });
                  },
                  controller: fieldTextName,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                alignment: Alignment.centerLeft,
                height: 60.0,
                decoration: kBoxDecorationStyle,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    hintText: 'Enter your Password',
                    hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                  onChanged: (value) {
                    setState(() {
                      orgPassword = value.trim();
                    });
                  },
                  controller: fieldTextPassword,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Text('Join'),
                  onPressed: () async {
                    var fail = 1;
                    final user = FirebaseAuth.instance.currentUser;
                    var uidValue = (await FirebaseDatabase.instance
                            .reference()
                            .child('adminName')
                            .once())
                        .value;
                    for (var keys in uidValue.keys) {
                      print(keys);
                      String date = DateTime.now().toString();
                      var orgNameValue = (await FirebaseDatabase.instance
                              .reference()
                              .child('adminName')
                              .child(keys)
                              .child('org')
                              .once())
                          .value;
                      var orgPassValue = (await FirebaseDatabase.instance
                              .reference()
                              .child('adminName')
                              .child(keys)
                              .child('pass')
                              .once())
                          .value;
                      if (orgPassValue == orgPassword &&
                          orgNameValue == orgName) {
                        print(orgNameValue);
                        print(orgPassValue);
                        FirebaseDatabase.instance
                            .reference()
                            .child('users')
                            .child(user.uid)
                            .update({
                          'org': orgName,
                        });
                        var name = (await FirebaseDatabase.instance
                                .reference()
                                .child('users')
                                .child(user.uid)
                                .child('name')
                                .once())
                            .value;
                        var lastName = (await FirebaseDatabase.instance
                                .reference()
                                .child('users')
                                .child(user.uid)
                                .child('lastName')
                                .once())
                            .value;
                        var temp;
                        try {
                          setState(() async {
                            temp = (await FirebaseDatabase.instance
                                    .reference()
                                    .child('users')
                                    .child(user.uid)
                                    .child('temp')
                                    .once())
                                .value;
                          });
                        } catch (e) {
                          setState(() {
                            temp = '';
                          });
                        }
                        FirebaseDatabase.instance
                            .reference()
                            .child('members')
                            .child(orgName)
                            .child(user.uid)
                            .set({
                          'name': name + '_' + lastName,
                          'temp': 1.1,
                          'date': date.substring(0, date.indexOf(' '))
                        });
                        fieldTextName.clear();
                        fieldTextPassword.clear();
                        showAlertDialog(context);
                        setState(() {
                          fail = 0;
                        });
                      } else {
                        fieldTextName.clear();
                        fieldTextPassword.clear();
                        // showAlertDialogFail(context);
                      }
                    }
                    if (fail == 1) {
                      showAlertDialogFail(context);
                    }
                  },
                )
              ],
            ),
          ],
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
    title: Text("Congratulations!"),
    content: Text("Joined successfully"),
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

showAlertDialogFail(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Error Occured!"),
    content: Text("Please enter valid credentials"),
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
