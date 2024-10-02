import 'package:flutter/material.dart';
import 'package:validate/Homepage.dart';
import 'package:validate/signin_page.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: UI(),
  ));
}

class UI extends StatefulWidget {
  const UI({Key? key}) : super(key: key);
  @override
  State<UI> createState() => _validatorState();
}

class _validatorState extends State<UI> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  Widget build(BuildContext context) {
    return Scaffold(body: Homepage());
  }
}
