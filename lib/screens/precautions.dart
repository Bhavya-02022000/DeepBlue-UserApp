// import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Dod extends StatefulWidget {
  Dod1 createState() => Dod1();
}

class Dod1 extends State<Dod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
        title: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            "Precautions",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: getListView(),
      backgroundColor: Colors.white,
    );
  }

// ignore: missing_return
  Widget getListView() {
    // ignore: unused_local_variable
    var listView = ListView(
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
          child: Container(
            child: FittedBox(
              child: Material(
                color: Colors.white,
                elevation: 3.0,
                borderRadius: BorderRadius.circular(5.0),
                shadowColor: Colors.grey,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 10.0, right: 40.0),
                      padding: EdgeInsets.only(left: 10.0),
                      width: 60,
                      height: 60,
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(10.0),
                        child: Image(
                          alignment: Alignment.center,
                          image: AssetImage('img/home.png'),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 5.0, right: 20.0, top: 5.0, bottom: 5.0),
                      child: Row(children: <Widget>[
                        Text(
                          "Stay Home, Stay Safe!",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.0,
                            fontFamily: 'KronaOne',
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
          child: Container(
            child: FittedBox(
              child: Material(
                color: Colors.white,
                elevation: 3.0,
                borderRadius: BorderRadius.circular(5.0),
                shadowColor: Colors.grey,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          left: 20.0, right: 5.0, top: 5.0, bottom: 5.0),
                      child: Row(children: <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Wear a mask in public",
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                  fontFamily: 'KronaOne',
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.0, right: 10.0),
                      padding: EdgeInsets.all(10.0),
                      width: 60,
                      height: 60,
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(30.0),
                        child: GestureDetector(
                          child: Image(
                            alignment: Alignment.center,
                            image: AssetImage('img/mask1.png'),
                          ),

                          //link for doctor /medicine
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
          child: Container(
            child: FittedBox(
              child: Material(
                color: Colors.white,
                elevation: 3.0,
                borderRadius: BorderRadius.circular(5.0),
                shadowColor: Colors.grey,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 10.0, right: 40.0),
                      padding: EdgeInsets.only(left: 10.0),
                      width: 60,
                      height: 60,
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(10.0),
                        child: Image(
                          alignment: Alignment.center,
                          image: AssetImage(
                              'img/socialdistance1.png'),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 5.0, right: 20.0, top: 5.0, bottom: 5.0),
                      child: Row(children: <Widget>[
                        Text(
                          "Maintain social distancing",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.0,
                            fontFamily: 'KronaOne',
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
          child: Container(
            child: FittedBox(
              child: Material(
                color: Colors.white,
                elevation: 3.0,
                borderRadius: BorderRadius.circular(5.0),
                shadowColor: Colors.grey,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          left: 20.0, right: 5.0, top: 5.0, bottom: 5.0),
                      child: Row(children: <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Wash your hands regularly",
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                  fontFamily: 'KronaOne',
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.0, right: 10.0),
                      padding: EdgeInsets.all(10.0),
                      width: 60,
                      height: 60,
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(30.0),
                        child: GestureDetector(
                          child: Image(
                            alignment: Alignment.center,
                            image: AssetImage('img/hands1.png'),
                          ),

                          //link for doctor /medicine
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
          child: Container(
            child: FittedBox(
              child: Material(
                color: Colors.white,
                elevation: 3.0,
                borderRadius: BorderRadius.circular(5.0),
                shadowColor: Colors.grey,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 10.0, right: 40.0),
                      padding: EdgeInsets.only(left: 10.0),
                      width: 60,
                      height: 60,
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(10.0),
                        child: Image(
                          alignment: Alignment.center,
                          image: AssetImage('img/travel1.png'),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 5.0, right: 20.0, top: 5.0, bottom: 5.0),
                      child: Row(children: <Widget>[
                        Text(
                          "Avoid using public transport!",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.0,
                            fontFamily: 'KronaOne',
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
          child: Container(
            child: FittedBox(
              child: Material(
                color: Colors.white,
                elevation: 3.0,
                borderRadius: BorderRadius.circular(5.0),
                shadowColor: Colors.grey,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          left: 20.0, right: 5.0, top: 5.0, bottom: 5.0),
                      child: Row(children: <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Sneeze into your elbows!",
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                  fontFamily: 'KronaOne',
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.0, right: 10.0),
                      padding: EdgeInsets.all(10.0),
                      width: 60,
                      height: 60,
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(30.0),
                        child: GestureDetector(
                          child: Image(
                            alignment: Alignment.center,
                            image:
                                AssetImage('img/sneezing1.png'),
                          ),

                          //link for doctor /medicine
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
          child: Container(
            child: FittedBox(
              child: Material(
                color: Colors.white,
                elevation: 3.0,
                borderRadius: BorderRadius.circular(5.0),
                shadowColor: Colors.grey,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 10.0, right: 40.0),
                      padding: EdgeInsets.only(left: 10.0),
                      width: 60,
                      height: 60,
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(10.0),
                        child: Image(
                          alignment: Alignment.center,
                          image: AssetImage('img/doctor1.png'),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 5.0, right: 20.0, top: 5.0, bottom: 5.0),
                      child: Row(children: <Widget>[
                        Text(
                          "Consult a doctor, if sick!",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.0,
                            fontFamily: 'KronaOne',
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
          child: Container(
            child: FittedBox(
              child: Material(
                color: Colors.white,
                elevation: 3.0,
                borderRadius: BorderRadius.circular(5.0),
                shadowColor: Colors.grey,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          left: 20.0, right: 5.0, top: 5.0, bottom: 5.0),
                      child: Row(children: <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Clean vegetables \nbefore using them!",
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 8.0,
                                  fontFamily: 'KronaOne',
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.0, right: 10.0),
                      padding: EdgeInsets.all(10.0),
                      width: 50,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(30.0),
                        child: GestureDetector(
                          child: Image(
                            alignment: Alignment.center,
                            image: AssetImage(
                                'img/vegetables1.png'),
                          ),

                          //link for doctor /medicine
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
          child: Container(
            child: FittedBox(
              child: Material(
                color: Colors.white,
                elevation: 3.0,
                borderRadius: BorderRadius.circular(5.0),
                shadowColor: Colors.grey,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 10.0, right: 40.0),
                      padding: EdgeInsets.only(left: 10.0),
                      width: 60,
                      height: 60,
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(10.0),
                        child: Image(
                          alignment: Alignment.center,
                          image: AssetImage(
                              'img/digital-wallet1.png'),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 5.0, right: 20.0, top: 5.0, bottom: 5.0),
                      child: Row(children: <Widget>[
                        Text(
                          "Use digital payment",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.0,
                            fontFamily: 'KronaOne',
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
    return listView;
  }
}