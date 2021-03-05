import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:userapp/screens/login.dart';
import 'package:userapp/screens/verify.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _email, _password, _firstname, _lastname;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Text('Signup'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Login()));
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          /* image: DecorationImage(
              image: AssetImage('assets/undraw_my_app_re_gxtj.png'), fit: BoxFit.cover),*/
          gradient: LinearGradient(
              colors: [
                Color(0xFFE3F2FD),
                Color(0xFFBBDEFB),
                Color(0xFF90CAF9),
                Color(0xFF64B5F6),
              ],

              // colors: [Colors.blue[400], Colors.blue],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter),
        ),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Center(
            child: Column(
              children: <Widget>[
                // SizedBox(
                //   height: 420,
                // ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      height: 110,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold,
                              fontSize: 40),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                  child: DisplayImage(),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    // issecured: false,
                    onChanged: (value) async {
                      setState(() {
                        _firstname = value;
                      });
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setString('Name', value);
                    },

                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        hintText: '    Enter your First Name',
                        hintStyle: TextStyle(
                            fontSize: 18,
                            letterSpacing: 1.5,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        filled: true,
                        hoverColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        fillColor: Colors.white.withOpacity(.3),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(25),
                        )),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    // issecured: false,
                    onChanged: (value) async {
                      setState(() {
                        _lastname = value;
                      });
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setString('LastName', value);
                    },

                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        hintText: '    Enter your Last Name',
                        hintStyle: TextStyle(
                            fontSize: 18,
                            letterSpacing: 1.5,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        filled: true,
                        hoverColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        fillColor: Colors.white.withOpacity(.3),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(25),
                        )),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      setState(() {
                        _email = value.trim();
                      });
                    },
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        hintText: '    Enter your Email',
                        hintStyle: TextStyle(
                            fontSize: 18,
                            letterSpacing: 1.5,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        filled: true,
                        hoverColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        fillColor: Colors.white.withOpacity(.3),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(25),
                        )),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                // CustomTextField(
                //   hint: '    Enter your Phone',
                //   issecured: false,
                // ),
                // SizedBox(
                //   height: 15,
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        _password = value.trim();
                      });
                    },
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        hintText: '    Enter your Password',
                        hintStyle: TextStyle(
                            fontSize: 18,
                            letterSpacing: 1.5,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        filled: true,
                        hoverColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        fillColor: Colors.white.withOpacity(.3),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(25),
                        )),
                  ),
                ),
                // TextField(
                //   // hint: '    Enter your Password',
                //   // issecured: true,
                //   obscureText: true,
                //   decoration: InputDecoration(hintText: 'Password'),
                //   onChanged: (value) {
                //     setState(() {
                //       _password = value.trim();
                //     });
                //   },
                // ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ButtonTheme(
                      buttonColor: Colors.white,
                      minWidth: MediaQuery.of(context).size.width,
                      height: 55,
                      child: RaisedButton(
                        onPressed: () {
                          if (_firstname != null && _lastname != null) {
                            auth
                                .createUserWithEmailAndPassword(
                                    email: _email, password: _password)
                                .then((_) {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => VerifyScreen()));
                            });
                          }
                          else{
                            showAlertDialog(context);
                          }
                        },
                        child: Container(
                          child: Text(
                            'Create',
                            style: TextStyle(color: Colors.grey, fontSize: 22),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                      )),
                ),
                SizedBox(
                  height: 250,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class DisplayImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('img/signup.png'),
      width: 200,
      height: 200,
      fit: BoxFit.fill,
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
    title: Text("Error Occured"),
    content: Text("Please check your first name or last name"),
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

// showAlertDialogFail(BuildContext context) {
//   // set up the button
//   Widget okButton = TextButton(
//     child: Text("OK"),
//     onPressed: () {
//       Navigator.of(context, rootNavigator: true).pop();
//     },
//   );

//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: Text("Error Occured!"),
//     content: Text("Please enter valid Last name"),
//     actions: [
//       okButton,
//     ],
//   );

//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }
