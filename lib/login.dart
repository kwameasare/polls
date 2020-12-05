import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:polls/home.dart';
import 'package:polls/utils/utils.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: new Duration(milliseconds: 5000));
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var hh = MediaQuery.of(context).size.height;
    var ww = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: hh,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [gradientStart, gradientEnd],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.0, 1.0],
            //  tileMode: TileMode.clamp
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: hh * 0.15),
                      height: hh * 0.05,
                      child: Text(
                        'Hey there,',
                        style:
                            TextStyle(color: Colors.white, fontSize: ww * 0.08),
                      ),
                    ),
                    Container(
                      height: hh * 0.03,
                      child: Text(
                        'Enter your password to sign in',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: hh * 0.05),
                      child: Card(
                        semanticContainer: true,
                        elevation: 30,
                        color: Colors.grey[300],
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        borderOnForeground: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: InkWell(
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {
                            print('Card tapped.');
                          },
                          child: Container(
                            width: ww * 0.4,
                            height: ww * 0.4,
                            child: Image(
                              image: AssetImage('images/umb.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: hh * 0.05),
                      height: hh * 0.2,
                      child: Lottie.asset(
                        'assets/print.json',
                        height: ww,
                        width: ww,
                        controller: _controller,
                        //fit: BoxFit.fitHeight
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: hh * 0.01),
                      padding: EdgeInsets.only(left: 10),
                      width: ww * 0.7,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        cursorColor: Colors.black,
                        obscureText: true,
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 5, bottom: 11, top: 11, right: 15),
                            hintText: 'Password',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 14),
                            icon: Icon(Icons.lock_outline_sharp)),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: hh * 0.01),
                    child: MaterialButton(
                      height: hh * 0.05,
                      padding: EdgeInsets.all(0),
                      elevation: 20,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      color: gradientStart,
                      onPressed: () {
                        Get.to(Home());
                      },
                      child: Container(
                        padding: EdgeInsets.only(right: 20, left: ww * 0.05),
                        width: ww * 0.36,
                        height: ww * 0.06,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                'Continue',
                                style: new TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            new Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
