import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:recycling/MainMenu.dart';
import 'package:recycling/MyAccount.dart';
import 'package:recycling/Settings.dart';
import 'package:recycling/map.dart';
import 'package:recycling/points_services.dart';

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

  MyProfile(
      {required this.Email,
        required this.Password,
        required this.fullName,
        required this.mobileNumber,
        required this.gender,
        required this.dateOfBirth,
        required this.user_points,
        required this.items_recycled,
        required this.data

      });

  @override
  State<MyProfile> createState() => _MyProfileState(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth,user_points: user_points,items_recycled: items_recycled, data:data);
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
  _MyProfileState(
      {required this.Email,
        required this.Password,
        required this.fullName,
        required this.mobileNumber,
        required this.gender,
        required this.dateOfBirth,
        required this.user_points,
        required this.items_recycled,
        required this.data
      }); //  late WebViewController controller;
  var _index = 2;



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(

          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.green,
          title: Text(
            "Profile",
            style: TextStyle(color: Colors.white),
          ),

          centerTitle: true,
          actions: [
            Row(
              children: [
                IconButton(onPressed: (){
                 Navigator.push(context,
                            MaterialPageRoute(builder: (context) => setting(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data)));
                }, icon: Icon(Icons.settings,size: 25,))



              ],
            )
          ],
        ),
        drawer: Drawer(
          width: 180,
          backgroundColor: Colors.green,
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/logo.png"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => homePage(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data)));
                },
                contentPadding: EdgeInsets.fromLTRB(15, 0, 20, 0),
                // leading:Image(image:NetworkImage("https://www.pngitem.com/pimgs/m/248-2486809_transparent-vegetable-pizza-png-png-download.png"),
                //  width: 70,),
                title: Text(
                  "Main Menu",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => myaccount(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data)
                      ));
                },
                contentPadding: EdgeInsets.fromLTRB(15, 0, 20, 0),
                title: Text(
                  "My Account",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => setting(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data)));
                },
                contentPadding: EdgeInsets.fromLTRB(15, 0, 20, 20),
                title: Text(
                  "Settings",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                SizedBox(width: MediaQuery.of(context).size.width*0.33,),
                  CircleAvatar(

                    backgroundImage:
                    AssetImage("images/avatar.jpg"),
                    radius: 70,

                  )
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  SizedBox(width:MediaQuery.of(context).size.width*0.25 ,),
                  Container(width: MediaQuery.of(context).size.width*0.5,
                  height: MediaQuery.of(context).size.height*0.03,
                    child: Center(
                      child: Text("$fullName",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                    ),
                  ),

                ],
              ),


            ),
            Container(
              child: Row(
                children: [
                  SizedBox(width:MediaQuery.of(context).size.width*0.25 ,),
                  Container(width: MediaQuery.of(context).size.width*0.5,
                    height: MediaQuery.of(context).size.height*0.03,
                    child: Center(
                      child: Text("Egypt"),
                    ),
                  ),

                ],
              ),


            ),
            Container(
              child: Row(
                children: [
                  Column(
                    children: [
                      SizedBox(height:MediaQuery.of(context).size.height*0.04,),
                      Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: Center(
                          child:Text("$items_recycled",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,)),
                        ),
                      ),
                      SizedBox(height:MediaQuery.of(context).size.height*0.009, ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.5,
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
            SizedBox(height:  MediaQuery.of(context).size.height*0.01,),
            Divider(
              // height: 10,
              thickness: 0,
              indent: 0,
              endIndent: 0,
              color: Colors.black26,
            ),
            Container(
              child: ListTile(
                leading: Icon(Icons.money),
                title: Text("Points Services",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                hoverColor: Colors.black26,
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => PointsServices(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data)));


                },
              ),
            )
          ],
        ),
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
                              builder: (context) => homePage(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data)));
                    if (_index == 1)
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => maps(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data)));
                    if (_index == 2)
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => MyProfile(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data)));
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
      ),
    );
  }
}