import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'utils/utils.dart';

class Report extends StatefulWidget {
  final int pollStation;
  Report(this.pollStation);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  //File imageFile1;
  // Future<File> imageFile2;
  // Future<File> imageFile3;
  // Future<File> imageFile4;
  File _image;
  File _image2;
  File _image3;
  File _image4;
  final picker = ImagePicker();
  int img1 = 0;
  int img2 = 0;
  int img3 = 0;
  int img4 = 0;

  Future pickImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    if (img1 == 0) {
      setState(() {
        _image = File(pickedFile.path);
        img1 = 1;
      });
    } else if (img1 == 1 && img2 == 0) {
      setState(() {
        _image2 = File(pickedFile.path);
        img2 = 1;
      });
    } else if (img1 == 1 && img2 == 1 && img3 == 0) {
      setState(() {
        _image3 = File(pickedFile.path);
        img3 = 1;
      });
    } else if (img1 == 1 && img2 == 1 && img3 == 1 && img4 == 0) {
      setState(() {
        _image4 = File(pickedFile.path);
        img4 = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var hh = MediaQuery.of(context).size.height;
    var ww = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: hh * 0.2,
              width: ww,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [gradientStart, gradientEnd],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.0, 1.0],
                  //  tileMode: TileMode.clamp
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    width: ww,
                    height: hh * 0.3,
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(top: hh * 0.02, right: ww * 0.06),
                    child: Text(
                      "Report Incident",
                      textAlign: TextAlign.right,
                      style:
                          TextStyle(color: Colors.white, fontSize: ww * 0.065),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: Container(
                      margin: EdgeInsets.only(
                        top: hh * 0.02,
                        left: ww * 0.06,
                      ),
                      child: Container(
                        margin: EdgeInsets.only(top: hh * 0.05),
                        child: Card(
                          semanticContainer: true,
                          elevation: 30,
                          color: Colors.grey[300],
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          borderOnForeground: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60)),
                          child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              print('Card tapped.');
                            },
                            child: Container(
                              width: ww * 0.2,
                              height: ww * 0.2,
                              //padding: EdgeInsets.all(ww * 0.04),
                              child: Image(
                                image: AssetImage('images/umb.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: hh * 0.06,
              margin: EdgeInsets.only(left: hh * 0.02, top: hh * 0.06),
              alignment: Alignment.centerLeft,
              child: Text('What happened?'),
            ),
            Container(
              height: hh * 0.35,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              margin: EdgeInsets.only(left: 15, right: 15),
              padding: EdgeInsets.all(8),
              child: TextFormField(
                maxLines: 60,
                decoration: new InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.grey[200],
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 5, bottom: 11, top: 11, right: 15),
                  hintText: 'Describe Incident',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  //  icon: Icon(Icons.account_circle_outlined)
                ),
              ),
            ),
            Container(
              height: hh * 0.06,
              margin: EdgeInsets.only(left: hh * 0.02),
              alignment: Alignment.centerLeft,
              child: Text('Evidence'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: ww * 0.4,
                  height: ww * 0.25,
                  child: _image == null
                      ? Center(child: Text('No image selected.'))
                      : Image.file(
                          _image,
                          fit: BoxFit.cover,
                        ),
                ),
                Container(
                  width: ww * 0.4,
                  height: ww * 0.25,
                  child: _image2 == null
                      ? Center(child: Text('No image selected.'))
                      : Image.file(
                          _image2,
                          fit: BoxFit.cover,
                        ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: ww * 0.4,
                    height: ww * 0.25,
                    child: _image3 == null
                        ? Center(child: Text('No image selected.'))
                        : Image.file(
                            _image3,
                            fit: BoxFit.cover,
                          ),
                  ),
                  Container(
                    width: ww * 0.4,
                    height: ww * 0.25,
                    child: _image4 == null
                        ? Center(child: Text('No image selected.'))
                        : Image.file(
                            _image4,
                            fit: BoxFit.cover,
                          ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    elevation: 0,
                    color: Color.fromRGBO(249, 235, 240, 1),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0)),
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },
                    child: Container(
                      width: ww * 0.35,
                      child: Row(
                        children: <Widget>[
                          new Icon(
                            Icons.image_outlined,
                            color: Colors.black,
                            size: ww / 22,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Add from Gallery',
                              style: new TextStyle(
                                  color: Colors.black,
                                  fontSize: ww / 30,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  RaisedButton(
                    elevation: 0,
                    color: Color.fromRGBO(230, 242, 231, 1),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0)),
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                    child: Container(
                      width: ww * 0.35,
                      child: Row(
                        children: <Widget>[
                          new Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.black,
                            size: ww / 22,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Add from Camera',
                              style: new TextStyle(
                                  color: Colors.black,
                                  fontSize: ww / 30,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: hh * 0.04, bottom: hh * 0.05),
              child: RaisedButton(
                elevation: 20,
                color: gradientEnd,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0)),
                onPressed: () {},
                child: Container(
                  width: ww * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Send',
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: ww / 30,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 10,
                        ),
                        child: new Icon(
                          Icons.send,
                          color: Colors.white,
                          size: ww / 22,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
