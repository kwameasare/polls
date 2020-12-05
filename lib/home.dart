import 'package:flutter/material.dart';

import 'utils/utils.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var hh = MediaQuery.of(context).size.height;
    var ww = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: hh * 0.3,
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
                    alignment: Alignment.bottomRight,
                    margin:
                        EdgeInsets.only(bottom: hh * 0.02, right: ww * 0.06),
                    child: Text(
                      "Electoral Agent",
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
              height: ww * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                mainActions('Report Incident', Icons.warning_amber_outlined, hh,
                    ww, context, Home(), Colors.grey[600], Colors.white, 1),
                mainActions(
                    'Pink Sheets',
                    Icons.sticky_note_2_outlined,
                    hh,
                    ww,
                    context,
                    Home(),
                    Color.fromRGBO(249, 235, 240, 1),
                    Colors.pink,
                    2),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                mainActions(
                    'Presidential Results',
                    Icons.account_circle_outlined,
                    hh,
                    ww,
                    context,
                    Home(),
                    Colors.white,
                    Colors.black,
                    3),
                mainActions(
                    'Parliamentary results',
                    Icons.group_outlined,
                    hh,
                    ww,
                    context,
                    Home(),
                    Color.fromRGBO(230, 242, 231, 1),
                    gradientEnd,
                    4),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
