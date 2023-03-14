import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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

class AdminHomePage extends StatefulWidget {



  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {

  var _index = 0;
  var color = const Color(0xFF228B22);
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(


          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(Icons.home),
                ),
                /*  BottomNavigationBarItem(
                label: "Offers",
                icon: Icon(Icons.local_offer),
              ),*/
                BottomNavigationBarItem(
                  label: "Map",
                  icon: Icon(Icons.location_on),
                ),
                BottomNavigationBarItem(
                  label: "More",
                  icon: Icon(Icons.more_horiz),
                ),
              ],
              currentIndex: _index,
              unselectedItemColor: Colors.black54,
              selectedItemColor: Colors.green,
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
              selectedLabelStyle:
              TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              backgroundColor: Colors.white,
              onTap: (index) {
                setState(() {
                  _index = index;
                  if (_index == 0){}
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => homePage(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data)));
                  if (_index == 1){}
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => maps(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data)));
                  if (_index == 2){}
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (context) => MyProfile(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data)));

                  // if (_index == 3)
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => AddToCart(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, cart: cart, totalAmount: totalAmount, orders: orders)));
                });
              }),

        ));
  }
}
