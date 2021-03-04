import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final user = FirebaseAuth.instance.currentUser;

  final lists = [];
  final keys = [];
  final values = [];
  String data;
  var dbRef;
  @override
  void initState() {
    setState(() {
      dbRef = getdbRef();
    });
    super.initState();
  }

  getdbRef() {
    final dbRef =
        FirebaseDatabase.instance.reference().child('users').child(user.uid);
    return dbRef;
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
                  lists.clear();
                  Map<dynamic, dynamic> value = snapshot.data.value;
                  value.forEach((key, value) {
                    keys.add(key);
                    values.add(value);
                    // keys.sort((b, a) => a.compareTo(b));
                    // int indexOfKeys = keys.indexOf(key);
                    // lists.insert(indexOfKeys, values);
                    // lists.add([key,values]);
                    // if (lists.length > 5) {
                    // lists.removeRange(5, lists.length);
                    // }
                  });
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: new ListView.builder(
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Name: " + values[2] + ' ' +values[1],
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Date: " + values[0],
                                      style: TextStyle(
                                        fontSize: 15,
                                      )),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.all(8.0),
                                //   child: Text(
                                //     "Organisation: " + values[2].toString(),
                                //     style: TextStyle(
                                //       fontSize: 15,
                                //     ),
                                //   ),
                                // ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Temperature: " + values[3].toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  );
                }
                return Center(child: CircularProgressIndicator());
              }
              )
              ),
    );
  }
}
