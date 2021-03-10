import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:userapp/screens/createOrganisation.dart';
import 'package:userapp/screens/joinOrganisation.dart';

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
                    ImgClass(),
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
                image: AssetImage('img/org.jpg'),
              ),
            ),
    );
  }
}

class JoinOrganisationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        height: MediaQuery.of(context).size.height * 0.1,
        child: Padding(
          padding: const EdgeInsets.only(left:20),
          child: RaisedButton(
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => JoinOrganisationPage(),
                ));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('Join Organisation'),
                ],
              )),
        ),
      ),
    );
  }
}

class CreateOrganisationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Padding(
                  padding: const EdgeInsets.only(left:20),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CreateOrganisationPage(),
                        ));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Create Organisation'),
                        ],
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
