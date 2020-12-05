import 'package:flutter/material.dart';
import 'package:polls/models/model.dart';
import 'package:polls/utils/utils.dart';

import 'dummy.dart';

class CandidateResults extends StatefulWidget {
  final int pollStation;

  CandidateResults(this.pollStation);

  @override
  _CandidateResultsState createState() => _CandidateResultsState();
}

class _CandidateResultsState extends State<CandidateResults> {
  List<Candidate> can;

  @override
  void initState() {
    if (mainType == 3) {
      can = prez;
    } else if (mainType == 4) {
      can = par;
    }
    super.initState();
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
                      "Results",
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
              height: hh * 0.8,
              child: ListView(
                children: can
                    .map((e) => Container(
                          height: ww * 0.375,
                          child: Row(
                            children: [
                              Card(
                                margin: EdgeInsets.only(
                                    top: ww * 0.056, left: ww * 0.056),
                                semanticContainer: true,
                                elevation: 0,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                borderOnForeground: true,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: InkWell(
                                  splashColor: Colors.blue.withAlpha(30),
                                  onTap: () {
                                    print('Card tapped.');
                                  },
                                  child: Container(
                                    width: ww * 0.2,
                                    height: ww * 0.25,
                                    child: Image(
                                      image: AssetImage(e.thumb),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: ww * 0.4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: ww * 0.1,
                                      margin: EdgeInsets.only(
                                          left: ww * 0.058, top: ww * 0.12),
                                      child: Text(
                                        e.name,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    // Container(
                                    //   height: ww * 0.01,
                                    //   margin: EdgeInsets.only(
                                    //     left: ww * 0.076,
                                    //     top: 10,
                                    //   ),
                                    // ),
                                    Row(
                                      children: [
                                        Card(
                                          margin:
                                              EdgeInsets.only(left: ww * 0.056),
                                          semanticContainer: true,
                                          elevation: 0,
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          borderOnForeground: true,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: InkWell(
                                            splashColor:
                                                Colors.blue.withAlpha(30),
                                            onTap: () {
                                              print('Card tapped.');
                                            },
                                            child: Container(
                                              width: ww * 0.1,
                                              height: ww * 0.1,
                                              child: Image(
                                                image: AssetImage(e.flag),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                            height: ww * 0.1,
                                            width: ww * 0.22,
                                            margin: EdgeInsets.only(left: 8),
                                            child: Text(
                                              e.party,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: ww * 0.1,
                                    margin: EdgeInsets.only(
                                        left: ww * 0.025,
                                        top: ww * 0.12,
                                        bottom: ww * 0.028),
                                    child: Container(
                                      margin: EdgeInsets.only(top: hh * 0.01),
                                      padding: EdgeInsets.only(left: 10),
                                      width: ww * 0.25,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.4),
                                              spreadRadius: 2,
                                              blurRadius: 25,
                                              offset: Offset(5,
                                                  5), // changes position of shadow
                                            ),
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8))),
                                      alignment: Alignment.centerLeft,
                                      child: TextFormField(
                                        cursorColor: Colors.black,
                                        maxLength: 6,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                        decoration: new InputDecoration(
                                          border: InputBorder.none,
                                          counterText: '',
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                              left: 5,
                                              bottom: 11,
                                              top: 11,
                                              right: 15),
                                          hintText: 'Enter Result',
                                          hintStyle: TextStyle(
                                              color: Colors.grey, fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
