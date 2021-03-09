import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:userapp/screens/constants.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 10),
              child: Image(
                alignment: Alignment.center,
                width: 300,
                height: 230,
                image: AssetImage('img/addOrg.jpg'),
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
                  keyboardType: TextInputType.emailAddress,
                  // decoration: InputDecoration(hintText: 'Organisation Name'),
                  onChanged: (value) {
                    setState(() {
                      orgName = value.trim();
                    });
                  },
                  controller: fieldTextName,
                ),
              ),
            ),

            // SizedBox(height: 6.0),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                alignment: Alignment.centerLeft,
                height: 60.0,
                decoration: kBoxDecorationStyle,
                child: TextField(
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
                  obscureText: true,
                  // decoration: InputDecoration(hintText: 'Password'),
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
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
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
                    var lastname = (await FirebaseDatabase.instance
                            .reference()
                            .child('users')
                            .child(user.uid)
                            .child('lastName')
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
                      var temp = (await FirebaseDatabase.instance
                              .reference()
                              .child('users')
                              .child(user.uid)
                              .child('temp')
                              .once())
                          .value;

                      FirebaseDatabase.instance
                          .reference()
                          .child('admin')
                          .child(orgName)
                          .child(date.substring(0, date.indexOf(' ')))
                          .child(user.uid)
                          .set({'name': name + '_' + lastname, 'temp': temp});
                      FirebaseDatabase.instance
                          .reference()
                          .child('users')
                          .child(user.uid)
                          .update({'org':orgName});

                      FirebaseDatabase.instance
                          .reference()
                          .child('members')
                          .child(orgName)
                          .child(user.uid)
                          .set({
                        'name': name + '_' + lastname,
                        'temp': temp,
                        'date': date.substring(0, date.indexOf(' '))
                      });

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
