import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

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

  @override
  void dispose() {
    _FirstNameController.dispose();
    _MiddleNameController.dispose();
    _LastNameController.dispose();
    _NickNameController.dispose();
    _PhoneNumberController.dispose();
    _EmailAddressController.dispose();
    _PasswordController.dispose();
    _PermanentAddressController.dispose();
    _CurrentAddressController.dispose();
    _ContactNoController.dispose();
    _TypeOfSocietyController.dispose();
    _NameOfSocietyController.dispose();
    _BlockController.dispose();
    _FlatController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      padding: const EdgeInsets.only(right: 10.0,left: 5),
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
                      padding: const EdgeInsets.only(right: 10.0,left: 5),
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
                      padding: const EdgeInsets.only(right: 10.0,left: 5),
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
                padding: const EdgeInsets.only(left: 20.0,right: 20),
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
                padding: const EdgeInsets.only(left: 20.0,right: 20),
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
                padding: const EdgeInsets.only(left: 20.0,right: 20),
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
                padding: const EdgeInsets.only(left: 20.0,right: 20),
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
                padding: const EdgeInsets.only(left: 20.0,right: 20),
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
                padding: const EdgeInsets.only(left: 20.0,right: 20),
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
                      padding: const EdgeInsets.only(right: 10.0,left: 5),
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
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
