import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:recycling/MainMenu.dart';
import 'package:recycling/MyAccount.dart';
import 'package:recycling/Personal_Info.dart';
import 'package:recycling/Settings.dart';
import 'package:recycling/SignIn.dart';
import 'package:recycling/map.dart';
import 'package:recycling/points_services.dart';
import 'package:recycling/sSignInPage.dart';

// void main() {
//   runApp(homePage());
// }

class MyProfile extends StatefulWidget {
  String Email = '';
  String Password = '';
  String fullName = '';
  String mobileNumber = '';
  String gender = '';
  String dateOfBirth = '';
  var user_points;
  var data;
  var items_recycled;
  var metalCount;
  var plasticCount ;
  var location;


  MyProfile(
      {required this.Email,
        required this.Password,
        required this.fullName,
        required this.mobileNumber,
        required this.gender,
        required this.dateOfBirth,
        required this.user_points,
        required this.items_recycled,
        required this.data,
        required this.metalCount,
        required this.plasticCount,
        required this.location


      });

  @override
  State<MyProfile> createState() => _MyProfileState(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data, metalCount: metalCount, plasticCount: plasticCount, location: location);
}

class _MyProfileState extends State<MyProfile> {
  String Email = '';
  String Password = '';
  String fullName = '';
  String mobileNumber = '';
  String gender = '';
  String dateOfBirth = '';
  var data;
  var user_points;
  var items_recycled ;
  var metalCount;
  var plasticCount ;
  var location;

  _MyProfileState(
      {required this.Email,
        required this.Password,
        required this.fullName,
        required this.mobileNumber,
        required this.gender,
        required this.dateOfBirth,
        required this.user_points,
        required this.items_recycled,
        required this.data,
        required this.metalCount,
        required this.plasticCount,
        required this.location

      }); //  late WebViewController controller;
  var _index = 2;



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double height  = MediaQuery.of(context).size.height;
    double width  = MediaQuery.of(context).size.width;

