import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Signup_page.dart';
import 'mainhome.dart';

class Signinpage extends StatefulWidget {
  const Signinpage({super.key});

  @override
  State<Signinpage> createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {

  TextEditingController _EmailController = TextEditingController();
  TextEditingController _PasswordController = TextEditingController();

  String _Email = '';
  String _Password = '';
  bool isLoading = false;

  Future<void> signIn() async {
    setState(() {
      isLoading = true;
    });

    final url = 'http://192.168.207.130:8000/signin';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': _Email,
        'password': _Password,
      }),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);

      final firstName = responseBody['Firstname'] ?? '';
      final midname = responseBody['MiddleName'] ?? '';
      final lastName = responseBody['LastName'] ?? '';
      final token = responseBody['Token'] ?? '';
      print('Response body: ${response.body}');
      print("First Name: ${firstName}");

      if (token.isNotEmpty) {
        _EmailController.clear();
        _PasswordController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Successfully logged in')),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(
              firstName: firstName,
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed: Invalid token')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: ${response.body}')),
      );
    }

    setState(() {
      isLoading = false;
    });
  }
  @override
  void dispose() {
    _EmailController.dispose();
    _PasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("image/i5.jfif"),fit: BoxFit.cover, )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            backgroundColor: Color(0xFF0F52BA)),
        body: SingleChildScrollView(
          child: Form(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 10),
                      child: Text(
                        "Sign In To Your Existing "
                            "Account",
                        style: TextStyle(
                            color: Color(0xFF0F52BA),
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      controller: _EmailController,
                      decoration: InputDecoration(
                          labelText: "E-mail",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _PasswordController,
                      decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                    SizedBox(height: 30),
                    Container(
                        height: 45,
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                WidgetStatePropertyAll(Color(0xFF0F52BA,))),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return Home(firstName: '',);
                              },));
                              setState(() {
                                _Email = _EmailController.text;
                                _Password = _PasswordController.text;
                                signIn();
                              });

                            },
                            child: Text(
                              "Sign In",
                              style: TextStyle(color: Colors.white),
                            ))),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(onPressed: () {

                    }, child: Text("Forgot Password??",style:TextStyle(color: Colors.black))),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Or",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 70,
                          width: 150,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(Color(0xFF0F52BA))),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Image.asset("image/google.webp",width: 30,height: 30,),
                                  SizedBox(width: 10,),
                                  Text("Google",style: TextStyle(color: Colors.white),)
                                ],
                              )),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        SizedBox(
                          height: 70,
                          width: 150,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(Color(0xFF0F52BA))),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Image.asset("image/facebook.webp",width: 30,height: 30,),
                                  SizedBox(width: 5,),
                                  Text("Facebook",style: TextStyle(color: Colors.white),)
                                ],
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return SignUp();
                            },
                          ));
                        },
                        child: Text("Create New Account!",style:TextStyle(color: Colors.black))),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}