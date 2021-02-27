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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Organisation'),),
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
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                child: Text('Create'),
                onPressed: ()async{
                  final user = FirebaseAuth.instance.currentUser;
                  String date = DateTime.now().toString();
                  var name = (await FirebaseDatabase.instance
                            .reference()
                            .child('users')
                            .child(user.uid)
                            .child('name')
                            .once())
                        .value;
                  FirebaseDatabase.instance.reference().child('adminName').child(user.uid).set({'email':user.email,'org':orgName,'pass':orgPassword});
                  FirebaseDatabase.instance.reference().child('admin').child(orgName).child(date.substring(0, date.indexOf(' '))).child(user.uid).set({'name':name,'temp':''});
                  FirebaseDatabase.instance.reference().child('users').child(user.uid).update({'org':orgName});
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}