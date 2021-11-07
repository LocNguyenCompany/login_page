import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:async';

import 'package:login_page/page/mailPage.dart';

class LoadPage extends StatefulWidget {
  const LoadPage({Key? key}) : super(key: key);
  @override
  State<LoadPage> createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  @override
  Widget build(BuildContext context) {
    Future fetchStr() async {
      await new Future.delayed(const Duration(seconds: 3), () {});
      return Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MailPage()),
      );
    }

    return Scaffold(
        backgroundColor: Colors.cyan[400],
        body: Center(
          child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        child: Image.asset("images/icon-email.png"),
                        width: 100,
                        height: 100,
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.all(
                              Radius.circular(50.0),
                            ))),
                    Container(
                      padding: EdgeInsets.only(top: 30),
                      child: Text(
                        "SignIn",
                        style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.w100,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                        child: Text(
                      "Speak, friend and enter",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w100,
                      ),
                    )),
                    FutureBuilder(
                      future: fetchStr(),
                      builder: (context, snapshot) {
                        // By default, show a loading spinner
                        return CircularProgressIndicator();
                      },
                    ),
                  ])),
        ));
  }
}
