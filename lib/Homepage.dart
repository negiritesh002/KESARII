import 'package:flutter/material.dart';
import 'package:validate/signin_page.dart';

import 'Signup_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              Image(
                image: AssetImage("image/KESARI.jfif"),
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 80,
              ),
              Text(
                "KESARII",
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFFFFF0F5),
                    letterSpacing: 2,
                  shadows: [Shadow(
                    offset: Offset(4.0, 4.0),
                    blurRadius: 20.0,
                    color: Colors.black
                  )]
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: WidgetStatePropertyAll(4),
                          backgroundColor:
                          WidgetStatePropertyAll(Color(0xFF0F52BA))),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return Signinpage();
                          },
                        ));
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(children: <Widget>[
                  Expanded(child: Divider()),
                  Text(
                    "OR",
                    style: TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Expanded(child: Divider()),
                ]),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: WidgetStatePropertyAll(4),
                          backgroundColor:
                          WidgetStatePropertyAll(Color(0xFF0F52BA))),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return SignUp();
                          },
                        ));
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Sign Up To Create New Account",
                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}