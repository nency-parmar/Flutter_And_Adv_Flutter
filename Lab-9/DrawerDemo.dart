import 'package:flutter/material.dart';
import 'package:flutter_first_project/Lab-9/About.dart';
import 'package:flutter_first_project/Lab-9/Contact.dart';
import 'package:flutter_first_project/Lab-9/Home.dart';

class DrawerDemo extends StatelessWidget {
  const DrawerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Different Pages Using NavigatorDrawer View"),
        backgroundColor: Colors.blueGrey,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(title: Text('Home Page'),onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home(),));
            },),
            ListTile(title: Text('About Page'),onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => About(),));
            },),
            ListTile(title: Text('Contact Page'),onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Contact(),));
            },)
          ],
        ),
      ),
      body: Center(
        child: Text("For Routing In Different Pages Click the Drawer On Sidebar."),
      )
    );
  }
}