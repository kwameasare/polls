import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'utils/utils.dart';

class Pink extends StatefulWidget {
  final int pollStation;
  Pink(this.pollStation);

  @override
  _PinkState createState() => _PinkState();
}

class _PinkState extends State<Pink> {
  File _image;
  File _image2;
  int img1 = 0;
  int img2 = 0;
  final picker = ImagePicker();
  Future pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
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
    }
  }

  @override
  Widget build(BuildContext context) {
    var hh = MediaQuery.of(context).size.height;
    var ww = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: ww,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                      "Pink Sheet",
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
            Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: ww * 0.03, left: ww * 0.08),
                    width: ww,
                    child: Text('Presidential')),
                Container(
                  margin: EdgeInsets.only(top: ww * 0.02),
                  width: ww,
                  height: hh * 0.3,
                  child: _image == null
                      ? Card(
                          margin: EdgeInsets.symmetric(horizontal: ww * 0.2),
                          semanticContainer: true,
                          color: Colors.white,
                          shadowColor: Colors.white,
                          elevation: 0,
                          //  shadowColor: color,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          borderOnForeground: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: InkWell(
                            onTap: () {
                              pickImage();
                            },
                            child: Container(
                              height: hh * 0.28,
                              width: hh * 0.2,
                              padding: EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: hh * 0.07),
                                    child: Icon(
                                      Icons.account_circle_outlined,
                                      color: Colors.grey,
                                      size: 45,
                                    ),
                                  ),
                                  Container(
                                    width: hh * 0.12,
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(top: 8),
                                    child: Text(
                                      'Click To Add Presidential Pink Sheet',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ))
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Card(
                              semanticContainer: true,
                              color: Colors.white,
                              elevation: 20,
                              //  shadowColor: color,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              borderOnForeground: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Image.file(
                                _image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RaisedButton(
                                  elevation: 0,
                                  color: Color.fromRGBO(249, 235, 240, 1),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6.0)),
                                  onPressed: () {
                                    img1 = 0;
                                    pickImage();
                                  },
                                  child: Container(
                                    width: ww * 0.2,
                                    child: Row(
                                      children: <Widget>[
                                        new Icon(
                                          Icons.swap_horiz,
                                          color: Colors.black,
                                          size: ww / 22,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            'Replace',
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
                                  onPressed: () {},
                                  child: Container(
                                    width: ww * 0.2,
                                    child: Row(
                                      children: <Widget>[
                                        new Icon(
                                          Icons.camera_alt_outlined,
                                          color: Colors.black,
                                          size: ww / 22,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            'Submit',
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
                            )
                          ],
                        ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                    margin: EdgeInsets.only(left: ww * 0.08, top: hh * 0.05),
                    width: ww,
                    child: Text('Parliamentary')),
                Container(
                  width: ww,
                  height: hh * 0.3,
                  margin: EdgeInsets.only(top: ww * 0.04),
                  child: _image2 == null
                      ? Card(
                          semanticContainer: true,
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(horizontal: ww * 0.2),
                          elevation: 0,
                          //  shadowColor: color,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          borderOnForeground: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: InkWell(
                            onTap: () {
                              pickImage();
                            },
                            child: Container(
                              height: hh * 0.28,
                              width: hh * 0.2,
                              padding: EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: hh * 0.07),
                                    child: Icon(
                                      Icons.group_outlined,
                                      color: Colors.grey,
                                      size: 45,
                                    ),
                                  ),
                                  Container(
                                    width: hh * 0.12,
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(top: 8),
                                    child: Text(
                                      'Click To Add Parliamentary Pink Sheet',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ))
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Card(
                              semanticContainer: true,
                              color: Colors.white,
                              elevation: 20,
                              //  shadowColor: color,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              borderOnForeground: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Image.file(
                                _image2,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RaisedButton(
                                  elevation: 0,
                                  color: Color.fromRGBO(249, 235, 240, 1),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6.0)),
                                  onPressed: () {
                                    img2 = 0;
                                    pickImage();
                                  },
                                  child: Container(
                                    width: ww * 0.2,
                                    child: Row(
                                      children: <Widget>[
                                        new Icon(
                                          Icons.swap_horiz,
                                          color: Colors.black,
                                          size: ww / 22,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            'Replace',
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
                                  onPressed: () {},
                                  child: Container(
                                    width: ww * 0.2,
                                    child: Row(
                                      children: <Widget>[
                                        new Icon(
                                          Icons.camera_alt_outlined,
                                          color: Colors.black,
                                          size: ww / 22,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            'Submit',
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
                            )
                          ],
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
