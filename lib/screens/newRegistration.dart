import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:userapp/screens/home.dart';

class NewRegistration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            title: Text('Face Registration QR Code')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),

              child:Center(
                child: Container(
                  child: QrImage(
                    data:
                        'converter',
                    version: QrVersions.auto,
                    size: 300.0,
                  ),
                ),
              ),

        ),
      ),
    );
  }
}

// class StaticQR extends StatefulWidget {
//   @override
//   _StaticQRState createState() => _StaticQRState();
// }

// class _StaticQRState extends State<StaticQR> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Center(
//           // child: Column(
//           // children: [
//           // Text('1. Scan this QR Code'),
//           child: Container(
//             child: QrImage(
//               data: 'converter',
//               version: QrVersions.auto,
//               size: 300.0,
//             ),
//           ),
//           // ],
//           // ),
//         ),
//       ),
//     );
//   }
// }
