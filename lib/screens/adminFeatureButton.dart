import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:userapp/screens/admin.dart';
import 'package:userapp/screens/orgMembers.dart';

class AdminFeatureButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Padding(
        padding:
            EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20.0, top: 8.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[ImgClass(), DailyVisitors(), OrgMembers()],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ImgClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image(
          alignment: Alignment.center,
          width: 340,
          height: 300,
          image: AssetImage('img/details.jpg'),
        ),
      ),
    );
  }
}

class DailyVisitors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 18.0, bottom: 2.0, left: 15.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        height: MediaQuery.of(context).size.height * 0.1,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AdminScreen(),
                ));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('Daily Visitors'),
                ],
              )),
        ),
      ),
    );
  }
}

class OrgMembers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 18.0, bottom: 2.0, left: 15.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        height: MediaQuery.of(context).size.height * 0.1,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => OrgMem(),
                ));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('Organisation Members'),
                ],
              )),
        ),
      ),
    );
  }
}
