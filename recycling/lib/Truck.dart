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

class Truck extends StatefulWidget {
  @override
  State<Truck> createState() => _TruckState();
}

class _TruckState extends State<Truck> {
  // final databaseReference = FirebaseDatabase.instance.ref();
  var _index = 1;
  var color = const Color.fromRGBO(220, 238, 255, 1);
  var truckData1;
  List _driverName = [];
  List _ID = [];
  List Location = [];
  List Bin = [];
  List<Widget> Widg =[];
  int enter = 0;
  Future getTruckData() async{
    var url =  Uri.parse(
        'https://phlegmier-marches.000webhostapp.com/getTruck.php');
    var response = await http.post(url,body:{
    }
    );

    // print(json.decode(response.body));
    var data1 = await json.decode(response.body);
    print(data1);
    truckData1=data1;
    print("length ${truckData1.length}");

    print("mamaos ${data1.runtimeType}");
    if(enter == 0){
      getInformation();
      enter++;
    }
    return data1;

    // return json.decode(response.body);
  }

  getInformation(){
    for(int i = 0 ; i<truckData1.length;i++){
      // _driverName.add(truckData1[i]["Bin_Location"]);
      _ID.add(truckData1[i]["Truck_ID"]);
      Bin.add(truckData1[i]["Truck_Location"]);


    }
    // print("bin area $Bin_Area");
    // var Areaname = Bin_Area1.toSet().toList();
    // items=Areaname;

    // for(int i = 0 ; i<binData1.length;i++){
    //   print("dkhlt $i");
    //   Widg.add(
    //     Container(
    //       // color:Colors.white,
    //       height: MediaQuery.of(context).size.height * 0.35,
    //       width: MediaQuery.of(context).size.width,
    //       margin:
    //       EdgeInsets.all(MediaQuery.of(context).size.height * 0.015),
    //       decoration: BoxDecoration(
    //           borderRadius: BorderRadius.all(Radius.circular(25)),
    //           color: Colors.white,
    //           gradient: LinearGradient(
    //             begin: Alignment.bottomCenter,
    //             end: Alignment.topCenter,
    //             stops: [
    //               0.3,
    //
    //               // 0.6,
    //               0.7,
    //             ],
    //             colors: [Colors.redAccent, Colors.deepOrangeAccent],
    //           )),
    //
    //       child: Column(
    //         children: [
    //           SizedBox(
    //             height: MediaQuery.of(context).size.height * 0.035,
    //           ),
    //           Row(
    //             children: [
    //               SizedBox(
    //                 width: MediaQuery.of(context).size.width * 0.1,
    //               ),
    //
    //               Text("Top Achievers:",
    //                 style: TextStyle(fontSize: 20, color: Colors.white60),),
    //               SizedBox(
    //                 width: MediaQuery.of(context).size.width * 0.15,
    //               ),
    //
    //               buildExpandedBox(
    //                 color: Colors.transparent,
    //                 children: [
    //                   buildStackedImages(),
    //                   // const SizedBox(height: 16),
    //                   // buildStackedImages(direction: TextDirection.rtl),
    //                 ],
    //               ),
    //
    //               // SizedBox(width:MediaQuery.of(context).size.width*0.04 ,),
    //               // Icon(
    //               //   Icons.info_outline_rounded,color: Colors.white,size: 25,
    //               //
    //               // )
    //             ],
    //           ),
    //           SizedBox(
    //             height: MediaQuery.of(context).size.height * 0.035,
    //           ),
    //           Row(
    //             children: [
    //               SizedBox(
    //                 width: MediaQuery.of(context).size.width * 0.1,
    //               ),
    //               Text(
    //                 "${_name[i]}",
    //                 style: TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                     color: Colors.white,
    //                     fontSize: 27),
    //               )
    //             ],
    //           ),
    //           SizedBox(
    //             height: MediaQuery.of(context).size.height * 0.005,
    //           ),
    //           Row(
    //             children: [
    //               SizedBox(
    //                 width: MediaQuery.of(context).size.width * 0.1,
    //               ),
    //               Text(
    //                 "${Bin_Area[i]}",
    //                 style: TextStyle(fontSize: 20, color: Colors.white60),
    //               )
    //             ],
    //           ),
    //           SizedBox(
    //             height: MediaQuery.of(context).size.height * 0.025,
    //           ),
    //           Row(
    //             children: [
    //               SizedBox(
    //                 width: MediaQuery.of(context).size.width * 0.1,
    //               ),
    //               Text(
    //                 "Plastic Capacity : ",
    //                 style: TextStyle(color: Colors.white, fontSize: 16),
    //               ),
    //               SizedBox(
    //                 width: MediaQuery.of(context).size.width * 0.28,
    //               ),
    //               Text(
    //                 "${PlasticCapacity[i]}",
    //                 style: new TextStyle(
    //                     fontSize: 18.0, color: Colors.white,fontWeight: FontWeight.bold),
    //               ),
    //             ],
    //           ),
    //           SizedBox(
    //             height: MediaQuery.of(context).size.height * 0.019,
    //           ),
    //           Row(
    //             children: [
    //               SizedBox(
    //                 width: MediaQuery.of(context).size.width * 0.1,
    //               ),
    //               Text(
    //                 "Metal Capacity   : ",
    //                 style: TextStyle(color: Colors.white, fontSize: 16),
    //               ),
    //               SizedBox(
    //                 width: MediaQuery.of(context).size.width * 0.28,
    //               ),
    //               Text(
    //                 "${MetalCapacity[i]}",
    //                 style: new TextStyle(
    //                     fontSize: 18.0, color: Colors.white,fontWeight: FontWeight.bold),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    //   print("widg ${Widg.length}");
    //
    // }



  }



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
          // appBar: AppBar(
          //   // shape: RoundedRectangleBorder(
          //   //     borderRadius: BorderRadius.only(
          //   //         bottomLeft: Radius.circular(30),
          //   //         bottomRight: Radius.circular(30))),
          //   elevation: 5,
          //   iconTheme: IconThemeData(color: Colors.white),
          //   backgroundColor: Colors.white,
          //   title: Text(
          //     "Truck",
          //     style: TextStyle(color: Colors.black),
          //   ),
          //   centerTitle: true,
          //   actions: [
          //     Row(
          //       children: [
          //         //   child: IconButton(
          //         //       onPressed: () {
          //         //        /* Navigator.push(context,
          //         //             MaterialPageRoute(builder: (context) => start()));
          //         //       */},
          //         //       icon: Icon(
          //         //         Icons.logout,
          //         //         size: 20,
          //         //         color: Colors.black,
          //         //       )),
          //         // )
          //       ],
          //     )
          //   ],
          // ),
          body: Stack(children: <Widget>[
            ListView(shrinkWrap: true, children: <Widget>[
              Container(
                  color: Colors.grey[100],
                  child: Column(children: [
                    Container(
                        // color: Colors.white,
                        height: MediaQuery.of(context).size.height * 0.28,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30)),
                            color: Colors.white),
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                // alignment: Alignment.center,

                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.28,
                                    ),
                                    Text(
                                      "Truck",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 34,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.fire_truck,
                                        size: 38,
                                      ),
                                    )
                                  ],
                                )),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.035,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
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
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      width: MediaQuery.of(context).size.width *
                                          0.47,
                                      padding: const EdgeInsets.only(
                                          left: 14, right: 14),
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
                                      maxHeight:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      width: MediaQuery.of(context).size.width *
                                          0.47,
                                      padding: null,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: Colors.white,
                                      ),
                                      elevation: 8,
                                      offset: const Offset(0, 0),
                                      scrollbarTheme: ScrollbarThemeData(
                                        radius: const Radius.circular(40),
                                        thickness:
                                            MaterialStateProperty.all<double>(
                                                6),
                                        thumbVisibility:
                                            MaterialStateProperty.all<bool>(
                                                true),
                                      ),
                                    ),
                                    menuItemStyleData: const MenuItemStyleData(
                                      height: 40,
                                      padding:
                                          EdgeInsets.only(left: 14, right: 14),
                                    ),
                                  ),
                                ),

                              ],
                            ),



                          ],
                        )),


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

                  ]))
            ])
          ]),
          // body:ListView(
          //     children:[
          //       Column(
          //   children: [
          //
          //     Container(
          //       // color: Colors.black45,
          //       width: MediaQuery.of(context).size.width,
          //       height: MediaQuery.of(context).size.height * 0.3,
          //
          //       decoration: BoxDecoration(
          //         image: DecorationImage(
          //           image: AssetImage('images/omar8.jpg'),
          //           fit: BoxFit.fill,
          //         ),
          //       ),
          //     ),
          //     Container(
          //       // color:Colors.white,
          //       height: MediaQuery.of(context).size.height * 0.4,
          //       width: MediaQuery.of(context).size.width,
          //       margin:
          //       EdgeInsets.all(MediaQuery.of(context).size.height * 0.015),
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.all(Radius.circular(25)),
          //           color: Colors.white,
          //           gradient: LinearGradient(
          //             begin: Alignment.bottomCenter,
          //             end: Alignment.topCenter,
          //             stops: [
          //               0.3,
          //
          //               // 0.6,
          //               0.7,
          //             ],
          //             colors: [color2, color1],
          //           )),
          //
          //         child: Column(
          //           children: [
          //             SizedBox(
          //                 height: MediaQuery.of(context).size.height * 0.04),
          //             Row(
          //               children: [
          //                 SizedBox(
          //                     width: MediaQuery.of(context).size.width * 0.1),
          //                 Text(
          //                   "QST-201",
          //                   style: TextStyle(
          //                       fontWeight: FontWeight.bold, fontSize: 24),
          //                 )
          //               ],
          //             ),
          //             SizedBox(
          //                 height: MediaQuery.of(context).size.height * 0.02),
          //             Row(
          //               children: [
          //                 SizedBox(
          //                     width: MediaQuery.of(context).size.width * 0.1),
          //                 Icon(Icons.map_sharp),
          //                 SizedBox(
          //                     width: MediaQuery.of(context).size.width * 0.05),
          //                 Text(
          //                   "Madinty, Cairo, Egypt",
          //                   style: TextStyle(fontSize: 16),
          //                 ),
          //               ],
          //             ),
          //             SizedBox(
          //                 height: MediaQuery.of(context).size.height * 0.02),
          //             Row(
          //               children: [
          //                 SizedBox(
          //                     width: MediaQuery.of(context).size.width * 0.06),
          //                 Container(
          //                   child: Row(
          //                     children: [
          //                       Column(
          //                         children: [
          //                           Container(
          //                             child: CircleAvatar(
          //                               backgroundImage:
          //                               AssetImage("images/avatar.jpg"),
          //                               radius: 35,
          //
          //                             ),
          //                           )
          //                         ],
          //                       ),
          //                       Column(
          //                         children: [
          //                           Row(children: [
          //                             SizedBox(
          //                                 width: MediaQuery.of(context)
          //                                     .size
          //                                     .width *
          //                                     0.03),
          //                             Text(
          //                               "Driver",
          //                               style: TextStyle(
          //                                   fontSize: 16,
          //                                   color: Colors.black45),
          //                             ),
          //                           ]),
          //                           SizedBox(
          //                               height:
          //                               MediaQuery.of(context).size.height *
          //                                   0.009),
          //                           Row(
          //                             children: [
          //                               SizedBox(
          //                                   width: MediaQuery.of(context)
          //                                       .size
          //                                       .width *
          //                                       0.04),
          //                               Text(
          //                                 "Omar Mansour",
          //                                 style: TextStyle(fontSize: 18),
          //                               )
          //                             ],
          //                           )
          //                         ],
          //                       ),
          //                       SizedBox(
          //                           width: MediaQuery.of(context).size.width *
          //                               0.2),
          //                       Column(
          //                         children: [Icon(Icons.fire_truck_sharp)],
          //                       )
          //                     ],
          //                   ),
          //                 )
          //               ],
          //             ),
          //             Row(
          //                 children: [
          //                   SizedBox(
          //                       width: MediaQuery.of(context).size.width * 0.1),
          //                   SizedBox(
          //                       height: MediaQuery.of(context).size.height * 0.1),
          //                   Text("Bins",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
          //                 ]
          //             ),
          //             Row(
          //               children: [
          //                 SizedBox(
          //                     width: MediaQuery.of(context).size.width * 0.1),
          //                 Icon(Icons.restore_from_trash),
          //                 SizedBox(
          //                     width: MediaQuery.of(context).size.width * 0.05),
          //                 Text(
          //                   "S Teseen Rd - RB1",
          //                   style: TextStyle(fontSize: 16),
          //                 )
          //               ],
          //             ),
          //           ],
          //         )
          //     ),
          //
          //   ],
          // ),]),
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
                                builder: (context) => AdminBin()));
                      if (_index == 1)
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Truck()));
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
