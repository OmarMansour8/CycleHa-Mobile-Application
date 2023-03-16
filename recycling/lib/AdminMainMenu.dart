import 'dart:convert';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
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

class AdminHomePage extends StatefulWidget {



  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {

  var _index = 0;
  var color = const Color.fromRGBO(220, 238, 255 ,1);
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
  String? selectedValue;
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(


          body:Container(
            color: Colors.grey[100],
            child:Column(
            children: [
              Container(
                // color: Colors.white,
                  height: MediaQuery.of(context).size.height*0.28,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)),
                      color: Colors.white
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                      Row(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height*0.1,
                          )
                        ],
                      ),

                      SizedBox(height: MediaQuery.of(context).size.height*0.004,),

                      Row( 
                        children: [
                          SizedBox(width:MediaQuery.of(context).size.width*0.07 ,),

                          DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              isExpanded: true,
                              hint: Row(
                                children: const [

                                  Center(
                                    child: Text(
                                      'Section 01',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.lightBlueAccent,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              items: items
                                  .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    // fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                                  .toList(),
                              value: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value as String;
                                });
                              },
                              buttonStyleData: ButtonStyleData(
                                height: MediaQuery.of(context).size.height*0.07,
                                width: MediaQuery.of(context).size.width*0.47,
                                padding: const EdgeInsets.only(left: 14, right: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  // border: Border.all(
                                  //   color: Colors.black26,
                                  // ),
                                  color: color,
                                ),
                                elevation: 0,
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                ),
                                iconSize: 25,
                                iconEnabledColor: Colors.black,
                                iconDisabledColor: Colors.grey,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                maxHeight:MediaQuery.of(context).size.height*0.2,
                                width: MediaQuery.of(context).size.width*0.47,

                                padding: null,

                                decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(14),
                                  color: Colors.white,
                                ),
                                elevation: 8,
                                offset: const Offset(0, 0),
                                scrollbarTheme: ScrollbarThemeData(
                                  radius: const Radius.circular(40),
                                  thickness: MaterialStateProperty.all<double>(6),
                                  thumbVisibility: MaterialStateProperty.all<bool>(true),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                                padding: EdgeInsets.only(left: 14, right: 14),
                              ),
                            ),
                          ),
                          SizedBox(width:MediaQuery.of(context).size.width*0.24 ,),

                          CircleAvatar(
                            backgroundImage:
                            NetworkImage('https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',),
                            radius: 30 ,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height*0.006,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width:MediaQuery.of(context).size.width*0.74 ,),

                          Text("Top Achiever",style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      )

                    ],
                  )
              ),
              Container(
                // color:Colors.white,
                     height:MediaQuery.of(context).size.height*0.35 ,
                     width: MediaQuery.of(context).size.width,
                     margin:EdgeInsets.all(MediaQuery.of(context).size.height*0.015) ,
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
                       colors: [
                         Colors.redAccent,

                         Colors.deepOrangeAccent


                       ],
                     )
                     ),

                     child: Column(
                       children: [
                         SizedBox(height:MediaQuery.of(context).size.height*0.035 ,),

                         Row(
                           children: [
                             SizedBox(width:MediaQuery.of(context).size.width*0.1 ,),
                             // Text("omar mansour"),
                             buildExpandedBox(
                               color: Colors.transparent,
                               children: [
                                 buildStackedImages(),
                                 // const SizedBox(height: 16),
                                 // buildStackedImages(direction: TextDirection.rtl),
                               ],
                             ),

                             // SizedBox(width:MediaQuery.of(context).size.width*0.04 ,),
                             // Icon(
                             //   Icons.info_outline_rounded,color: Colors.white,size: 25,
                             //
                             // )
                           ],
                         ),
                         SizedBox(height:MediaQuery.of(context).size.height*0.035 ,),
                         Row(
                           children: [
                             SizedBox(width:MediaQuery.of(context).size.width*0.1 ,),
                             Text("S Teseen Rd - RB1 ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 27),)
                           ],
                         ),
                         SizedBox(height:MediaQuery.of(context).size.height*0.005 ,),
                         Row(
                           children: [
                             SizedBox(width:MediaQuery.of(context).size.width*0.1 ,),
                             Text("Omar Mansour",style: TextStyle(fontSize: 20,color: Colors.white60),)
                           ],
                         ),
                         SizedBox(height:MediaQuery.of(context).size.height*0.025 ,),
                         Row(
                           children: [
                             SizedBox(width:MediaQuery.of(context).size.width*0.12 ,),
                            Text("10 Items",style: TextStyle(color: Colors.white,fontSize: 16),),
                             SizedBox(width:MediaQuery.of(context).size.width*0.28 ,),
                             Text(
                                 "50.0%",
                                 style: new TextStyle(fontSize: 14.0,color: Colors.white),
                               ),
                           ],
                         ),
                         SizedBox(height:MediaQuery.of(context).size.height*0.0001 ,),
                         Row(
                           children: [
                             SizedBox(width:MediaQuery.of(context).size.width*0.1 ,),
                             LinearPercentIndicator(
                               barRadius: Radius.circular(20),
                               width:MediaQuery.of(context).size.width*0.6 ,
                               lineHeight: MediaQuery.of(context).size.height*0.015,
                               percent: 0.52,
                               // center: Text(
                               //   "50.0%",
                               //   style: new TextStyle(fontSize: 12.0),
                               // ),

                               linearStrokeCap: LinearStrokeCap.roundAll,
                               backgroundColor: Colors.white60,
                               progressColor: Colors.white,
                             ),
                             SizedBox(width:MediaQuery.of(context).size.width*0.08 ,),
                             IconButton(
                               onPressed: (){

                               },

                               icon:Icon(Icons.info_outline_rounded,color: Colors.white,size: 25,)

                             )
                           ],
                         )


                       ],
                     ),
              )
            ],
          ),),


        bottomNavigationBar: Container(
        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
        boxShadow: [
        BoxShadow(
        blurRadius: 20,
        color: Colors.black.withOpacity(.1),
    )
    ],
    ),
    child: SafeArea(
    child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
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
    icon: Icons.home,
    text: 'Home',
    ),
    GButton(
    icon: Icons.favorite,
    text: 'Likes',
    ),
    GButton(
    icon: Icons.search,
    text: 'Search',
    ),
    GButton(
    icon: Icons.person,
    text: 'Profile',
    ),
    ],
    selectedIndex: _index,
    onTabChange: (index) {
    setState(() {
    _index = index;
    });
    },
    ),
    ),
    ),
    ),
        ),
    );
  }
}

Widget buildExpandedBox({
  required List<Widget> children,
  required Color color,
}) =>
    Expanded(
      child: Container(
        color: color,
        child: Container(
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );

Widget buildStackedImages({
  TextDirection direction = TextDirection.ltr,
}) {
  final double size = 45;
  final double xShift = 15;
  final urlImages = [
    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    'https://images.unsplash.com/photo-1616766098956-c81f12114571?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  ];

  final items = urlImages.map((urlImage) => buildImage(urlImage)).toList();

  return StackedWidgets(
    direction: direction,
    items: items,
    size: size,
    xShift: xShift,
  );
}

Widget buildImage(String urlImage) {
  final double borderSize = 2;

  return ClipOval(
    child: Container(
      padding: EdgeInsets.all(borderSize),
      color: Colors.deepOrangeAccent,
      child: ClipOval(
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
