// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:userapp/screens/login.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:userapp/screens/verify.dart';

// class SignUpScreen extends StatefulWidget {
//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   String _email, _password;
//   final auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Signup'),
//         leading: IconButton(
//               icon: Icon(
//                 Icons.arrow_back,
//                 color: Colors.white,
//               ),
//               onPressed: () {
//                 Navigator.of(context).pushReplacement(
//                     MaterialPageRoute(builder: (context) => Login()));
//               },
//             ),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               keyboardType: TextInputType.emailAddress,
//               decoration: InputDecoration(hintText: 'Name'),
//               onChanged: (value) async{
//                 final prefs = await SharedPreferences.getInstance();
//                 prefs.setString('Name', value);
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               keyboardType: TextInputType.emailAddress,
//               decoration: InputDecoration(hintText: 'Email'),
//               onChanged: (value) {
//                 setState(() {
//                   _email = value.trim();
//                 });
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               obscureText: true,
//               decoration: InputDecoration(hintText: 'Password'),
//               onChanged: (value) {
//                 setState(() {
//                   _password = value.trim();
//                 });
//               },
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               ElevatedButton(
//                   child: Text('Back'),
//                   onPressed: () {
//                     Navigator.of(context).pushReplacement(MaterialPageRoute(
//                           builder: (context) => Login()));
//                   }),
//               ElevatedButton(
//                   child: Text('Sign Up'),
//                   onPressed: () {
//                     auth
//                         .createUserWithEmailAndPassword(
//                             email: _email, password: _password)
//                         .then((_) {
//                       Navigator.of(context).pushReplacement(MaterialPageRoute(
//                           builder: (context) => VerifyScreen()));
//                     });
//                   })
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
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
  String _email, _password;
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
                // TextField(
                //   decoration: InputDecoration(hintText: '    Enter your Name'),
                //   style: TextStyle(fontSize: 20.0, color: Colors.white70),
                //   // issecured: false,
                //   onChanged: (value) async {
                //     final prefs = await SharedPreferences.getInstance();
                //     prefs.setString('Name', value);
                //   },
                // ),
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
                          auth
                              .createUserWithEmailAndPassword(
                                  email: _email, password: _password)
                              .then((_) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => VerifyScreen()));
                          });
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
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// class SignUpScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Signup'),
//         leading: IconButton(
//               icon: Icon(
//                 Icons.arrow_back,
//                 color: Colors.white,
//               ),
//               onPressed: () {
//                 Navigator.of(context).pushReplacement(
//                     MaterialPageRoute(builder: (context) => Login()));
//               },
//             ),
//       ),
//       resizeToAvoidBottomInset: false,
//       body: Container(
//         decoration: BoxDecoration(
//          /* image: DecorationImage(
//               image: AssetImage('assets/undraw_my_app_re_gxtj.png'), fit: BoxFit.cover),*/
//           gradient: LinearGradient(
//               colors: [Colors.blue[400], Colors.blue],
//               begin: Alignment.bottomCenter,
//               end: Alignment.topCenter),
//         ),
//         child: Center(
//           child: Column(
//             children: <Widget>[
//               SizedBox(height: 420,),
//               Row(
//                 children: <Widget>[
//                   SizedBox(
//                     width: 110,
//                   ),
//                   Container(

//                       child: Text(
//                       'Create Account',
//                       style: TextStyle(

//                           color: Colors.white,
//                           letterSpacing: 1.5,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 40),
//                     ),
//                   ),
//                 ],

//               ),

//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: DisplayImage(),
//               ),
//               SizedBox(
//                 height: 50,
//               ),
//               TextField(
//                 decoration: InputDecoration(hintText: '    Enter your Name'),
//               //  hintStyle: TextStyle(fontSize: 20.0, color: Colors.white70),
//                 // issecured: false,
//                 onChanged: (value) async{
//                 final prefs = await SharedPreferences.getInstance();
//                 prefs.setString('Name', value);
//               },
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               TextField(
//                 // hint: '    Enter your Email',
//                 // issecured: false,
//                 keyboardType: TextInputType.emailAddress,
//               decoration: InputDecoration(hintText: 'Email'),
//               onChanged: (value) {
//                 setState(() {
//                   _email = value.trim();
//                 });
//               },
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               // CustomTextField(
//               //   hint: '    Enter your Phone',
//               //   issecured: false,
//               // ),
//               // SizedBox(
//               //   height: 15,
//               // ),
//               CustomTextField(
//                 hint: '    Enter your Password',
//                 issecured: true,
//               ),
//               SizedBox(
//                 height: 25,
//               ),  Padding(
//                 padding: const EdgeInsets.only(left: 25, right: 25),
//                 child: ButtonTheme(
//                     buttonColor: Colors.white,
//                     minWidth: MediaQuery.of(context).size.width,
//                     height: 55,
//                     child: RaisedButton(
//                       onPressed: (){
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => HomeScreen()),
//                         );
//                       },
//                       child: Container(
//                         child: Text(
//                           'Create',
//                           style: TextStyle(color: Colors.grey, fontSize: 22),
//                         ),

//                       ),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(25)),
//                     )),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

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
