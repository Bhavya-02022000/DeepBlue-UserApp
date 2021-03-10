import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrgMem extends StatefulWidget {
  @override
  _OrgMemState createState() => _OrgMemState();
}

class _OrgMemState extends State<OrgMem> {
  final user = FirebaseAuth.instance.currentUser;
  var dataListOfUser;
  var lst = [];
  Timer timer;

  final dateList = [];
  List uidOfEachUserList = [];
  var finalList = [];
  var uidDataOfUserList = [];
  var tempListOfUid = [];
  var tempListOfData = [];
  var finalDate;
  var finalUid;
  var date;
  Map finalData;
  Map uidDataOfUser;
  var nameOfUser, dateOfUser, tempOfUser;
  var dbref;
  var dbRef;
  var lastNameofUser;
  var newdbRefList = [];
  var colorList = [];
  var colorList1 = [];
  var containerColorGreen = [
    Colors.white,
    Colors.green[100],
    Colors.green[300],
    Colors.green[400]
  ];
  var containerColorRed = [
    Colors.white,
    Colors.red[100],
    Colors.red[300],
    Colors.red[400]
  ];
  var containerColorBlue = [
    Colors.white,
    Colors.blue[100],
    Colors.blue[300],
    Colors.blue[400]
  ];
  @override
  void initState() {
    this.getDBRef();
    try {
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        this.getDBRef();
        lst = [];
        uidOfEachUserList = [];
        finalList = [];
        uidDataOfUserList = [];
        tempListOfUid = [];
        tempListOfData = [];
        newdbRefList = [];
        colorList = [];
        colorList1 = [];
      });
    } catch (e) {}
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  getDBRef() async {
    final prefs = await SharedPreferences.getInstance();
    final org = prefs.getString('org') ?? '';
    // final org = 'sakec';
    final dbref =
        FirebaseDatabase.instance.reference().child('members').child(org);

    setState(() {
      dbRef = dbref;
      lst = [];
      uidOfEachUserList = [];
      finalList = [];
      uidDataOfUserList = [];
      tempListOfUid = [];
      tempListOfData = [];
      newdbRefList = [];
      colorList = [];
      colorList1 = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Details')),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
                future: dbRef.once(),
                builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    Map<dynamic, dynamic> values = snapshot.data.value;
                    lst = [];
                    uidOfEachUserList = [];
                    finalList = [];
                    uidDataOfUserList = [];
                    tempListOfUid = [];
                    tempListOfData = [];
                    newdbRefList = [];
                    colorList = [];
                    colorList1 = [];
                    if (values != null) {
                      values.forEach((key, value) {
                        Map uidDataOfUser = value;
                        if (uidDataOfUser['temp'] == 1.1) {
                          uidDataOfUser['temp'] = 0;
                        }
                        lst.add([
                          uidDataOfUser['date'],
                          uidDataOfUser['temp'],
                          uidDataOfUser['name']
                        ]);
                        if (uidDataOfUser['temp'] != 0) {
                          if (uidDataOfUser['temp'] > 38) {
                            colorList.add(containerColorRed);
                          } else {
                            colorList.add(containerColorGreen);
                          }
                        } else {
                          colorList.add(containerColorBlue);
                        }
                      });
                    }

                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: new ListView.builder(
                          shrinkWrap: true,
                          itemCount: lst.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        stops: [0.15, 0.4, 0.7, 1],
                                        colors: colorList[index])),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Name: ${lst[index][2].toString().split('_')[0] + ' ' + lst[index][2].toString().split('_')[1] ?? 'Empty'}',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                'Temp: ${lst[index][1].toString() ?? 'Empty'}',
                                                style: TextStyle(fontSize: 15)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                'Date: ${lst[index][0] ?? "Empty"}',
                                                style: TextStyle(fontSize: 15)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                })));
  }
}
