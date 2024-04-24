import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2835a9),
        title: Text(
          "Inovatech Moreno0393",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
