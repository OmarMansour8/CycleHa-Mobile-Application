import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:recycling/AdminMainMenu.dart';
import 'package:recycling/MyAccount.dart';
import 'package:recycling/MyProfile.dart';
import 'package:recycling/Settings.dart';
import 'package:recycling/Welcome.dart';
import 'package:recycling/map.dart';
import 'package:recycling/start.dart';
import 'package:http/http.dart' as http;
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
  var user_points;
  var data;
  var items_recycled;

  homePage(
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
  State<homePage> createState() => _homePageState(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth,user_points: user_points,items_recycled: items_recycled, data:data);
}

class _homePageState extends State<homePage> {
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
  int plasticPoints = 5;
  int metalPoints = 10;
  var plasticData;
  var metalData;


  Future getItemCount(String mobile) async{
    var url =  Uri.parse(
        'https://phlegmier-marches.000webhostapp.com/getPlasticCount.php');
    var response = await http.post(Uri.parse(
        'https://phlegmier-marches.000webhostapp.com/getItemsCount.php'),body:{
      'mobile' : "01550083829",
      'type' : "plastic"
    }
    );

    // print(json.decode(response.body));
    var data1 = await json.decode(response.body);
    print(data1);

    var response1 = await http.post(Uri.parse(
        'https://phlegmier-marches.000webhostapp.com/getItemsCount.php'),body:{
      'mobile' : mobile,
      'type' : "metal"
    }
    );

    // print(json.decode(response.body));
    var data2 = await json.decode(response1.body);
    print(data2);

    // return json.decode(response.body);
      plasticCount=0;
      metalCount=0;
      for(int i =0; i<data1.length;i++){
        plasticCount+=int.parse(data1[i]["Item_Amount"]);
        metalCount+=int.parse(data2[i]["Item_Amount"]);
      }
      items_recycled = plasticCount+metalCount;
      // user_points = (plasticCount*plasticPoints);
      user_points = (metalCount*metalPoints)+(plasticCount*plasticPoints);

      return user_points;

      // return json.decode(response.body);
    }

  @override
  void initState()  {
    super.initState();
    getItemCount(mobileNumber);
  }


  _homePageState(
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
  var _index = 0;
  var color = const Color(0xFF228B22);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
    future: getItemCount(mobileNumber),
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        // Future hasn't finished yet, return a placeholder
        return Scaffold(
//         //
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
                  height: MediaQuery.of(context).size.height*0.49,
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
                              Text("Your Points",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold)),
                            ],

                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child :Center(
                                  child: Text("Loading",style:TextStyle(fontSize: 70,fontWeight: FontWeight.bold,color: Colors.black26)),

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

                                      onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminBin()));},
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
                          builder: (context) => homePage(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data)));
                if (_index == 1)
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => maps(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data)));
                if (_index == 2)
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => MyProfile(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data)));

                // if (_index == 3)
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => AddToCart(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, cart: cart, totalAmount: totalAmount, orders: orders)));
              });
            }),

      );
      }
      print("items: $items_recycled");
       return Scaffold(
//         //
    body:

    Column(
      children: [
                Container(
                  width: MediaQuery.of(context).size.width ,
                  height: MediaQuery.of(context).size.height*0.49,
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



                ),

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
                              Text("Your Points",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold)),
                            ],

                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child :Center(
                                  child: Text("${user_points.toString()}",style:TextStyle(fontSize: 70,fontWeight: FontWeight.bold,color: Colors.black26)),

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

                                      onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminBin()));},
                                      child:Text('Find nearby recycle bins',style: TextStyle(color: Colors.black,fontSize: 19),)),

                                  )

                                ),
                              )

                            ],
                          )
                        ],
                      )

                    )
                  ],
                )

              ],
            )
        ),
      )
      ],
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
                          builder: (context) => homePage(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data)));
                if (_index == 1)
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => maps(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data)));
                if (_index == 2)
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => MyProfile(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data)));

                // if (_index == 3)
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => AddToCart(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, cart: cart, totalAmount: totalAmount, orders: orders)));
              });
            }),

      );
    }
);
  }}
//