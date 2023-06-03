import 'dart:convert';
// import 'package:firebase_database/firebase_database.dart';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:recycling/AdminMainMenu.dart';
import 'package:recycling/utils/stacked_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:recycling/MyAccount.dart';
import 'package:recycling/MyProfile.dart';
import 'package:recycling/Settings.dart';
import 'package:recycling/map.dart';
import 'package:recycling/start.dart';
import 'package:http/http.dart' as http;
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:tab_container/tab_container.dart';

// void main() {
//   runApp(homePage());
// }

class AdminBin1 extends StatefulWidget {
  @override
  State<AdminBin1> createState() => _AdminBin1State();
}

class _AdminBin1State extends State<AdminBin1> {
  // final databaseReference = FirebaseDatabase.instance.ref();
  var _index = 1;
  var color = const Color.fromRGBO(220, 238, 255, 1);
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  var color1 = const Color(0xFF94cfd4);
  var color2 = const Color(0xFF95d3c5);
  String? selectedValue;

  // readData(){
  //   print("mans");
  //   // databaseReference.once().then((snapshot){
  //     print("omar : $snapshot");
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            // shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.only(
            //         bottomLeft: Radius.circular(30),
            //         bottomRight: Radius.circular(30))),
            elevation: 5,
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.white,
            title: Text(
              "Truck",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            actions: [
              Row(
                children: [
                  //   child: IconButton(
                  //       onPressed: () {
                  //        /* Navigator.push(context,
                  //             MaterialPageRoute(builder: (context) => start()));
                  //       */},
                  //       icon: Icon(
                  //         Icons.logout,
                  //         size: 20,
                  //         color: Colors.black,
                  //       )),
                  // )
                ],
              )
            ],
          ),
          body:ListView(
              children:[
                Column(
                  children: [

                    Container(
                      // color: Colors.black45,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,

                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/omar8.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      // color:Colors.white,
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width,
                        margin:
                        EdgeInsets.all(MediaQuery.of(context).size.height * 0.015),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            color: Colors.white,
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: [
                                0.3,

                                // 0.6,
                                0.7,
                              ],
                              colors: [color2, color1],
                            )),

                        child: Column(
                          children: [
                            SizedBox(
                                height: MediaQuery.of(context).size.height * 0.04),
                            Row(
                              children: [
                                SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.1),
                                Text(
                                  "QST-201",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 24),
                                )
                              ],
                            ),
                            SizedBox(
                                height: MediaQuery.of(context).size.height * 0.02),
                            Row(
                              children: [
                                SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.1),
                                Icon(Icons.map_sharp),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.05),
                                Text(
                                  "Madinty, Cairo, Egypt",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            SizedBox(
                                height: MediaQuery.of(context).size.height * 0.02),
                            Row(
                              children: [
                                SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.06),
                                Container(
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            child: CircleAvatar(
                                              backgroundImage:
                                              AssetImage("images/avatar.jpg"),
                                              radius: 35,
                                            ),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Row(children: [
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.03),
                                            Text(
                                              "Driver",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black45),
                                            ),
                                          ]),
                                          SizedBox(
                                              height:
                                              MediaQuery.of(context).size.height *
                                                  0.009),
                                          Row(
                                            children: [
                                              SizedBox(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      0.04),
                                              Text(
                                                "Omar Mansour",
                                                style: TextStyle(fontSize: 18),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context).size.width *
                                              0.2),
                                      Column(
                                        children: [Icon(Icons.fire_truck_sharp)],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.1),
                                  SizedBox(
                                      height: MediaQuery.of(context).size.height * 0.1),
                                  Text("Bins",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
                                ]
                            ),
                            Row(
                              children: [
                                SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.1),
                                Icon(Icons.restore_from_trash),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.05),
                                Text(
                                  "S Teseen Rd - RB1",
                                  style: TextStyle(fontSize: 16),
                                )
                              ],
                            ),
                          ],
                        )
                    ),

                  ],
                ),]),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  gap: 8,
                  activeColor: Colors.black,
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.grey[100]!,
                  color: Colors.black,
                  tabs: [
                    GButton(
                      icon: Icons.delete,
                      text: 'Bin',
                    ),
                    GButton(
                      icon: Icons.fire_truck,
                      text: 'Truck',
                    ),
                    GButton(
                      icon: Icons.person,
                      text: 'user',
                    ),

                  ],
                  selectedIndex: _index,
                  onTabChange: (index) {
                    setState(() {
                      _index = index;
                      if (_index == 0)
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminBin1()));
                      if (_index == 1)
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminBin1()));
                      // if (_index == 2)
                      // Navigator.push(
                      //     context, MaterialPageRoute(builder: (context) =>
                      //     MyProfile(Email: Email,
                      //         Password: Password,
                      //         fullName: fullName,
                      //         mobileNumber: mobileNumber,
                      //         gender: gender,
                      //         dateOfBirth: dateOfBirth,
                      //         user_points: user_points,
                      //         items_recycled: items_recycled,
                      //         data: data)));
                    });
                    // if (_index == 3)                    });
                  },
                ),
              ),
            ),
          ),
        ));
  }
}
