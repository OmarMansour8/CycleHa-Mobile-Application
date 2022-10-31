import 'package:flutter/material.dart';
import 'package:recycling/MainMenu.dart';
import 'package:recycling/changePassword.dart';
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
  List<Widget> cart = [];

  double totalAmount = 0;
  List<String> orders = [];

  setting(
      {required this.Email,
        required this.Password,
        required this.fullName,
        required this.mobileNumber,
        required this.gender,
        required this.dateOfBirth,
        required this.cart,
        required this.totalAmount,
        required this.orders});
  @override
  State<setting> createState() => _settingState(
      Email: Email,
      Password: Password,
      fullName: fullName,
      mobileNumber: mobileNumber,
      gender: gender,
      dateOfBirth: dateOfBirth,
      cart: cart,
      totalAmount: totalAmount,
      orders: orders);
}

class _settingState extends State<setting> {
  String Email = '';
  String Password = '';
  String fullName = '';
  String mobileNumber = '';
  String gender = '';
  String dateOfBirth = '';
  List<Widget> cart = [];
  String name = 'Juicy Burger';
  String image = "images/image4.jpeg";
  bool swVal = false;
  double totalAmount = 0;
  List<String> orders = [];
  _settingState(
      {required this.Email,
        required this.Password,
        required this.fullName,
        required this.mobileNumber,
        required this.gender,
        required this.dateOfBirth,
        required this.cart,
        required this.totalAmount,
        required this.orders});

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
            body: SafeArea(
                child: ListView(padding: EdgeInsets.all(20), children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => homePage(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, cart: cart, totalAmount: totalAmount, orders: orders)));
                    },
                    icon: Icon(Icons.arrow_back_ios),
                    alignment: Alignment.topLeft,
                  ),
                  Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.all(1),
                      child: Text(
                        'Settings',
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
                  SizedBox(height: 30, width: 30),
                  SizedBox(height: 10, width: 10),
                  ListTile(
                      title: Text('Change Password'),
                      subtitle: Text(''),
                      leading: Icon(Icons.password),
                      trailing: Icon(Icons.arrow_forward_ios, color: Colors.green),
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
                                    cart: cart,
                                    totalAmount: totalAmount,
                                    orders: orders)));
                      }),
                  SizedBox(height: 10, width: 10),

                  ListTile(
                      title: Text('Logout'),
                      subtitle: Text(''),
                      leading: Icon(Icons.logout),
                      trailing: Icon(Icons.arrow_forward_ios, color: Colors.green),
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => start()));
                      }),
                  SizedBox(height: 10, width: 10),
                ]))));
  }
}