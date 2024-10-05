import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Homepage.dart';

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
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("image/i14.jpg"),fit: BoxFit.cover, )
        ),
        child: Scaffold( backgroundColor: Colors.transparent,body: Homepage()));
  }
}