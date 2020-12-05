import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polls/candidate_results.dart';
import 'package:polls/dummy.dart';

import '../pink.dart';
import '../report.dart';

int mainType;
int pollId;
Color gradientEnd = Color(0xff141E30);
Color gradientStart = Color(0xff243B55);
Widget mainActions(String label, IconData icon, double hh, double ww,
    BuildContext context, Widget view, Color color, Color txtColor, int type) {
  return Container(
    height: hh * 0.3,
    width: hh * 0.2,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
            semanticContainer: true,
            color: color,
            elevation: 0,
            shadowColor: color,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            borderOnForeground: true,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: InkWell(
              onTap: () {
                mainType = type;
                dialog(hh, ww, selectPS(hh, context), context);
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
                        icon,
                        color: txtColor,
                        size: 45,
                      ),
                    ),
                    Container(
                      width: hh * 0.12,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 8),
                      child: Text(
                        label,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, color: txtColor),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ],
    ),
  );
}

dialog(
  double hh,
  double ww,
  Widget view,
  BuildContext context,
) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return new WillPopScope(
        onWillPop: () async => false,
        child: Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: Container(
            height: hh * 0.8,
            width: ww * 0.9,
            child: Padding(
                padding: const EdgeInsets.all(5),
                child: Container(child: view)),
          ),
        ),
      );
    },
  ).then((value) {
    if (mainType == 1) {
      Get.to(Report(pollId));
    } else if (mainType == 2) {
      Get.to(Pink(pollId));
    } else if (mainType == 3) {
      Get.to(CandidateResults(pollId));
    } else if (mainType == 4) {
      Get.to(CandidateResults(pollId));
    }
  });
}

Widget selectPS(double hh, BuildContext context) {
  return Container(
    height: hh * 0.8,
    child: Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: hh * 0.03),
            child: Text('Select Polling Station')),
        Container(
          margin: EdgeInsets.only(top: hh * 0.03),
          height: hh * 0.65,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: ps
                .map((e) => Column(
                      children: [
                        ListTile(
                          title: Text(e.name),
                          onTap: () {
                            pollId = e.id;
                            Navigator.pop(context);
                          },
                        ),
                        Divider()
                      ],
                    ))
                .toList(),
          ),
        )
      ],
    ),
  );
}