    // getData();
    return Scaffold(
      body: ListView(children: [
        Container(
          height: MediaQuery.of(context).size.height*0.9999,
          decoration: BoxDecoration(
              color: Color.fromRGBO(64, 168, 88, 1)
          ),
          child: Column(
            children: [
              Container(
                height:height*0.5,
                width: width*0.999,
                decoration: BoxDecoration(
                  // color: Colors.black
                ),

                child: Column(
                  children: [
                    SizedBox(height: height*0.1,),
                    // Row(
                    //   children: [
                    //     SizedBox(width: width*0.83,),
                    //     IconButton(
                    //       icon:Icon(Icons.settings,size: 30,color: Colors.white,),
                    //       onPressed: (){
                    //         Navigator.push(
                    //             context, MaterialPageRoute(builder: (context) => MyProfile(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data)));                        },),
                    //   ],
                    // ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.22,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SizedBox(width: MediaQuery.of(context).size.width*0.33,),
                          CircleAvatar(

                            backgroundImage:
                            AssetImage("images/avatar.jpg"),
                            radius: 70,

                          )
                        ],
                      ),
                    ),
                    // Container(
                    //   child: Row(
                    //     children: [
                    //       SizedBox(width:MediaQuery.of(context).size.width*0.25 ,),
                    //       Container(width: MediaQuery.of(context).size.width*0.5,
                    //         height: MediaQuery.of(context).size.height*0.03,
                    //         child: Center(
                    //           child: Text("$fullName",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                    //         ),
                    //       ),
                    //
                    //     ],
                    //   ),
                    //
                    //
                    // ),
                    // Container(
                    //   child: Row(
                    //     children: [
                    //       SizedBox(width:MediaQuery.of(context).size.width*0.25 ,),
                    //       Container(width: MediaQuery.of(context).size.width*0.5,
                    //         height: MediaQuery.of(context).size.height*0.03,
                    //         child: Center(
                    //           child: Text("Egypt"),
                    //         ),
                    //       ),
                    //
                    //     ],
                    //   ),
                    //
                    //
                    // ),
                    SizedBox(height: height*0.02,),

                    Container(
                      width: width*0.9999,
                      height: height*0.15,
                      margin: EdgeInsets.only(left: 10,right: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Column(

                              children: [
                                SizedBox(height: height*0.02,),
                                Image.asset("images/coin6.jpg",height: 50,width: 45,),
                                SizedBox(height: height*0.01,),
                                Text("$user_points",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black38)),

                              ],
                            ),
                          ),

                          Container(
                            child: Column(
                              children: [
                                SizedBox(height: height*0.02,),
                                Image.asset("images/bottle6.jpg",height: 50,width:80,),
                                SizedBox(height: height*0.01,),
                                Text("$plasticCount",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black38)),

                              ],
                            ),
                          ),

                          Container(
                            child: Column(
                              children: [
                                SizedBox(height: height*0.02,),
                                Image.asset("images/can3.jpg",height: 50,width: 50,),
                                SizedBox(height: height*0.01,),
                                Text("$metalCount",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black38)),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),


              ),
              Container(
                // margin: EdgeInsets.only(left: 10,right: 10),
                height:height*0.405,
                width: width*0.999,
                margin: EdgeInsets.only(left: 10,right : 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30))

                ),
                child: Column(
                  children: [
                    SizedBox(height: height*0.05,),
                    GestureDetector(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Padding(padding: EdgeInsets.only(left: 25)),
                              Icon(Icons.account_circle_outlined, color: Color.fromRGBO(64, 168, 88, 1),size:30),
                              SizedBox(width: 20,),
                              Text("Personal Info",style: TextStyle(/*fontWeight: FontWeight.bold,*/fontSize: 20,color: Colors.black)),

                            ],),
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              child:Icon(Icons.arrow_forward_ios_outlined, color: Color.fromRGBO(64, 168, 88, 1),size:20),

                            )

                          ],
                        ),
                      ),
                      onTap: (){

                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => personal_info(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data, metalCount: metalCount, plasticCount: plasticCount, location: location)));
                      },
                    ),
                    SizedBox(height: height*0.05,),
                    GestureDetector(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Padding(padding: EdgeInsets.only(left: 25)),
                              Icon(Icons.settings_suggest_outlined, color: Color.fromRGBO(64, 168, 88, 1),size:30),
                              SizedBox(width: 20,),
                              Text("Account Settings",style: TextStyle(/*fontWeight: FontWeight.bold,*/fontSize: 20,color: Colors.black)),

                            ],),
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              child:Icon(Icons.arrow_forward_ios_outlined, color: Color.fromRGBO(64, 168, 88, 1),size:20),

                            )

                          ],
                        ),
                      ),
                      onTap: (){

                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => setting(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data, metalCount: metalCount, plasticCount: plasticCount)));
                      },
                    ),
                    SizedBox(height: height*0.06,),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 12),
                        width: width * 0.79,
                        decoration: BoxDecoration(
                          // border: Border.all(color: Color.fromRGBO(64, 168, 88, 1),/*style: BorderStyle.solid,*/width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(height: 55, child:  ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Sign_In1()));
                              // showAlertDialog(context);
                              // SendData();
                              // getUserData(mobile.text,mobile.text);
                              // getData(mobile.text);

                            },
                            child: Text(
                              'Logout',
                              style:
                              TextStyle(color: Colors.white, fontSize: 23),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(64, 168, 88, 1),
                            ),
                          )),
                        )),
                    // Container(
                    //   child: Row(
                    //     children: [
                    //       Column(
                    //         children: [
                    //           SizedBox(height:MediaQuery.of(context).size.height*0.04,),
                    //           Container(
                    //             width: MediaQuery.of(context).size.width*0.499,
                    //             child: Center(
                    //               child:Text("$items_recycled",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,)),
                    //             ),
                    //           ),
                    //           SizedBox(height:MediaQuery.of(context).size.height*0.009, ),
                    //           Container(
                    //             width: MediaQuery.of(context).size.width*0.45,
                    //             child: Center(
                    //               child:Text("Recycled",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black38)),
                    //             ),
                    //           )
                    //         ],
                    //       ),
                    //       Column(
                    //         children: [
                    //           SizedBox(height:MediaQuery.of(context).size.height*0.04,),
                    //           Container(
                    //             width: MediaQuery.of(context).size.width*0.5,
                    //             child: Center(
                    //               child:Text("$user_points",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,)),
                    //             ),
                    //           ),
                    //           SizedBox(height:MediaQuery.of(context).size.height*0.009, ),
                    //           Container(
                    //             width: MediaQuery.of(context).size.width*0.5,
                    //             child: Center(
                    //               child:Text("Points",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black38)),
                    //             ),
                    //           )
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),


                    // Container(
                    //   width: width*0.9999,
                    //   height: height*0.15,
                    //   margin: EdgeInsets.only(left: 5,right: 5),
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.all(Radius.circular(30))
                    //   ),
                    //   child: Row(
                    //     children: [
                    //       SizedBox(width: width*0.1,),
                    //       Container(
                    //         child: Column(
                    //           children: [
                    //             SizedBox(height: height*0.02,),
                    //             Image.asset("images/coin.jpg",height: 50,width: 50,),
                    //             SizedBox(height: height*0.01,),
                    //             Text("360",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black38)),
                    //
                    //           ],
                    //         ),
                    //       ),
                    //
                    //       SizedBox(width: width*0.2,),
                    //       Container(
                    //         child: Column(
                    //           children: [
                    //             SizedBox(height: height*0.02,),
                    //             Image.asset("images/bottle1.jpg",height: 50,width: 60,),
                    //             SizedBox(height: height*0.01,),
                    //             Text("8",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black38)),
                    //
                    //           ],
                    //         ),
                    //       ),
                    //
                    //       SizedBox(width: width*0.2,),
                    //       Container(
                    //         child: Column(
                    //           children: [
                    //             SizedBox(height: height*0.02,),
                    //             Image.asset("images/can.jpg",height: 50,width: 50,),
                    //             SizedBox(height: height*0.01,),
                    //             Text("10",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black38)),
                    //
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    //
                  ],
                ),
              )
            ],
          ),
        ),
      ],),
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
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.location_on_outlined,
                  text: 'Map',
                ),
                GButton(
                  icon: Icons.more_horiz,
                  text: 'More',
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
                            builder: (context) => homePage(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data, location: location)));
                  if (_index == 1)
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => maps(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data, metalCount: metalCount, plasticCount: plasticCount, location23: location)));
                  if (_index == 2)
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => MyProfile(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data, metalCount: metalCount, plasticCount: plasticCount, location: location)));
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