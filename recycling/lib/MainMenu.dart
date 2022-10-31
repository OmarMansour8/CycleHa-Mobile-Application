import 'package:flutter/material.dart';
import 'package:recycling/MyAccount.dart';
import 'package:recycling/Settings.dart';


// void main() {
//   runApp(homePage());
// }

class homePage extends StatefulWidget {
  String Email = '';
  String Password = '';
  String fullName = '';
  String mobileNumber = '';
  String gender = '';
  String dateOfBirth = '';
  List<Widget> cart = [];
  double totalAmount = 0;
  List<String> orders=[];

  homePage(
      {required this.Email,
        required this.Password,
        required this.fullName,
        required this.mobileNumber,
        required this.gender,
        required this.dateOfBirth,
        required this.cart
        ,required this.totalAmount,required this.orders});

  @override
  State<homePage> createState() => _homePageState(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, cart: cart, totalAmount: totalAmount, orders: orders);
}

class _homePageState extends State<homePage> {
  String Email = '';
  String Password = '';
  String fullName = '';
  String mobileNumber = '';
  String gender = '';
  String dateOfBirth = '';
  List<Widget> cart = [];
  double totalAmount = 0;
  List<String> orders=[];

  _homePageState(
      {required this.Email,
        required this.Password,
        required this.fullName,
        required this.mobileNumber,
        required this.gender,
        required this.dateOfBirth,
        required this.cart
        ,required this.totalAmount,required this.orders}); //  late WebViewController controller;
  var _index = 0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          elevation: 5,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.green,
          title: Text(
            "Recycling Project",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 7,
                          spreadRadius: 3,
                          color: Colors.green)
                    ],
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),

                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 40,
                  width: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 7,
                          spreadRadius: 3,
                          color: Colors.green)
                    ],
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: IconButton(
                      onPressed: () {
                       /* Navigator.push(context,
                            MaterialPageRoute(builder: (context) => start()));
                      */},
                      icon: Icon(
                        Icons.logout,
                        size: 20,
                        color: Colors.white,
                      )),
                )
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
                          builder: (context) => homePage(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, cart: cart, totalAmount: totalAmount, orders: orders)));
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
                          builder: (context) => myaccount(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, cart: cart, totalAmount: totalAmount, orders: orders)));
                },
                contentPadding: EdgeInsets.fromLTRB(15, 0, 20, 0),
                // leading:Image(image:NetworkImage("https://www.pngitem.com/pimgs/m/248-2486809_transparent-vegetable-pizza-png-png-download.png"),
                //  width: 70,),
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
                          builder: (context) => setting(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, cart: cart, totalAmount: totalAmount, orders: orders)));
                },
                contentPadding: EdgeInsets.fromLTRB(15, 0, 20, 20),
                // leading:Image(image:NetworkImage("https://www.pngall.com/wp-content/uploads/4/French-Fries-PNG-File.png"),
                //   width: 70,),
                title: Text(
                  "Settings",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
