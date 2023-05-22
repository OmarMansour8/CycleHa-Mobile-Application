import 'dart:convert';
// import 'package:firebase_database/firebase_database.dart';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:recycling/AdminMainMenu.dart';
import 'package:recycling/Truck.dart';
import 'package:recycling/test.dart';
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

class AdminUserProfile extends StatefulWidget {
  @override
  State<AdminUserProfile> createState() => _AdminUserProfileState();
}

class _AdminUserProfileState extends State<AdminUserProfile> {
  // final databaseReference = FirebaseDatabase.instance.ref();
  var _index = 2;
  int variable = -1;
  var color = const Color.fromRGBO(220, 238, 255, 1);
  var truckData1;
  var driverData;
  List _driverID = [];
  List _driverName = [];
  List _ID = [];
  List Location = [];
  List Bin = [];
  List<Widget> Widg = [];
  int enter = 0;
  var driversData;
  var Email ;
  var Password ;
  var fullName ;
  var mobileNumber ;
  var gender ;
  var location ;
  var dateOfBirth ;
  var data;
  var user_points;
  var items_recycled;
  List<List> binUsedList=[];

  var metalCount;
  var plasticCount ;
  int plasticPoints = 5;
  int metalPoints = 10;
  var plasticData;
  var metalData;
  bool plasticEnter = false;
  bool metalEnter =false;
  TextEditingController mobilenumber = new TextEditingController();
  Future getItemCount(String mobile) async{
    var url =  Uri.parse(
        'https://phlegmier-marches.000webhostapp.com/getPlasticCount.php');
    var response = await http.post(Uri.parse(
        'https://phlegmier-marches.000webhostapp.com/getItemsCount.php'),body:{
      'mobile' : mobile,
      'type' : "plastic"
    }
    );

    // print(json.decode(response.body));
    var data1 = await json.decode(response.body);
    print(data1);
    if(data1.toString() != "Empty"){
      plasticEnter = true;
    }


    var response1 = await http.post(Uri.parse(
        'https://phlegmier-marches.000webhostapp.com/getItemsCount.php'),body:{
      'mobile' : mobile,
      'type' : "metal"
    }
    );

    // print(json.decode(response.body));
    var data2 = await json.decode(response1.body);
    print(data2);
    if(data2.toString() != "Empty"){
      metalEnter = true;
    }

    // return json.decode(response.body);
    plasticCount=0;
    metalCount=0;
    if(plasticEnter){
      for(int i =0; i<data1.length;i++){
        print('omaromar $data2');
        if(data2=='Empty'){
          plasticCount+=0;
        }
        else{
        plasticCount+=int.parse(data1[i]["Item_Amount"]);}
        // metalCount+=int.parse(data2[i]["Item_Amount"]);
      }}
    if(metalEnter){
      for(int i =0; i<data2.length;i++){
        // plasticCount+=int.parse(data1[i]["Item_Amount"]);
        if(data2=='Empty'){
          metalCount+=0;
        }
        else{
        metalCount+=int.parse(data2[i]["Item_Amount"]);}
      }}
    items_recycled = plasticCount+metalCount;
    // user_points = (plasticCount*plasticPoints);
    user_points = (metalCount*metalPoints)+(plasticCount*plasticPoints);

    return user_points;

    // return json.decode(response.body);
  }
  Future getUserData(String mobile) async{
    await getItemCount(mobile);
    var url =  Uri.parse(
        'https://phlegmier-marches.000webhostapp.com/getUserData.php');

    var response = await http.post(url, body: {
      "mobile": mobile,
    }
    );

    // print(json.decode(response.body));
    var data1 = await json.decode(response.body);
    getData(mobile, data1);
    print(data1);
    data=data1;

    print("mamaos ${data1.runtimeType}");

    return data1;

    // return json.decode(response.body);
  }
  getData(String mobile,var data)  {
    Email = data[0]["User_Email"];
    fullName = data[0]["User_Name"];
    mobileNumber = data[0]["User_MobileNumber"];
    dateOfBirth = data[0]["User_DateofBirth"];
    Password = data[0]["User_Password"];
    location = data[0]["User_Location"];


  }

  // Future getDriverData(var driver) async {
  //   var url =
  //       Uri.parse('https://phlegmier-marches.000webhostapp.com/getDriver.php');
  //   var response = await http.post(url, body: {
  //     "driver": driver,
  //   });
  //
  //   // print(json.decode(response.body));
  //   var data1 = await json.decode(response.body);
  //   // print(data1);
  //   print(driver);
  //   print("data : ${data1[0]["Driver_Name"]}");
  //
  //
  //   // if(enter == 0){
  //   //   getInformation();
  //   //   enter++;
  //   // }
  //   return data1;
  //
  //   // return json.decode(response.body);
  // }

