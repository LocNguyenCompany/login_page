import 'package:flutter/cupertino.dart';

class CheckboxState {
  final String title;
  bool value;
  IconData icon;

  CheckboxState({
    required this.title,
    this.value = false,
    required this.icon,
  });
}
