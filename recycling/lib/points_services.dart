import 'package:flutter/material.dart';
import 'package:recycling/MainMenu.dart';
import 'package:recycling/MyProfile.dart';
import 'package:recycling/map.dart';

class PointsServices extends StatefulWidget {
  String Email = '';
  String Password = '';
  String fullName = '';
  String mobileNumber = '';
  String gender = '';
  String dateOfBirth = '';
  List<Widget> cart = [];
  double totalAmount = 0;
  List<String> orders=[];

  PointsServices(
      {required this.Email,
        required this.Password,
        required this.fullName,
        required this.mobileNumber,
        required this.gender,
        required this.dateOfBirth,
        required this.cart
        ,required this.totalAmount,required this.orders});

  @override
  State<PointsServices> createState() => _PointsServicesState(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, cart: cart, totalAmount: totalAmount, orders: orders);
}

class _PointsServicesState extends State<PointsServices> {
  String Email = '';
  String Password = '';
  String fullName = '';
  String mobileNumber = '';
  String gender = '';
  String dateOfBirth = '';
  List<Widget> cart = [];
  double totalAmount = 0;
  List<String> orders=[];

  _PointsServicesState(
      {required this.Email,
        required this.Password,
        required this.fullName,
        required this.mobileNumber,
        required this.gender,
        required this.dateOfBirth,
        required this.cart
        ,required this.totalAmount,required this.orders}); //  late WebViewController controller;
  var _index = 2;
  var color = const Color(0xFF228B22);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Colors.grey[100],
        child: Column(
          children: [

            Container(
              // color: Colors.white,
              height: MediaQuery.of(context).size.height*0.16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)),
                color: Colors.white
              ),
              child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*0.05,),

                      Row(
                        children: [
                          SizedBox(width: MediaQuery.of(context).size.width*0.01,),

                          IconButton(onPressed: (){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => MyProfile(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, cart: cart, totalAmount: totalAmount, orders: orders)));
                          }, icon: Icon(Icons.chevron_left,color: Colors.black45,size: 25,))

                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.004,),

                      Row(
                        children: [
                          SizedBox(width: MediaQuery.of(context).size.width*0.06,),
                          Text("Points Services",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                        ],
                      )
                  ],
                )
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.015,),

            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width*0.06,),

                Text("You are managing :",style: TextStyle(fontSize: 11,color: Colors.black54),)
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.009,),

            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width*0.06,),

                Text("$mobileNumber",style: TextStyle(fontSize: 22,color: Colors.black),),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.025,),

            Container(
              width: MediaQuery.of(context).size.width-50,
              height:MediaQuery.of(context).size.height*0.06 ,


              // color: Colors.white,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Colors.white
              ),

              child:Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width *0.05,),
                  Text("Current Points",style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(width: MediaQuery.of(context).size.width *0.42,),
                  Text("3145",style: TextStyle(fontWeight: FontWeight.bold,color:color,fontSize: 20 ),)
                ],
              ),

            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.025,),

            Container(
              width: MediaQuery.of(context).size.width-50,
              height:MediaQuery.of(context).size.height*0.06 ,


              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.white

              ),

                  child:ElevatedButton(

                  onPressed: (){

                  },
                    style:ElevatedButton.styleFrom(backgroundColor: Colors.transparent,shadowColor: Colors.transparent,),
                    child:Align(alignment:Alignment.centerLeft ,
                        child:Text("Points Transfer",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)), ),

            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.025,),

            Container(
              width: MediaQuery.of(context).size.width-50,
              height:MediaQuery.of(context).size.height*0.06 ,


              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.white

              ),

                  child:ElevatedButton(

                  onPressed: (){

                  },
                    style:ElevatedButton.styleFrom(backgroundColor: Colors.transparent,shadowColor: Colors.transparent,),
                    child:Align(
                        alignment:Alignment.centerLeft ,
                        child:Text("Points Transfer History",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)), ),

            )



          ],
        ),
        ),
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
                if (_index == 0)
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => homePage(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, cart: cart, totalAmount: totalAmount, orders: orders)));
                if (_index == 1)
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => maps(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, cart: cart, totalAmount: totalAmount, orders: orders)));
                if (_index == 2)
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => MyProfile(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, cart: cart, totalAmount: totalAmount, orders: orders)));

                // if (_index == 3)
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => AddToCart(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, cart: cart, totalAmount: totalAmount, orders: orders)));
              });
            }),
        // body:
      ),

    );
  }
}