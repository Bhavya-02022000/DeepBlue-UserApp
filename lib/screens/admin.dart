import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final user = FirebaseAuth.instance.currentUser;
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
  var containercolor = [
    Colors.white,
    Colors.green[100],
    Colors.green[300],
    Colors.green[400]
  ];
  @override
  void initState() {
    getDBRef();
    super.initState();
  }

  getDBRef() async {
    final prefs = await SharedPreferences.getInstance();
    final org = prefs.getString('org') ?? '';
    // final org = 'sakec';
    final dbref =
        FirebaseDatabase.instance.reference().child('admin').child(org);
   
    //  print((await dbref.once()).value);
    setState(() {
      dbRef = dbref;

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
                    if (values != null) {
                      values.forEach((key, value) {
                        // date is direct child of admin
                        date = key;
                        // uidDataOfUser = other children of data =>(uid->data)
                        uidDataOfUser = value;
                        // adding all the dates, uids and data in respective lists
                        dateList.add(date);
                        dateList.sort((b, a) => a.compareTo(b));
                        int indexOfDate = dateList.indexOf(key);
                        uidOfEachUserList.insert(
                            indexOfDate, uidDataOfUser.keys.toList());
                        uidDataOfUserList.insert(
                            indexOfDate, uidDataOfUser.values.toList());
                      });
                      // traverse through all dates
                      for (var i = 0; i < dateList.length; i++) {
                        finalDate = dateList[i].toString();
                        tempListOfUid = uidOfEachUserList[i];
                        tempListOfData = uidDataOfUserList[i];
                        // traverse through all uid
                        for (var j = 0; j < tempListOfUid.length; j++) {
                          // save all the data in variable
                          finalUid = tempListOfUid[j];
                          finalData = tempListOfData[j];
                          nameOfUser = finalData['name'].toString().trim();
                          tempOfUser = finalData['temp'].toString();
                          dateOfUser = finalData['date'].toString();
                          lastNameofUser = finalData['lastName'].toString();
                          // adding all required variables in a string
                          var finalString = [finalDate] +
                              [nameOfUser] +
                              [tempOfUser] +
                              [dateOfUser] +
                              [lastNameofUser];
                          
                          // preparing final list to print
                          finalList.add(finalString);
                        }
                      }
                    }

                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: new ListView.builder(
                          shrinkWrap: true,
                          itemCount: finalList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  // gradient: LinearGradient(
                                  //     begin: Alignment.centerLeft,
                                  //     end: Alignment.centerRight,
                                  //     stops: [0.15, 0.4, 0.7, 1],
                                  //     colors: containercolor)
                                ),
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
                                              'Date: ${finalList[index][0] ?? "Empty"}',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            // child: Text((
                                            //   () {
                                            //   if (double.parse(finalList[index][2]) > 90) {
                                            //     setState(() {
                                            //       containercolor = [
                                            //         Colors.white,
                                            //         Colors.red[100],
                                            //         Colors.red[300],
                                            //         Colors.red[400]
                                            //       ];
                                            //     });
                                            //       return 'Date: ${finalList[index][0] ?? "Empty"}';
                                            //   }
                                            // })(),

                                            //   style: TextStyle(
                                            //         fontSize: 25,
                                            //         fontWeight: FontWeight.bold),),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                'Name: ${(finalList[index][1]).toString().split('_')[0] ?? "Empty"} ${(finalList[index][1]).toString().split('_')[1] ?? "Empty"}',
                                                style: TextStyle(fontSize: 15)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                'Temp: ${finalList[index][2] ?? "Empty"}',
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
