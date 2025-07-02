// import 'package:advance_flutter_lab/utils/import_export.dart';
//
// class ProfilePageView extends StatelessWidget {
//   const ProfilePageView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Profile Page"),
//         centerTitle: true,
//       ),
//
//       body: Stack(
//         children: [
//           Container(
//             color: Color(0xFFFAF3DD),
//           ),
//           Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(0,10,0,0),
//                 child: Stack(
//                   children: [
//                     ClipPath(
//                       clipper: DiagonalPathClipperTwo(),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(30.0)),
//                           color: Color(0xFF808000),
//                         ),
//                         height: 170,
//                         child: Center(child: Text("")),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(10,10,10,10),
//                       child: ClipPath(
//                         clipper: DiagonalPathClipperTwo(),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.all(Radius.circular(30.0)),
//                             color: Color(0xFFFFC107),
//                           ),
//                           height: 150,
//                           child: Center(child: Text("")),
//                         ),
//                       ),
//                     ),
//
//                     Padding(
//                         padding: const EdgeInsets.all(20.0),
//                         child: SizedBox(
//                           width: 100,
//                           height: 100, // Ensure width == height
//                           child: ClipOval(
//                             child: Image.asset(
//                               'assets/images/myPic.jpg',
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         )
//                     )
//                   ],
//                 ),
//               ),
//               Stack(
//                 children: [
//                   ClipPath(
//                     clipper: RoundedDiagonalPathClipper(),
//                     child: Container(
//                       height: 679,
//                       decoration: BoxDecoration(
//                         // borderRadius: BorderRadius.all(Radius.circular(50.0)),
//                         color:  Color(0xFF808000),
//                       ),
//                       child: Center(child: Text("")),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
//                     child: ClipPath(
//                       clipper: RoundedDiagonalPathClipper(),
//                       child: Container(
//                         height: 620,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(30.0)),
//                           color: Color(0xFFFFC107),
//                         ),
//                         child: Center(child: Text("")),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
