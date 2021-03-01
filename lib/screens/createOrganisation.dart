import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateOrganisationPage extends StatefulWidget {
  @override
  _CreateOrganisationPageState createState() => _CreateOrganisationPageState();
}

class _CreateOrganisationPageState extends State<CreateOrganisationPage> {
  String orgName, orgPassword;
  final auth = FirebaseAuth.instance;
  var fail = 0;
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
                  final user = FirebaseAuth.instance.currentUser;
                  String date = DateTime.now().toString();
                  var name = (await FirebaseDatabase.instance
                          .reference()
                          .child('users')
                          .child(user.uid)
                          .child('name')
                          .once())
                      .value;
                  var orgNameDB = (await FirebaseDatabase.instance
                          .reference()
                          .child('admin')
                          .once())
                      .value;
                  var orgNameDBList = [];
                  orgNameDBList.addAll(orgNameDB.keys);
                  print(orgNameDBList);
                  for (var i = 0; i < (orgNameDBList.length); i++) {
                    if (orgNameDBList[i] == orgName) {
                      setState(() {
                        fail = 1;
                      });
                    }
                  }
                  if (fail == 0) {
                    FirebaseDatabase.instance
                        .reference()
                        .child('adminName')
                        .child(user.uid)
                        .set({
                      'email': user.email,
                      'org': orgName,
                      'pass': orgPassword
                    });
                    FirebaseDatabase.instance
                        .reference()
                        .child('admin')
                        .child(orgName)
                        .child(date.substring(0, date.indexOf(' ')))
                        .child(user.uid)
                        .set({'name': name, 'temp': ''});
                    fieldTextName.clear();
                    fieldTextPassword.clear();
                    showAlertDialog(context);
                    // FirebaseDatabase.instance
                    //     .reference()
                    //     .child('users')
                    //     .child(user.uid)
                    //     .update({'org': orgName});
                  } else {
                    fieldTextName.clear();
                    fieldTextPassword.clear();
                    showAlertDialogFail(context);
                    setState(() {
                      fail = 0;
                    });
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
    content: Text("Organisation added successfully"),
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
    content: Text("Organisation name exists. Please enter another name"),
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
