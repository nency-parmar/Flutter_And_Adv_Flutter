import 'dart:io';

import 'package:advance_flutter_lab/utils/import_export.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Page",
          style: TextStyle(fontWeight: FontWeight.bold , fontSize: 30, color: Colors.white),
        ),
        backgroundColor:Colors.black,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            color: Color(0xFFF5F5DC),
          ),
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Stack(
                      children: [
                        ClipPath(
                          clipper: DiagonalPathClipperTwo(),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              color: Color(0xFFC49A93),
                            ),
                            height: 120,
                            child: Center(child: Text("")),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/hehe.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "DHRUVI VALERA",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 30),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("dhruvivalera31@gmail.com"),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      ClipPath(
                        clipper: RoundedDiagonalPathClipper(),
                        child: Container(
                          height: 670,
                          decoration: BoxDecoration(
                            color: Colors.black87,
                          ),
                          child: Center(child: Text("")),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: ClipPath(
                          clipper: RoundedDiagonalPathClipper(),
                          child: Container(
                            height: 650,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              color: Color(0xFFC49A93),
                            ),
                            child: Center(child: Text("")),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 110, 0, 0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    final Uri url = Uri.parse(
                                        'https://www.linkedin.com/in/dhruvi-v-1b44062b5/');
                                    if (await canLaunchUrl(url)) {
                                      await launchUrl(url,
                                          mode: LaunchMode.externalApplication);
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  },
                                  child: SizedBox(
                                    height: height,
                                    width: width,
                                    child: ClipOval(
                                      child: Image.network(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmf9-QeppAe23HuYBPz_0562e0Y8iMAoDj0A&s',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                InkWell(
                                  onTap: () async {
                                    final Uri url = Uri.parse(
                                        'https://github.com/Valeradhruvi');
                                    if (await canLaunchUrl(url)) {
                                      await launchUrl(url,
                                          mode: LaunchMode.externalApplication);
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  },
                                  child: SizedBox(
                                    height: height,
                                    width: width,
                                    child: ClipOval(
                                      child: Image.network(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5SKFmNo0R5wd1scbUVDgmFrqC1u5v3vQoHg&s',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                InkWell(
                                  onTap: () async {
                                    final Uri url = Uri.parse(
                                        ' https://x.com/ValeraDhru42978?t=uCIpdo4o4M7lrQQ0Smwu5g&s=08 ');
                                    if (await canLaunchUrl(url)) {
                                      await launchUrl(url,
                                          mode: LaunchMode.externalApplication);
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  },
                                  child: SizedBox(
                                    height: height,
                                    width: width,
                                    child: ClipOval(
                                      child: Image.network(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkRKyIfKN8kxDoJIBWCRPVYgUpB83GA3p8ABoGUxwPzetedPhGtUIeuxS0IVeKu2_R8Q0&usqp=CAU',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30.0,10,0,0),
                              child: Row(
                                children: [
                                  Text(
                                    "Title: ",
                                    style: TextStyle(
                                        fontSize: 25, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Designer",
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30.0,10,0,0),
                              child: Row(
                                children: [
                                  Text(
                                    "Skills: ",
                                    style: TextStyle(
                                        fontSize: 25, fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            smallButton("C"),
                                            smallButton("JAVA"),
                                            smallButton("FLUTTER"),
                                          ],
                                        ),
                                        SizedBox(width: 5), // Less space between columns
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            smallButton("JS"),
                                            smallButton("MERN"),
                                            smallButton("PYTHON"),
                                          ],
                                        ),
                                        SizedBox(width: 5),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            smallButton("DART"),
                                            smallButton("HTML"),
                                            smallButton("CSS"),
                                          ],
                                        ),
                                      ],
                                    )


                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20,),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30.0,30,30,30),
                              child: Expanded(
                                child: Center(
                                  child: Text(
                                    '"Skilled in mobile app development using Flutter and Dart. Passionate about clean code and smooth user experiences."',
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.clip,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                '"Let the code speak."',
                                style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.clip,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget smallButton(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[300],
          foregroundColor: Colors.black87,
          elevation: 1,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 11, // Smaller font size
          ),
        ),
      ),
    );
  }

}

