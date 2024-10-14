import 'dart:typed_data' ;
import'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:validate/home/image_picker.dart';

class Home extends StatefulWidget {
  final String firstName;
  const Home({super.key,required this.firstName});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int myindex = 0;


  final List<String> items = [
    'My Profile',
    'My Documents',
    'Community Forum',
    'Submit A Maintenance Request',
    'Voting And Surveys',
  ];

  Uint8List? _image;

  void selecImage() async{
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color(0xFFA7B8D7),
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    items[index],  // Display each item from the list
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      appBar: AppBar(
        actions: [Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Icon(Icons.notification_add,color: Colors.white,),
        )],
        automaticallyImplyLeading: false,
        title:
        Row(
          children: [
            Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },icon: Icon(Icons.menu,color: Colors.white,size: 30,),
                );
              }
            ),
            SizedBox(
              width: 100,
            ),
            Text("HOME",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
          ],
        ),

        backgroundColor: Color(0xFF0F52BA),
      ),
      body:
      SingleChildScrollView(
        child: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          _image != null ? Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.black54,
                                    width: 4
                                )
                            ),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: MemoryImage(_image!),
                            ),
                          ) :
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.black54,
                                    width: 4
                                )
                            ),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage("image/DefaultProfile.webp"),
                            ),
                          ),
                          Positioned(child: IconButton(onPressed: selecImage,icon: Icon(Icons.add_a_photo),),
                            bottom: -12,left: 70,),
                        ],
                      ),
                      SizedBox(width: 50,),
                      Text("Welcome ${widget.firstName}\n Good Morning",textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 80,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text("Payment due : ₹ 5000", style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                ),

                                SizedBox(
                                  height: 50,
                                  width: 120,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor: WidgetStatePropertyAll(Color(
                                                0xFFDC0E0E))),
                                        onPressed: () {

                                        },
                                        child: Text(
                                          "Pay now",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                 Padding(
                   padding: const EdgeInsets.only(left: 10,right: 10),
                   child: FittedBox(
                     fit: BoxFit.fitWidth,
                     child: Card(
                       elevation: 4,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(15),
                       ),
                       child: Column(
                         children: [
                           Text("Messages",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                           SizedBox(height: 15,),
                           SizedBox(
                             height: 65,
                             child: Padding(
                               padding: const EdgeInsets.only(left: 15.0,right: 15),
                               child: Card(
                                 color: Color(0xFFE3E4FA),
                                 elevation: 4,
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(15),
                                 ),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     CircleAvatar(
                                       radius: 25,
                                       backgroundColor: Color(0xFF0F52BA),
                                       child: Text("U1",style: TextStyle(fontSize: 20,color: Colors.white),),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 20,right: 20),
                                       child: Text("User 1 [Flat 1] : Message 1",style: TextStyle(
                                           fontWeight: FontWeight.bold,fontSize: 18
                                       ),),
                                     )
                                   ],
                                 ),
                               ),
                             ),
                           ),
                           SizedBox(height: 2,),
                           SizedBox(
                             height: 65,
                             child: Padding(
                               padding: const EdgeInsets.only(right: 15,left: 15),
                               child: Card(
                                 color: Color(0xFFE3E4FA),
                                 elevation: 4,
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(15),
                                 ),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     CircleAvatar(
                                       radius: 25,
                                       backgroundColor: Color(0xFF0F52BA),
                                       child: Text("U2",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 20.0,right: 20),
                                       child: Text("User 2 [Flat 2] : Message 2",style: TextStyle(
                                           fontWeight: FontWeight.bold,fontSize: 18
                                       ),),
                                     )
                                   ],
                                 ),
                               ),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top: 10,left: 250.0),
                             child: TextButton(onPressed: () {

                             }, child: Text("Show More",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                           ),
                         ],
                       ),
                     ),
                   ),
                 ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Text("Notices",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Icon(Icons.calendar_today_outlined),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text("Date 1 : Notice 1",style: TextStyle(
                                    fontWeight: FontWeight.bold,fontSize: 18
                                ),),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Icon(Icons.calendar_today_outlined),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text("Date 2 : Notice 2",style: TextStyle(
                                    fontWeight: FontWeight.bold,fontSize: 18
                                ),),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Icon(Icons.calendar_today_outlined),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text("Date 3 : Notice 3",style: TextStyle(
                                    fontWeight: FontWeight.bold,fontSize: 18
                                ),),
                              ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 10,left: 210.0),
                            child: TextButton(onPressed: () {

                            }, child: Text("Show More",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        selectedIconTheme: IconThemeData(color: Colors.black),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        onTap: (index) {
          setState(() {
            myindex = index;
          });
        },
        currentIndex: myindex,
        backgroundColor: Color(0xFF0F52BA),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: "Community"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile"
          )
        ],
      )
    );
  }
}