import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About Us Page"),),
      body: Center(
        child: Stack(
          children: [
            Text("Hello From About Page")
          ],
        ),
      ),
    );
  }
}