  // getInformation()  {
  //   // await getInformation1();
  //
  //   // print("truckdata $truckData1");
  //   for (int i = 0; i < truckData1.length; i++) {
  //
  //     _ID.add(truckData1[i]["Truck_ID"]);
  //     Bin.add(truckData1[i]["Truck_Location"]);
  //     _driverID.add(truckData1[i]["Driver_Id"]);
  //     binUsedList.add([]);
  //
  //   }
  //   print("bin data leb]ngth ${binUsedList.length}");
  //   print(_ID);
  //   print(Bin);
  //   print(_driverID);
  //
  //   for (int i = 0; i < _driverID.length; i++) {
  //     for (int y = 0; y < driversData.length; y++) {
  //       if(_driverID[i]==driversData[y]["Driver_Id"]){
  //         _driverName.add(driversData[y]["Driver_Name"]);
  //       }
  //     }
  //
  //   }
  //   print(_driverName);
  //
  //   for (int i = 0; i < _ID.length; i++) {
  //     for (int y = 0; y < BinData.length; y++) {
  //       if(_ID[i]==BinData[y]["Truck_ID"]){
  //         binUsedList[i].add(BinData[y]["Bin_ID"]);
  //       }
  //     }
  //   }
  //   print('bin data1 $binUsedList');
  //
  //   for (int i = 0; i < _ID.length; i++) {
  //     print("dkhlt $i");
  //     Widg.add(
  //       Container(
  //         // color:Colors.white,
  //         // height: MediaQuery.of(context).size.height * 0.4,
  //           width: MediaQuery.of(context).size.width,
  //           margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.015),
  //           decoration: BoxDecoration(
  //               borderRadius: BorderRadius.all(Radius.circular(25)),
  //               color: Colors.white,
  //               gradient: LinearGradient(
  //                 begin: Alignment.bottomCenter,
  //                 end: Alignment.topCenter,
  //                 stops: [
  //                   0.3,
  //
  //                   // 0.6,
  //                   0.7,
  //                 ],
  //                 colors: [color2, color1],
  //               )),
  //           child: Column(
  //             children: [
  //               SizedBox(height: MediaQuery.of(context).size.height * 0.04),
  //               Row(
  //                 children: [
  //                   SizedBox(width: MediaQuery.of(context).size.width * 0.1),
  //                   Text(
  //                     "${_ID[i]}",
  //                     style:
  //                     TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
  //                   )
  //                 ],
  //               ),
  //               SizedBox(height: MediaQuery.of(context).size.height * 0.02),
  //               Row(
  //                 children: [
  //                   SizedBox(width: MediaQuery.of(context).size.width * 0.1),
  //                   Icon(Icons.map_sharp),
  //                   SizedBox(width: MediaQuery.of(context).size.width * 0.05),
  //                   Text(
  //                     "${Bin[i]}, Cairo, Egypt",
  //                     style: TextStyle(fontSize: 16),
  //                   ),
  //                 ],
  //               ),
  //               SizedBox(height: MediaQuery.of(context).size.height * 0.02),
  //               Row(
  //                 children: [
  //                   SizedBox(width: MediaQuery.of(context).size.width * 0.06),
  //                   Container(
  //                     child: Row(
  //                       children: [
  //                         Column(
  //                           children: [
  //                             Container(
  //                               child: CircleAvatar(
  //                                 backgroundImage:
  //                                 AssetImage("images/avatar.jpg"),
  //                                 radius: 35,
  //                               ),
  //                             )
  //                           ],
  //                         ),
  //                         Column(
  //                           children: [
  //                             Row(children: [
  //                               SizedBox(
  //                                   width: MediaQuery.of(context).size.width *
  //                                       0.03),
  //                               Text(
  //                                 "Driver",
  //                                 style: TextStyle(
  //                                     fontSize: 16, color: Colors.black45),
  //                               ),
  //                             ]),
  //                             SizedBox(
  //                                 height: MediaQuery.of(context).size.height *
  //                                     0.009),
  //                             Row(
  //                               children: [
  //                                 SizedBox(
  //                                     width: MediaQuery.of(context).size.width *
  //                                         0.04),
  //                                 Text(
  //                                   "${_driverName[i]}",
  //                                   style: TextStyle(fontSize: 18),
  //                                 )
  //                               ],
  //                             )
  //                           ],
  //                         ),
  //                         SizedBox(
  //                             width: MediaQuery.of(context).size.width * 0.2),
  //                         Column(
  //                           children: [Icon(Icons.fire_truck_sharp)],
  //                         )
  //                       ],
  //                     ),
  //                   )
  //                 ],
  //               ),
  //               Row(children: [
  //                 SizedBox(width: MediaQuery.of(context).size.width * 0.1),
  //                 SizedBox(height: MediaQuery.of(context).size.height * 0.1),
  //                 Text(
  //                   "Bins",
  //                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  //                 )
  //               ]),
  //               Row(
  //                 children: [
  //                   SizedBox(width: MediaQuery.of(context).size.width * 0.1),
  //                   Icon(Icons.restore_from_trash),
  //                   SizedBox(width: MediaQuery.of(context).size.width * 0.05),
  //                   Column(
  //                     children: [
  //                       for(int y = 0 ; y <binUsedList[i].length;y++)
  //                         Text(
  //                           "${binUsedList[i][y]}",
  //                           style: TextStyle(fontSize: 16),
  //                         )
  //                     ],
  //                     //[[1],[2,3]]
  //                   )
  //
  //                 ],
  //               ),
  //               SizedBox(
  //                 height: MediaQuery.of(context).size.height * 0.03,
  //               )
  //             ],
  //           )),
  //     );
  //     // print("widg ${Widg.length}");
  //   }
  // }

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


//01016606186

