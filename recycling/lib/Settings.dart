import 'package:flutter/material.dart';
import 'package:recycling/MainMenu.dart';
import 'package:recycling/changePassword.dart';
import 'package:recycling/sSignInPage.dart';
import 'package:recycling/start.dart';
// import 'package:recycling_peoject/ChangePassword.dart';
// import 'package:recycling_peoject/HomePage.dart';
// import 'package:recycling_peoject/startPage.dart';
// import 'package:stomache/About.dart';
// import 'package:stomache/ChangePassword.dart';
// import 'package:stomache/mainMenu.dart';
// import 'package:stomache/start.dart';

class setting extends StatefulWidget {
  String Email = '';
  String Password = '';
  String fullName = '';
  String mobileNumber = '';
  String gender = '';
  String dateOfBirth = '';
  var data;
  var user_points;
  var items_recycled;
  var metalCount;
  var plasticCount ;
  setting(
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
        required this.plasticCount

      });
  @override
  State<setting> createState() => _settingState(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data, metalCount: metalCount, plasticCount: plasticCount);
}

class _settingState extends State<setting> {
  String Email = '';
  String Password = '';
  String fullName = '';
  String mobileNumber = '';
  String gender = '';
  String dateOfBirth = '';
  var data;
  var user_points;
  var items_recycled;
  var metalCount;
  var plasticCount ;
  _settingState(
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
        required this.plasticCount

      });

  ThemeData _liteTheme = ThemeData(
    brightness: Brightness.light,
  );
  ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar (

              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
                onPressed: ()=> Navigator.pop(context),

              ),
              backgroundColor:Color.fromRGBO(64, 168, 88, 1),
              centerTitle: true,
              title: Text ('Settings'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25),
                ),
              ),

            ),
            body: SafeArea(
                child: ListView(padding: EdgeInsets.all(20), children: [

                  SizedBox(height: 10, width: 10),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Change_Password(
                                  Email: Email,
                                  Password: Password,
                                  fullName: fullName,
                                  mobileNumber: mobileNumber,
                                  gender: gender,
                                  dateOfBirth: dateOfBirth,
                                  user_points: user_points,
                                  items_recycled: items_recycled,
                                  data: data,
                                ),
                              ),
                            );
                          },
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Padding(padding: EdgeInsets.only(left: 10)),
                                Icon(Icons.password,size: 28),
                                SizedBox(width: 20),
                                Text('Change Password',style: TextStyle(fontSize: 17)),
                              ],),
                              Container(
                                child:Icon(Icons.arrow_forward_ios, color: Colors.green),

                              )

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),
                  Divider(thickness: 2),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Sign_In1()),
                            );
                          },
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Padding(padding: EdgeInsets.only(left: 10)),
                                Icon(Icons.logout,size: 28),
                                SizedBox(width: 20),
                                Text('Logout',style: TextStyle(fontSize: 18)),
                              ],),
                              Container(
                                child: Icon(Icons.arrow_forward_ios, color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10, width: 10),
                ]))));
  }
}