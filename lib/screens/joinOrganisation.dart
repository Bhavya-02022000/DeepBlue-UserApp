import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        title: Text('Add Organisation'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: 'Organisation Name'),
              onChanged: (value) {
                setState(() {
                  orgName = value.trim();
                });
              },
              controller: fieldTextName,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: 'Password'),
              onChanged: (value) {
                setState(() {
                  orgPassword = value.trim();
                });
              },
              controller: fieldTextPassword,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                child: Text('Create'),
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