  @override
  Widget build(BuildContext context) {

    return Scaffold(

            body: Stack(children: <Widget>[
              ListView(shrinkWrap: true, children: <Widget>[
                Container(
                    color: Colors.grey[100],
                    child: Column(children: [
                      Column(
                            children: [
                              SizedBox(
                                height:
                                MediaQuery.of(context).size.height * 0.03,
                              ),
                              Container(
                                  height:
                                  MediaQuery.of(context).size.height * 0.1,
                                  // alignment: Alignment.center,

                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.28,
                                      ),
                                      Text(
                                        "Users",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 34,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.1,
                                      ),
                                       Icon(
                                          Icons.person,
                                          size: 38,
                                        ),

                                    ],
                                  )),
                              SizedBox(
                                height:
                                MediaQuery.of(context).size.height * 0.005,
                              ),

                                       Container(
                                         width: MediaQuery.of(context).size.width-50,
                                         child: TextField(
                                           controller: mobilenumber,

                                         decoration: InputDecoration(
                                           focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                                           focusColor: Colors.green,
                                           labelStyle: TextStyle(color: Colors.green),
                                           labelText: 'User Mobile Number',
                                           prefixIcon: Icon(Icons.account_circle,color: Colors.green,),),
                                       ),),




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
                                  Container(
                                      margin: EdgeInsets.symmetric(vertical: 8),
                                      width: MediaQuery.of(context).size.width * 0.3,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: SizedBox(height:
                                        MediaQuery.of(context).size.height * 0.07, child:  ElevatedButton(

                                          onPressed: () {
                                            mobileNumber = mobilenumber.text;
                                            setState(() {
                                              getUserData(mobilenumber.text);
                                            });


                                          },
                                          child: Text(
                                            'Search',
                                            style:
                                            TextStyle(color: Colors.white, fontSize: 18),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.green,
                                          ),
                                        )),
                                      ))

                                ],
                              )


//01016606186
                            ],
                          ),
                      FutureBuilder( future: getUserData(mobileNumber),
    builder: (context, snapshot) {
    if (!snapshot.hasData) {

      return Container(
        // color:Colors.white,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Center(
          child: Text("No Data to show",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
        ),
          );


    }

                      return Container(
                        // color:Colors.white,
                        // height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.015),
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
                              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                              Row(
                                children: [
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                                  Text(
                                    "$mobileNumber",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                                  )
                                ],
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Row(
                                children: [
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                                  Icon(Icons.person),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                                  Text(
                                    "$fullName",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Row(
                                children: [
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                                  Icon(Icons.mail),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                                  Text(
                                    "$Email",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Row(
                                children: [
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                                  Icon(Icons.date_range),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                                  Text(
                                    "$dateOfBirth",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Row(
                                children: [
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                                  Icon(Icons.place),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                                  Text(
                                    "$location",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),

                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Row(
                                children: [
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.06),

                                ],
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(height:MediaQuery.of(context).size.height*0.04,),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.43,
                                          child: Center(
                                            child:Text("$items_recycled",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,)),
                                          ),
                                        ),
                                        SizedBox(height:MediaQuery.of(context).size.height*0.009, ),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.43,
                                          child: Center(
                                            child:Text("Recycled",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black38)),
                                          ),
                                        )
                                      ],
                                    ),

                                    Column(
                                      children: [
                                        SizedBox(height:MediaQuery.of(context).size.height*0.04,),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.5,
                                          child: Center(
                                            child:Text("$user_points",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,)),
                                          ),
                                        ),
                                        SizedBox(height:MediaQuery.of(context).size.height*0.009, ),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.5,
                                          child: Center(
                                            child:Text("Points",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black38)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),



                              // Row(children: [
                              //   SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                              //   Text(
                              //     "Items Recycled :",
                              //     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                              //   )
                              // ]),
                              // SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              //
                              // Row(
                              //   children: [
                              //     SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                              //     Text(
                              //       "100",
                              //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              //     ),
                              //   ],
                              // ),SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              // Row(children: [
                              //   SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                              //   Text(
                              //     "User Points :",
                              //     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                              //   )
                              // ]),
                              // SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              //
                              // Row(
                              //   children: [
                              //     SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                              //     Text(
                              //       "100",
                              //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              //     ),
                              //   ],
                              // ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.03,
                              )
                            ],
                          ));

                      })
                      // Container(
                      //     height: MediaQuery.of(context).size.height*0.47,
                      //     child: Center(
                      //   child: Text("No Data to show",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                      // ))

                    ]))
              ])
            ]),

            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
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
                        if (_index == 2)
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) =>AdminUserProfile()));
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

        );
  }
}
