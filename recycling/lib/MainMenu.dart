import 'dart:convert';
import 'sSignInPage.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:recycling/AdminMainMenu.dart';
import 'package:recycling/MyAccount.dart';
import 'package:recycling/MyProfile.dart';
import 'package:recycling/Settings.dart';
import 'package:recycling/Welcome.dart';
import 'package:recycling/main.dart';
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
  bool plasticEnter = false;
  bool metalEnter =false;


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
        plasticCount+=int.parse(data1[i]["Item_Amount"]);
        // metalCount+=int.parse(data2[i]["Item_Amount"]);
      }}
    if(metalEnter){
      for(int i =0; i<data2.length;i++){
        // plasticCount+=int.parse(data1[i]["Item_Amount"]);
        metalCount+=int.parse(data2[i]["Item_Amount"]);
      }}
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

          SingleChildScrollView(

          child:Column(
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
                                  MaterialPageRoute(builder: (context) => Sign_In1()));
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
                height: MediaQuery.of(context).size.height*0.4232,
                decoration: BoxDecoration(
                    color: Colors.green
                ),
                child:  Container(
                    width: MediaQuery.of(context).size.width ,
                    height: MediaQuery.of(context).size.height*0.4332,
                    margin:EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.02 ,0 , MediaQuery.of(context).size.width*0.02 , MediaQuery.of(context).size.width*0.02),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25),bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25)),
                    ),

                    child:Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height*0.035,),
                        Row(
                          children: [

                            Container(
                                width: MediaQuery.of(context).size.width-20,
                                height: MediaQuery.of(context).size.height*0.35,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30),bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                                ),
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
                                            width: MediaQuery.of(context).size.width-MediaQuery.of(context).size.width*0.056,
                                            child :Center(

                                                child: CircularProgressIndicator(
                                                  strokeWidth: 4,
                                                  color: Colors.green,
                                                ),


                                            )
                                        )
                                      ],
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height*0.07,),
                                    Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width-MediaQuery.of(context).size.width*0.056,
                                          child: Center(
                                              child: Container(
                                                width: MediaQuery.of(context).size.width*0.8,
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

                                                    onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>maps(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data)));},
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
          ),),
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
          // bottomNavigationBar: BottomNavigationBar(
          //     type: BottomNavigationBarType.fixed,
          //     items: [
          //       BottomNavigationBarItem(
          //         label: "Home",
          //         icon: Icon(Icons.home),
          //       ),
          //       /*  BottomNavigationBarItem(
          //       label: "Offers",
          //       icon: Icon(Icons.local_offer),
          //     ),*/
          //       BottomNavigationBarItem(
          //         label: "Map",
          //         icon: Icon(Icons.location_on),
          //       ),
          //       BottomNavigationBarItem(
          //         label: "More",
          //         icon: Icon(Icons.more_horiz),
          //       ),
          //     ],
          //     currentIndex: _index,
          //     unselectedItemColor: Colors.black54,
          //     selectedItemColor: Colors.green,
          //     unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          //     selectedLabelStyle:
          //     TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          //     backgroundColor: Colors.white,
          //     onTap: (index) {
          //       setState(() {
          //         _index = index;
          //         if (_index == 0)
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => homePage(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data)));
          //         if (_index == 1)
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => maps(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data)));
          //         if (_index == 2)
          //           Navigator.push(
          //               context, MaterialPageRoute(builder: (context) => MyProfile(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data)));
          //
          //         // if (_index == 3)
          //         //   Navigator.push(
          //         //       context,
          //         //       MaterialPageRoute(
          //         //           builder: (context) => AddToCart(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, cart: cart, totalAmount: totalAmount, orders: orders)));
          //       });
          //     }),

        );
      }
      print("items: $items_recycled");
       return Scaffold(
//         //
    body:
        SingleChildScrollView(
          child:

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
                                    MaterialPageRoute(builder: (context) => Sign_In1()));
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
        height: MediaQuery.of(context).size.height*0.435,
        decoration: BoxDecoration(
            color: Colors.green
        ),
        child:  Container(
            width: MediaQuery.of(context).size.width ,
            height: MediaQuery.of(context).size.height*0.4332,
            margin:EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.02 ,0 , MediaQuery.of(context).size.width*0.02 , MediaQuery.of(context).size.width*0.02),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25),bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25)),
          ),

            child:Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.035,),
                Row(
                  children: [

                    Container(
                      width: MediaQuery.of(context).size.width-20,
                      height: MediaQuery.of(context).size.height*0.35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30),bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                        ),
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
                                width: MediaQuery.of(context).size.width-MediaQuery.of(context).size.width*0.056,
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
                                width: MediaQuery.of(context).size.width-MediaQuery.of(context).size.width*0.056,
                                child: Center(
                                 child: Container(
                                     width: MediaQuery.of(context).size.width*0.8,
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

                                      onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>maps(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data)));},
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
    ),),

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

      );
    }
);
  }}
//