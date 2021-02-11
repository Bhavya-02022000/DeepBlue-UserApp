import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final user = FirebaseAuth.instance.currentUser;
  final dbRef = FirebaseDatabase.instance.reference().child('admin');
  final lists = [];
  final keys = [];
  String data;

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
                  lists.clear();
                  Map<dynamic, dynamic> values = snapshot.data.value;
                  values.forEach((key, values) {
                    keys.add(key);
                    keys.sort();
                    int indexOfKeys = keys.indexOf(key);
                    lists.insert(indexOfKeys, values);
                  });
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: new ListView.builder(
                        shrinkWrap: true,
                        itemCount: lists.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Name: " + lists[index]['name'].toString(),
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Temperature: " +
                                        lists[index]['temp'].toString(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Date: " + lists[index]['date'].toString(),
                                      style: TextStyle(fontSize: 15)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      "Status: " +
                                          lists[index]['status'].toString(),
                                      style: TextStyle(fontSize: 15)),
                                ),
                              ],
                            ),
                          );
                        }),
                  );
                }
                return Center(child: CircularProgressIndicator());
              })),
    );
  }
}
