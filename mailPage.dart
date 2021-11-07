import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:async';
import '../model/checkbox_state.dart';
import '../main.dart';

class MailPage extends StatefulWidget {
  const MailPage({Key? key}) : super(key: key);

  @override
  State<MailPage> createState() => _MailPageState();
}

final checkboxMail = [
  CheckboxState(title: "All inboxes", icon: Icons.inbox),
  CheckboxState(title: "Icloud", icon: Icons.cloud),
  CheckboxState(title: "Gmail", icon: Icons.mail_outline),
  CheckboxState(title: "Hot mail", icon: Icons.home),
  CheckboxState(title: "VIP", icon: Icons.verified),
];

final checkSpecialFolder = [
  CheckboxState(title: "Secure", icon: Icons.security),
  CheckboxState(title: "Notification", icon: Icons.notifications),
];
int _count = 0;

class _MailPageState extends State<MailPage> {
  Widget buildSingelCheckbox(CheckboxState checkbox) => CheckboxListTile(
      secondary: Icon(checkbox.icon),
      //controlAffinity: ListTileControlAffinity.leading,
      activeColor: Colors.blue,
      checkColor: Colors.white,
      value: checkbox.value,
      title: Text(
        (_count++).toString() + " " + checkbox.title,
        style: TextStyle(fontSize: 12),
      ),
      onChanged: (value) => setState(() {
            checkbox.value = value!;
            _count = 0;
          }));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          ),
        ),
        title: Text("MailBoxes"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Container(
            child: Text("Mailboxes"),
          ),
          Divider(),
          ...checkboxMail.map(buildSingelCheckbox).toList(),
          Container(
            child: Text("Special folder"),
          ),
          Divider(),
          ...checkSpecialFolder.map(buildSingelCheckbox).toList(),
        ],
      ),
      floatingActionButton: TextButton(
        onPressed: () {
          deleteList(checkboxMail);
          deleteList(checkSpecialFolder);
          _count = 0;
          setState(() {});
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(""), Text("delete"), Icon(Icons.restore_from_trash)],
        ),
      ),
      bottomNavigationBar: BottomAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  deleteList(List checkbox) {
    for (int i = 0; i < checkbox.length; i++) {
      if (checkbox[i].value == true) {
        checkbox.removeAt(i);
      }
      setState(() {});
    }
  }
}
