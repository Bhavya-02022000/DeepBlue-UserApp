import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:userapp/screens/joinOrganisation.dart';
import 'package:userapp/screens/createOrganisation.dart';

class OrganizationButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Organisation'),
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
                  children: <Widget>[
                    CreateOrganisationButton(),
                    JoinOrganisationButton()
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class JoinOrganisationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, bottom: 2.0, left: 5.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.43,
        height: MediaQuery.of(context).size.height * 0.1,
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => JoinOrganisationPage(),
              ));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                // Image(
                //   alignment: Alignment.center,
                //   image: AssetImage('img/QR.jpg'),
                // ),
                Text('Join Organisation'),
              ],
            )),
      ),
    );
  }
}

class CreateOrganisationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, bottom: 2.0, left: 5.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.43,
        height: MediaQuery.of(context).size.height * 0.1,
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CreateOrganisationPage(),
              ));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                // Image(
                //   alignment: Alignment.center,
                //   image: AssetImage('img/QR.jpg'),
                // ),
                Text('Create Organisation'),
              ],
            )),
      ),
    );
  }
}
