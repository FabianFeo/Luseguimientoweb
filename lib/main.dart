import 'package:flutter/material.dart';
import 'package:luweb/view/pinCode.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PinCode(),
    );
  }
}
