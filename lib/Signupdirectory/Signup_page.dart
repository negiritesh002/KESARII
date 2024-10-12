import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:validate/home/mainhome.dart';

import '../signIndirectory/signin_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _FirstNameController = TextEditingController();
  TextEditingController _MiddleNameController = TextEditingController();
  TextEditingController _LastNameController = TextEditingController();
  TextEditingController _NickNameController = TextEditingController();
  TextEditingController _PhoneNumberController = TextEditingController();
  TextEditingController _EmailAddressController = TextEditingController();
  TextEditingController _PasswordController = TextEditingController();
  TextEditingController _PermanentAddressController = TextEditingController();
  TextEditingController _CurrentAddressController = TextEditingController();
  TextEditingController _ContactNoController = TextEditingController();
  TextEditingController _TypeOfSocietyController = TextEditingController();
  TextEditingController _NameOfSocietyController = TextEditingController();
  TextEditingController _BlockController = TextEditingController();
  TextEditingController _FlatController = TextEditingController();

  String _FirstName = '';
  String _MiddleName = '';
  String _LastName = '';
  String _NickName = '';
  String _PhoneNumber = '';
  String _EmailAddress = '';
  String _Password = '';
  String _PermanentAddress = '';
  String _CurrentAddress = '';
  String _ContactNo = '';
  String _TypeOfSociety = '';
  String _NameOfSociety = '';
  String _Block = '';
  String _Flat = '';
  bool _isLoading = false;
  bool _obscureText = true;
  Future<void> _signup() async {


    setState(() {
      _isLoading = true;
    });

    print("First Name: ${_FirstNameController.text}");
    print("Last Name: ${_LastNameController.text}");
    print("Mobile: ${_PhoneNumberController.text}");
    print("Email: ${_EmailAddressController.text}");
    print("Address: ${_CurrentAddressController.text}");

    final url = 'http://192.168.207.130:8000/signup';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'FirstName': _FirstName,
          'MiddleName': _MiddleName,
          'LastName':_LastName,
          'Nickname': _NickName,
          'MobileNumber': _PhoneNumber,
          'Email': _EmailAddress,
          'CurrentAddress': _CurrentAddress,
          'PermanentAddress': _PermanentAddress,
          'EmergencyNumber': _ContactNo,
          'Password': _Password,
          'ConfirmPassword': _Password,
          'SocietyName': _NameOfSociety,
          'Block': _Block,
          'FlatNumber': _Flat,
        }),
      );
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseBody['Status'])),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Signinpage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Signup failed: ${response.body}')),
        );
      }
    } catch (e) {
      print('Error occurred: $e');
    }


    setState(() {
      _isLoading = false;
    });


  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("image/i15.png"),fit: BoxFit.cover, )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xFF0F52BA),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Create An Account",
                  style: TextStyle(
                      color: Color(0xFF0F52BA),
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 180,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0,left: 10),
                        child: TextFormField(
                          controller: _FirstNameController,
                          decoration: InputDecoration(
                              labelText: "First Name",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 180,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: TextFormField(
                          controller: _MiddleNameController,
                          decoration: InputDecoration(
                              labelText: "Middle Name",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 180,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0,left: 10),
                        child: TextFormField(
                          controller: _LastNameController,
                          decoration: InputDecoration(
                              labelText: "Last Name",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 180,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: TextFormField(
                          controller: _NickNameController,
                          decoration: InputDecoration(
                              labelText: "Nick Name",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 180,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0,left: 10),
                        child: TextFormField(
                          controller: _PhoneNumberController,
                          decoration: InputDecoration(
                              labelText: "Phone Number",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 180,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: TextFormField(
                          controller: _EmailAddressController,
                          decoration: InputDecoration(
                              labelText: "E-mail Address",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: TextFormField(
                    controller: _PasswordController,
                    decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: TextFormField(
                    controller: _PermanentAddressController,
                    decoration: InputDecoration(
                        labelText: "Permanent Address",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: TextFormField(
                    controller: _CurrentAddressController,
                    decoration: InputDecoration(
                        labelText: "Current Address",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: TextFormField(
                    controller: _ContactNoController,
                    decoration: InputDecoration(
                        labelText: "Contact No.",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: TextFormField(
                    controller: _TypeOfSocietyController,
                    decoration: InputDecoration(
                        labelText: "Type of Society",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: TextFormField(
                    controller: _NameOfSocietyController,
                    decoration: InputDecoration(
                        labelText: "Name Of The Society",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 180,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0,left: 10),
                        child: TextFormField(
                          controller: _BlockController,
                          decoration: InputDecoration(
                              labelText: "Block/Tower",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 180,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: TextFormField(
                          controller: _FlatController,
                          decoration: InputDecoration(
                              labelText: "Flat/Villa Number",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(Color(0xFF0F52BA))),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Signinpage()));
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Home(firstName: _FirstName),));
                          setState(() {
                            _FirstName = _FirstNameController.text;
                            _MiddleName = _MiddleNameController.text;
                            _LastName = _LastNameController.text;
                            _NickName = _NickNameController.text;
                            _PhoneNumber = _PhoneNumberController.text;
                            _EmailAddress = _EmailAddressController.text;
                            _Password = _PasswordController.text;
                            _PermanentAddress = _PermanentAddressController.text;
                            _CurrentAddress = _CurrentAddressController.text;
                            _ContactNo = _ContactNoController.text;
                            _TypeOfSociety = _TypeOfSocietyController.text;
                            _NameOfSociety = _NameOfSocietyController.text;
                            _Block = _BlockController.text;
                            _Flat = _FlatController.text;
                          });
                          _signup();
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}