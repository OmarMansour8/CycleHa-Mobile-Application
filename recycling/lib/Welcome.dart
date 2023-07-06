// // import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:recycling/EditProfile.dart';
// import 'package:recycling/MainMenu.dart';
// import 'package:recycling/MyProfile.dart';
// import 'package:recycling/Settings.dart';
// // import 'package:chart_engine/chart_engine.dart';
// import 'package:recycling/map.dart';
//
// class testo extends StatefulWidget {
//   String Email = '';
//   String Password = '';
//   String fullName = '';
//   String mobileNumber = '';
//   String gender = '';
//   String dateOfBirth = '';
//   var user_points;
//   var data;
//   var items_recycled;
//   var metalCount;
//   var plasticCount ;
//
//   testo(
//       {required this.Email,
//         required this.Password,
//         required this.fullName,
//         required this.mobileNumber,
//         required this.gender,
//         required this.dateOfBirth,
//         required this.user_points,
//         required this.items_recycled,
//         required this.data,
//         required this.metalCount,
//         required this.plasticCount
//
//
//       });
//   @override
//   State<testo> createState() => _testoState(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data, metalCount: metalCount, plasticCount: plasticCount);
// }
//
// class _testoState extends State<testo> {
//   String Email = '';
//   String Password = '';
//   String fullName = '';
//   String mobileNumber = '';
//   String gender = '';
//   String dateOfBirth = '';
//   var data;
//   var user_points;
//   var items_recycled;
//   var metalCount;
//   var plasticCount ;
//   _testoState(
//       {required this.Email,
//         required this.Password,
//         required this.fullName,
//         required this.mobileNumber,
//         required this.gender,
//         required this.dateOfBirth,
//         required this.user_points,
//         required this.items_recycled,
//         required this.data,
//         required this.metalCount,
//         required this.plasticCount
//
//       });
//   // void getData() {
//   //   FirebaseFirestore.instance
//   //       .collection('Users')
//   //       .doc(Email)
//   //       .get()
//   //       .then((value) {
//   //     fullName = value.get('Full Name');
//   //     mobileNumber = value.get('Mobile Number');
//   //     gender = value.get('Gender');
//   //     dateOfBirth = value.get('Date Of Birth');
//   //     print(fullName);
//   //     print(mobileNumber);
//   //     print(gender);
//   //     print(dateOfBirth);
//   //   });
//   // }
//   int _index = 2;
//   @override
//   Widget build(BuildContext context) {
//     double height  = MediaQuery.of(context).size.height;
//     double width  = MediaQuery.of(context).size.width;
//
//     // getData();
//
//       final List<ChartData> chartData = [
//         ChartData(1, 35),
//         ChartData(2, 23),
//         ChartData(3, 34),
//         ChartData(4, 25),
//         ChartData(5, 40)
//       ];
//       return Scaffold(
//           body: Center(
//               child: Container(
//                   child: SfCartesianChart(
//                       series: <ChartSeries<ChartData, int>>[
//                         ColumnSeries<ChartData, int>(
//                             dataSource: chartData,
//                             xValueMapper: (ChartData data, _) => data.x,
//                             yValueMapper: (ChartData data, _) => data.y,
//                             // Sets the corner radius
//                             borderRadius: BorderRadius.all(Radius.circular(15))
//                         )
//                       ]
//                   )
//               )
//           )
//       );
//     }
//   }
// }