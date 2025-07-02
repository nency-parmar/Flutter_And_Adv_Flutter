import 'package:flutter/material.dart';
import 'package:flutter_first_project/Lab-9/About.dart';
import 'package:flutter_first_project/Lab-9/Contact.dart';
import 'package:flutter_first_project/Lab-9/Home.dart';

class DiffPagesTabview extends StatelessWidget {
  const DiffPagesTabview({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Different Pages Using Tab Bar View",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blueGrey,
          bottom: TabBar(tabs:
            [Tab(text: 'HOME PAGE',),Tab(text: 'ABOUT PAGE',),Tab(text: 'CONTACT PAGE',),],
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
          ),
        ),
        body: Column(
          children: [
            Text("For Routing In Different Pages Click the Tabs Below Appbar."),
            Expanded(child: TabBarView(children: [Home(),About(),Contact()])),
          ],
        ),
      ),
    );
  }
}
