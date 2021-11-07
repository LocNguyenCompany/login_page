import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:async';
import 'page/errorPage.dart';
import 'page/loadPage.dart';
import 'page/mailPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(
        unselectedWidgetColor: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

double _height = 56; // dummy height
GlobalKey _globalKey = GlobalKey();

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _paswordController = TextEditingController();
  void _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text('Please enter all information'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close')),
            ],
          );
        });
  }

  bool _clickEye = true;
  void _toggle() {
    setState(() {
      _clickEye = !_clickEye;
    });
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        // height of the TextFormField is calculated here, and we call setState to assign this value to Button
        _height = _globalKey.currentContext!.size!.height;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
                Container(
                  margin: EdgeInsets.only(top: 100),
                  child: TextField(
                    controller: _emailController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Email",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        suffixIcon: Icon(Icons.email)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: TextField(
                      controller: _paswordController,
                      obscureText: _clickEye,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        suffixIcon: IconButton(
                            onPressed: _toggle,
                            icon: Icon(_clickEye
                                ? Icons.visibility
                                : Icons.visibility_off)),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: SizedBox(
                    width: double.maxFinite,
                    height: _height,
                    // this is the height of TextField
                    child: OutlinedButton(
                        onPressed: () {
                          if (_emailController.text == "" ||
                              _paswordController.text == "") {
                            _showMaterialDialog();
                          } else if (_emailController.text !=
                              _paswordController.text) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ErrorPage()),
                            );
                          } else {
                            //trang  3
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoadPage()),
                            );
                          }
                        },
                        child: Text(
                          "SIGN IN",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.black,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
