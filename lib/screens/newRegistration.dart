import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';


class NewRegistration extends StatelessWidget {
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
                    StaticQR(),
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

class StaticQR extends StatefulWidget {
  @override
  _StaticQRState createState() => _StaticQRState();
}

class _StaticQRState extends State<StaticQR> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: [
                    Text('1. Scan this QR Code'),
                    Container(
                      child: QrImage(
                        data:
                            'converter',
                        version: QrVersions.auto,
                        size: 300.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
