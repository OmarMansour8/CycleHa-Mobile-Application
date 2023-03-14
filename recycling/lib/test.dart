import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:recycling/SignIn.dart';
import 'package:recycling/SignUp.dart';
// import 'package:http/http.dart';
// import 'signUp.dart';
// import 'SignIn.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';


class testo extends StatelessWidget {
  testo({Key? key}) : super(key: key);
  Future<dynamic> generateEmployeeList() async {

    // Give your sever URL of get_employees_details.php file
    var url =Uri.parse('https://phlegmier-marches.000webhostapp.com/server.php') ;

    final response = await http.get(url);
    var list = json.decode(response.body);
    List<user> _users =
    await list.map<user>((json) => user.fromJson(json)).toList();
    // employeeDataSource = EmployeeDataSource(_users);
    return _users;
  }
  // db = FirebaseDatabase.instance.ref().child("UltraSonic");
  // db.once().then((DataSnapshot snapshot){
  // Map<dynamic, dynamic> values = snapshot.value;
  // values.forEach((key,values) {
  // print(values["Email"]);
  // });
  // });
  Future getData() async{
    var url = Uri.parse('https://phlegmier-marches.000webhostapp.com/get.php') ;
    http.Response response = await http.get(url);
    var data = jsonDecode (response.body);
    print (data.toString());
  }
 void initState(){
    // getData();
 }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
          child: ElevatedButton(onPressed: (){
            getData();


          },child: Text('omar'),),
            // children: <Widget>[
            //
            //   Column(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: <Widget>[
                    // Container(alignment: Alignment.center,
                    //   margin: EdgeInsets.symmetric(vertical: 100),
                    //
                    //   child:ClipRRect(
                    //     borderRadius:BorderRadius.circular(40),
                    //     child: Image.asset('images/recycling-tree-leaf-logo-design-ecology-green-icon-template-eco-friendly-concept-recycling-tree-leaf-logo-design-ecology-green-229478854.png',height: 340,width: 330,fit: BoxFit.cover,alignment: Alignment.center),
                    //   ),
                    // ),


                      // // child:Container(
                      // //   child: Column(
                      // //     children: [
                      // //       SizedBox(
                      // //         height: MediaQuery.of(context).size.height * 0.02,
                      // //       ),
                      // //       CarouselSlider(
                      // //         items: [
                      // //           Container(
                      // //             width: MediaQuery.of(context).size.width,
                      // //             decoration: BoxDecoration(
                      // //               borderRadius: BorderRadius.circular(8.0),
                      // //             ),
                      // //             child: CircularPercentIndicator(
                      // //               radius: 90.0,
                      // //               lineWidth: 15.0,
                      // //               percent: 0.7,
                      // //               animation: true,
                      // //               animationDuration: 1200,
                      // //               center: new Text("50"),
                      // //               circularStrokeCap: CircularStrokeCap.butt,
                      // //               backgroundColor: Colors.black26,
                      // //               progressColor: Colors.black,
                      // //               footer: new Text(
                      // //                 "المرتبات",
                      // //                 style: new TextStyle(
                      // //                     fontWeight: FontWeight.bold, fontSize: 15.0),
                      // //               ),
                      // //               // progressColor: Colors.green,
                      // //             ),
                      // //           ),
                      // //           Container(
                      // //             width: MediaQuery.of(context).size.width,
                      // //             decoration: BoxDecoration(
                      // //               borderRadius: BorderRadius.circular(8.0),
                      // //             ),
                      // //             child: CircularPercentIndicator(
                      // //               radius: 90.0,
                      // //               lineWidth: 15.0,
                      // //               percent: 0.7,
                      // //               animation: true,
                      // //               animationDuration: 1200,
                      // //               center: new Text("50"),
                      // //               circularStrokeCap: CircularStrokeCap.butt,
                      // //               backgroundColor: Colors.black26,
                      // //               progressColor: Colors.black,
                      // //               footer: new Text(
                      // //                 "الايجار",
                      // //                 style: new TextStyle(
                      // //                     fontWeight: FontWeight.bold, fontSize: 15.0),
                      // //               ),
                      // //             ),
                      // //           ),
                      // //           Container(
                      // //             width: MediaQuery.of(context).size.width,
                      // //             decoration: BoxDecoration(
                      // //               borderRadius: BorderRadius.circular(8.0),
                      // //             ),
                      // //             child: CircularPercentIndicator(
                      // //               radius: 90.0,
                      // //               lineWidth: 15.0,
                      // //               percent: 0.7,
                      // //               animation: true,
                      // //               animationDuration: 1200,
                      // //               center: new Text("50"),
                      // //               circularStrokeCap: CircularStrokeCap.butt,
                      // //               backgroundColor: Colors.black26,
                      // //               progressColor: Colors.black,
                      // //               footer: new Text(
                      // //                 "البضاعة",
                      // //                 style: new TextStyle(
                      // //                     fontWeight: FontWeight.bold, fontSize: 15.0),
                      // //               ),
                      // //               // progressColor: Colors.green,
                      // //             ),
                      // //           ),
                      // //         ],
                      // //         options: CarouselOptions(
                      // //           height: 300.0,
                      // //           enlargeCenterPage: true,
                      // //           autoPlay: true,
                      // //           aspectRatio: 16 / 9,
                      // //           autoPlayCurve: Curves.fastOutSlowIn,
                      // //           enableInfiniteScroll: true,
                      // //           autoPlayAnimationDuration: Duration(milliseconds: 800),
                      // //           viewportFraction: 0.8,
                      // //         ),
                      // //       )
                      // //     ],
                      // //   ),
                      // ),
        //           ]
        //       )
        //     ]
        )

    );
  }
}



class user {
  String? mobile_number;
  String? user_name;
  String? user_email;
  int? user_points;

  user({this.mobile_number, this.user_name, this.user_email, this.user_points});


  factory user.fromJson(Map<String, dynamic> json) {
    return user(
        mobile_number: (json['mobile_number']),
        user_name: json['user_name'] as String,
        user_email: json['user_email'] as String,
        user_points: int.parse(json['user_points']));
  }
}
