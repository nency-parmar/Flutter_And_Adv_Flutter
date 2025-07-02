import 'package:flutter/material.dart';
class BirthdayCard extends StatelessWidget {
  const BirthdayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Birthday Card For You!!'),
          backgroundColor: Colors.pinkAccent,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.purple[100],
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(4, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'HAPPY BIRTHDAY🎉🎉!!!!\nWishing you a day filled with love and joy!!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Have a Great Day!!💝💝💝💝💝💝\nHope So Your Great Day Filled With\nSo Much Happiness\nAnd Laughing!!\n🎁🥂🎂💝🎂🥂🎁\nGod bless You!!\nEnjoy Your Special Day!!\n🎁🎁🎁🎁',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'You Get All The Success And Joy You Desire for!!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink[700],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}