import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:recycling/MyAccount.dart';
import 'package:recycling/MyProfile.dart';
import 'package:recycling/Settings.dart';
import 'package:recycling/map.dart';
import 'package:recycling/start.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:tab_container/tab_container.dart';



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
  var color = const Color(0xFF228B22);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.only(
        //           bottomLeft: Radius.circular(30),
        //           bottomRight: Radius.circular(30))),
        //   elevation: 5,
        //   iconTheme: IconThemeData(color: Colors.white),
        //   backgroundColor: Colors.green,
        //   title: Text(
        //     "Recycling Project",
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   actions: [
        //     Row(
        //       children: [
        //         Container(
        //           height: 40,
        //           width: 0,
        //           alignment: Alignment.center,
        //           decoration: BoxDecoration(
        //             boxShadow: [
        //               BoxShadow(
        //                   blurRadius: 7,
        //                   spreadRadius: 3,
        //                   color: Colors.green)
        //             ],
        //             shape: BoxShape.circle,
        //             color: Colors.green,
        //           ),
        //
        //         ),
        //         SizedBox(
        //           width: 10,
        //         ),
        //         Container(
        //           height: 40,
        //           width: 80,
        //           alignment: Alignment.center,
        //           decoration: BoxDecoration(
        //             boxShadow: [
        //               BoxShadow(
        //                   blurRadius: 7,
        //                   spreadRadius: 3,
        //                   color: Colors.green)
        //             ],
        //             shape: BoxShape.circle,
        //             color: Colors.green,
        //           ),
        //           child: IconButton(
        //               onPressed: () {
        //                /* Navigator.push(context,
        //                     MaterialPageRoute(builder: (context) => start()));
        //               */},
        //               icon: Icon(
        //                 Icons.logout,
        //                 size: 20,
        //                 color: Colors.white,
        //               )),
        //         )
        //       ],
        //     )
        //   ],
        // ),
        // drawer: Drawer(
        //   width: 180,
        //   backgroundColor: Colors.green,
        //   child: ListView(
        //     children: <Widget>[
        //       DrawerHeader(
        //         child: Container(
        //           decoration: BoxDecoration(
        //               image: DecorationImage(
        //                 image: AssetImage("images/logo.png"),
        //                 fit: BoxFit.cover,
        //               ),
        //               borderRadius: BorderRadius.only(
        //                   bottomLeft: Radius.circular(50),
        //                   topRight: Radius.circular(50))),
        //         ),
        //       ),
        //       ListTile(
        //         onTap: () {
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) => homePage(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, cart: cart, totalAmount: totalAmount, orders: orders)));
        //         },
        //         contentPadding: EdgeInsets.fromLTRB(15, 0, 20, 0),
        //         // leading:Image(image:NetworkImage("https://www.pngitem.com/pimgs/m/248-2486809_transparent-vegetable-pizza-png-png-download.png"),
        //         //  width: 70,),
        //         title: Text(
        //           "Main Menu",
        //           style: TextStyle(color: Colors.white),
        //         ),
        //         trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
        //       ),
        //
        //
        //       ListTile(
        //         onTap: () {
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) => myaccount(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, cart: cart, totalAmount: totalAmount, orders: orders)));
        //         },
        //         contentPadding: EdgeInsets.fromLTRB(15, 0, 20, 0),
        //         // leading:Image(image:NetworkImage("https://www.pngitem.com/pimgs/m/248-2486809_transparent-vegetable-pizza-png-png-download.png"),
        //         //  width: 70,),
        //         title: Text(
        //           "My Account",
        //           style: TextStyle(color: Colors.white),
        //         ),
        //         trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
        //       ),
        //       ListTile(
        //         onTap: () {
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) => setting(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, cart: cart, totalAmount: totalAmount, orders: orders)));
        //         },
        //         contentPadding: EdgeInsets.fromLTRB(15, 0, 20, 20),
        //         // leading:Image(image:NetworkImage("https://www.pngall.com/wp-content/uploads/4/French-Fries-PNG-File.png"),
        //         //   width: 70,),
        //         title: Text(
        //           "Settings",
        //           style: TextStyle(color: Colors.white),
        //         ),
        //         trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
        //       ),
        //     ],
        //   ),
        // ),
    body:
    // Padding(
    // padding: const EdgeInsets.all(0),
    // child: Stack(
    // children:<Widget>[
    //
    // ListView(
    // shrinkWrap: true,
    // children: <Widget>[
    Column(
      children: [
        // SizedBox(height: MediaQuery.of(context).size.height*0.015,),


                Container(
                  width: MediaQuery.of(context).size.width ,
                  height: MediaQuery.of(context).size.height*0.5,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                          0.3,

                          // 0.6,
                          0.7,
                        ],
                        colors: [
                        color,

                        Colors.green


                        ],
                      )
                  ),

                  child:Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*0.045,),
                      Row(
                        children: [
                          SizedBox(width: MediaQuery.of(context).size.width*0.035 ,),
                          Container(
                          child:Text("Hello,",style: TextStyle(fontSize: 20,color: Colors.white),),

                        ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.68,),
                          IconButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => start()));
                              },
                              icon: Icon(
                                Icons.logout,
                                size: 20,
                                color: Colors.white,
                              )),
                        ],
                      ),

                      Row(
                        children: [
                          SizedBox(width: MediaQuery.of(context).size.width*0.04 ,),
                          Container(
                              child:Text("$fullName",style: TextStyle(fontSize: 16,color: Colors.white),)
                          ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.025,),
                      Row(
                        children: [
                          SizedBox(width: MediaQuery.of(context).size.width*0.04 ,),
                          Container(
                              child:Text("Your phone number:",style: TextStyle(fontSize: 10,color: Colors.white),)
                          ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                      Row(
                        children: [
                          SizedBox(width: MediaQuery.of(context).size.width*0.04 ,),
                          Container(
                              child:Text("$mobileNumber",style: TextStyle(fontSize: 22,color: Colors.white),)
                          ),
                        ],
                      ),
                      SizedBox(height:MediaQuery.of(context).size.height*0.035 ,),
                      Row(
                        children: [
                          SizedBox(width: MediaQuery.of(context).size.width*0.04 ,),
                          Container(
                              child:Text("our competitions:",style: TextStyle(fontSize: 12,color: Colors.white),)
                          ),
                        ],
                      ),
                      SizedBox(height:MediaQuery.of(context).size.height*0.009 ,),

                      Container(

                        width: MediaQuery.of(context).size.width-20,
                        height:MediaQuery.of(context).size.height*0.14 ,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10) ,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                           color: Colors.white.withOpacity(0.0),
                        ),
                        child:CarouselSlider(
                          items: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Image.asset('images/recycling.jpg',height: 240,width: 330,fit: BoxFit.cover,alignment: Alignment.center),

                            ),
                            // Container(
                            //   width: MediaQuery.of(context).size.width,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(8.0),
                            //   ),
                            //   child:Image.asset('images/omar.jpg',height: 240,width: 330,fit: BoxFit.cover,alignment: Alignment.center),
                            //
                            // ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child:Image.asset('images/omar1.jpg',height: 240,width: 330,fit: BoxFit.cover,alignment: Alignment.center),

                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child:Image.asset('images/omar2.jpg',height: 240,width: 330,fit: BoxFit.cover,alignment: Alignment.center),

                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child:Image.asset('images/omar4.jpg',height: 240,width: 330,fit: BoxFit.cover,alignment: Alignment.center),

                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child:Image.asset('images/omar3.jpg',height: 240,width: 330,fit: BoxFit.cover,alignment: Alignment.center),

                            ),

                          ],
                          options: CarouselOptions(
                            height: 300.0,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            aspectRatio: 16 / 9,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration: Duration(milliseconds: 800),
                            viewportFraction: 0.8,
                          ),
                        )
                      )

                    ],

                  ),

                            // SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                            // Text("$fullName",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)

                ),
        // CarouselSlider(
        //   items: [
        //     Container(
        //       width: MediaQuery.of(context).size.width,
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(8.0),
        //       ),
        //       child: CircularPercentIndicator(
        //         radius: 90.0,
        //         lineWidth: 15.0,
        //         percent: 0.7,
        //         animation: true,
        //         animationDuration: 1200,
        //         center: new Text("50"),
        //         circularStrokeCap: CircularStrokeCap.butt,
        //         backgroundColor: Colors.black12,
        //         progressColor: Colors.green,
        //         footer: new Text(
        //           "My Points",
        //           style: new TextStyle(
        //               fontWeight: FontWeight.bold, fontSize: 15.0),
        //         ),
        //         // progressColor: Colors.green,
        //       ),
        //     ),
        //
        //
        //   ],
        //   options: CarouselOptions(
        //     height: 300.0,
        //     enlargeCenterPage: true,
        //     autoPlay: false,
        //     aspectRatio: 16 / 9,
        //     autoPlayCurve: Curves.fastOutSlowIn,
        //     enableInfiniteScroll: true,
        //     autoPlayAnimationDuration: Duration(milliseconds: 800),
        //     viewportFraction: 0.8,
        //   ),
        // ),

        // SizedBox(height: 32.0),
        // CollectionSlideTransition(
        //
        //   children: <Widget>[
        //     Icon(Icons.android, color: Colors.red,size: 40,),
        //     Icon(Icons.apps, color: Colors.greenAccent,size: 40,),
        //     Icon(Icons.announcement, color: Colors.yellow,size: 40,),
        //     Icon(Icons.handyman, color: Colors.orange,size: 40,),
        //     Icon(Icons.cabin, color: Colors.purple,size: 40,),
        //   ].map((widget) => Container(
        //     decoration: BoxDecoration(
        //
        //         color: Colors.blue,
        //         borderRadius: BorderRadius.circular(30)
        //     ),
        //     padding: const EdgeInsets.all(8),
        //     child: widget,
        //   )).toList(),
        // ),

                // SizedBox(height: MediaQuery.of(context).size.height*0.015,),

      Container(

        width: MediaQuery.of(context).size.width ,
        height: MediaQuery.of(context).size.height*0.4332,
        decoration: BoxDecoration(
            color: Colors.green
        ),
        child:  Container(
            width: MediaQuery.of(context).size.width ,
            height: MediaQuery.of(context).size.height*0.4332,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
          ),

            child:Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.055,),
                Row(
                  children: [

                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.35,
                      child: Column(
                        children: [
                          Row(

                            children: [
                              SizedBox(
                                width:MediaQuery.of(context).size.width*0.08,
                              ),
                              Text("My Points",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold)),
                            ],

                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child :Center(
                                  child: Text("3145",style:TextStyle(fontSize: 70,fontWeight: FontWeight.bold,color: Colors.black26)),

                                )
                              )
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.07,),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                 child: Container(
                                     width: MediaQuery.of(context).size.width-50,
                                   decoration: BoxDecoration(gradient: LinearGradient(
                                       colors: [
                                         Colors.green,
                                         Colors.lightGreen
                                       ],
                                       begin: Alignment.topLeft,
                                       end: Alignment.bottomRight,
                                       stops:[
                                         0.1,
                                         0.7
                                       ]
                                   ),
                                     borderRadius: BorderRadius.circular(10)

                                   ),
                                    child:ElevatedButton(
                                      style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent,shadowColor: Colors.transparent,),

                                      onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>maps(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, cart: cart, totalAmount: totalAmount, orders: orders)));},
                                      child:Text('Find nearby recycle bins',style: TextStyle(color: Colors.black,fontSize: 19),)),

                                  )

                                ),
                              )

                            ],
                          )
                        ],
                      )
                      // SleekCircularSlider(
                      //     appearance: CircularSliderAppearance(
                      //       size: 150,
                      //       startAngle: 180,
                      //       angleRange: 180,
                      //       counterClockwise: false,
                      //       customWidths: CustomSliderWidths(progressBarWidth: 15,shadowWidth: 0,trackWidth: 10),
                      //       customColors: CustomSliderColors(
                      //           dotColor: Colors.green,
                      //           progressBarColor: Colors.green,
                      //           trackColor: Colors.black12
                      //       ),
                      //       infoProperties: InfoProperties(
                      //         mainLabelStyle: TextStyle(
                      //           color: Colors.black,
                      //           fontSize: 35,
                      //         ),
                      //         modifier: (double value) {
                      //           final roundedValue = value.toInt();
                      //           String x=roundedValue.toStringAsFixed(1);
                      //           return x ;
                      //         },
                      //       ),
                      //
                      //       spinnerDuration: 10,
                      //       animDurationMultiplier: 10,
                      //       animationEnabled: true,
                      //     ),
                      //     initialValue: 40
                      // ),

                    )
                  ],
                )

              ],
            )



        ),
      )
      ],
    ),
    // ]
    // )
    // ]
    // )
    // ),
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
      ),
    );
  }
}