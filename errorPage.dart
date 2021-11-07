import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:async';

double _height = 56;

class ErrorPage extends StatefulWidget {
  const ErrorPage({Key? key}) : super(key: key);
  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.cyan[400],
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
          child: Padding(
              padding: EdgeInsets.all(50),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        child: Image.asset("images/icon-vertical.png"),
                        width: 150,
                        height: 150,
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.all(
                              Radius.circular(50.0),
                            ))),
                    Container(
                      padding: EdgeInsets.only(top: 100),
                      child: Text(
                        "UPS...couldn't Sign in",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                        child: Text(
                      "Your username and password don't match",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w100,
                      ),
                    )),
                    Container(
                        child: Text(
                      "Please try again",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w100,
                      ),
                    )),
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      child: SizedBox(
                        width: double.maxFinite,
                        height: _height,
                        // this is the height of TextField
                        child: OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "TRY AGAIN",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.black,
                            )),
                      ),
                    ),
                  ]))),
    );
  }
}
