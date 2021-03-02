import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class PdfViewer extends StatefulWidget {
  @override
  PdfViewerState createState() => PdfViewerState();
}

class PdfViewerState extends State<PdfViewer> {
  bool isLoading = true;
  PDFDocument doc;

  void loadFromAssets() async {
    setState(() {
      isLoading = true;
    });
    doc = await PDFDocument.fromAsset('assets/text1.pdf');
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    loadFromAssets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('How to use'),),
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // width: MediaQuery.of(context).size.width * 0.43,
        // height: MediaQuery.of(context).size.height * 0.1,
        child: Row(
          children: [
            Flexible(
              flex: 8,
              child: isLoading
                  ? CircularProgressIndicator()
                  : PDFViewer(
                      document: doc,
                    ),
            ),
          ],
        ),
        // child: ElevatedButton(
        //     onPressed: () {
        //       print('Inside onpressed');
        //       loadFromAssets();
        //     },
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: <Widget>[
        //         // Image(
        //         //   alignment: Alignment.center,
        //         //   image: AssetImage('img/userDetails.jpg'),
        //         // ),

        //       ],
        //     )
        //     ),
      ),
    ));
  }
}
