import'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(

      ),
      appBar: AppBar(
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
      body: CircleAvatar(
      ),
      bottomNavigationBar: Container(
      ),
    );
  }
}
