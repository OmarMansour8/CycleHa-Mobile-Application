import 'dart:convert';
import 'dart:math';
// import 'package:firebase_database/firebase_database.dart';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:recycling/AdminMainMenu.dart';
import 'package:recycling/AdminUserProfile.dart';
import 'package:recycling/test.dart';
import 'package:recycling/utils/stacked_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:recycling/MyAccount.dart';
import 'package:recycling/MyProfile.dart';
import 'package:recycling/Settings.dart';
import 'package:recycling/map.dart';
import 'package:recycling/start.dart';
import 'package:http/http.dart' as http;
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:tab_container/tab_container.dart';

// void main() {
//   runApp(homePage());
// }

class Truck extends StatefulWidget {
  @override
  State<Truck> createState() => _TruckState();
}

class _TruckState extends State<Truck> {
  // final databaseReference = FirebaseDatabase.instance.ref();
  var _index = 1;
  int variable = -1;
  var color = const Color.fromRGBO(220, 238, 255, 1);
  var truckData1=[];
  var driverData;
  var _driverID=[] ;
  var _driverIDRefrence=[] ;
  List _driverName = [];
  List _ID = [];
  List Location = [];
  List Bin = [];
  List<Widget> Widg = [];
  int enter = 0;
  var driversData;
  List<List> binUsedList=[];
  var BinData;

  TextEditingController truckId = new TextEditingController();
  TextEditingController truckCapacity = new TextEditingController();
  TextEditingController truckLocation = new TextEditingController();
  TextEditingController drivername1 = new TextEditingController();
  TextEditingController drivermobileNumber = new TextEditingController();


  Future addNewTruck()async{

    var response = await http.post( Uri.parse(
        'https://phlegmier-marches.000webhostapp.com/addTruck.php'),body:{

      "TruckId" : truckId.text.toString(),
      "DriverId" : driver,
      "TruckCapacity" : truckCapacity.text.toString(),
      "TruckLocation" : truckLocation.text.toString()

    }
    );
    var data1;
    try {
      data1 = await json.decode(response.body);
      print("data1 $data1");
      //  print("omar1");
      print(data1);
      if (data1 == "Something Went Wrong") {
        Fluttertoast.showToast(
            msg: "Something Went Wrong Please Try Again Later",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.9
        );
      }
      else if (data1 == "Truck Succefully Added") {
        Fluttertoast.showToast(
            msg: "Truck Succefully Added",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);

        Navigator.pop(context);


      }
      if (data1 == "Truck ID Already Exist") {
        Fluttertoast.showToast(
            msg: "Truck ID Already Exist",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.9
        );
      }
      else {
        print("error");
      }
    }
    catch (e) {
      print(e);
    }

    return data1;
  }
  Future addNewDriver()async{
    Random random = new Random();
    int randomNumber = random.nextInt(10000);
    var response = await http.post( Uri.parse(
        'https://phlegmier-marches.000webhostapp.com/addDriver.php'),body:{

      "DriverName" : drivername1.text.toString(),
      "DriverMobileNumber" : drivermobileNumber.text,
      "DriverID":randomNumber.toString()


    }
    );
    var data1;
    try {
      data1 = await json.decode(response.body);
      print("Driversssssss $data1");
      //  print("omar1");
      print(data1);
      if (data1 == "Something Went Wrong") {
        Fluttertoast.showToast(
            msg: "Something Went Wrong Please Try Again Later",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.9
        );
      }
      else if (data1 == "Driver Succefully Added") {
        Fluttertoast.showToast(
            msg: "Driver Succefully Added",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);

        Navigator.pop(context);


      }
      if (data1 == "Driver Already Exist") {
        Fluttertoast.showToast(
            msg: "Driver Already Exist",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.9
        );
      }
      else {
        print("error");
      }
    }
    catch (e) {
      print(e);
    }

    return data1;
  }

  Future getTruckData() async {
    var url =
    Uri.parse('https://phlegmier-marches.000webhostapp.com/getTruck.php');
    var response = await http.post(url, body: {});

    // print(json.decode(response.body));
    var data1 = await json.decode(response.body);

    var url1 =
    Uri.parse('https://phlegmier-marches.000webhostapp.com/getDriver.php');
    var response1 = await http.post(Uri.parse('https://phlegmier-marches.000webhostapp.com/getDriver.php'), body: {});
    var data2 = await json.decode(response1.body);
    var url2 =
    Uri.parse('https://phlegmier-marches.000webhostapp.com/getDriver.php');
    var response2 = await http.post(Uri.parse('https://phlegmier-marches.000webhostapp.com/getBin.php'), body: {});
    var data3 = await json.decode(response2.body);
    // print(json.decode(response.body));

    // print(data1);
    truckData1 = data1;
    driversData = data2;
    BinData = data3;
    print("truckdata1 $truckData1");
    print("driversData $driversData");
    print("binData $BinData");


    //
    // print("length ${truckData1.length}");

    // print("mamaos ${data1.runtimeType}");
    if (enter ==0 ) {
      getInformation();
      enter++;
    }

    print("khlst");
    return data2;

    // return json.decode(response.body);
  }

  // Future getDriverData(var driver) async {
  //   var url =
  //       Uri.parse('https://phlegmier-marches.000webhostapp.com/getDriver.php');
  //   var response = await http.post(url, body: {
  //     "driver": driver,
  //   });
  //
  //   // print(json.decode(response.body));
  //   var data1 = await json.decode(response.body);
  //   // print(data1);
  //   print(driver);
  //   print("data : ${data1[0]["Driver_Name"]}");
  //
  //
  //   // if(enter == 0){
  //   //   getInformation();
  //   //   enter++;
  //   // }
  //   return data1;
  //
  //   // return json.decode(response.body);
  // }

  getInformation()  {
    // await getInformation1();

    // print("truckdata $truckData1");
    for (int i = 0; i < truckData1.length; i++) {
        if(truckData1[i]["Truck_ID"]!="Not Yet") {
          _ID.add(truckData1[i]["Truck_ID"]);
          Bin.add(truckData1[i]["Truck_Location"]);
          _driverID.add(truckData1[i]["Driver_Id"]);
          binUsedList.add([]);
        }
        else if(truckData1[i]["Truck_ID"]=="Not Yet")
        {
          _driverID.add(truckData1[i]["Driver_Id"]);
        }
    }
    for (int i = 0; i < driversData.length; i++) {
      _driverIDRefrence.add(driversData[i]["Driver_Id"]);
    }
    print("omar123321 $_driverIDRefrence");

    print("bin data length ${binUsedList.length}");
    print(_ID);
    print(Bin);
    print(_driverID);

    for (int i = 0; i < _driverID.length; i++) {
      for (int y = 0; y < driversData.length; y++) {
        if(_driverID[i]==driversData[y]["Driver_Id"]){
          _driverName.add(driversData[y]["Driver_Name"]);
        }
      }

    }
    print(_driverName);

    for (int i = 0; i < _ID.length; i++) {
      for (int y = 0; y < BinData.length; y++) {
        if(_ID[i]==BinData[y]["Truck_ID"]){
          binUsedList[i].add(BinData[y]["Bin_ID"]);
        }
      }
      }
    print('bin data1 $binUsedList');
    for (int i = 0; i < binUsedList.length; i++) {
      print("omaromar ${binUsedList[i]}");
      if(binUsedList[i].isEmpty==true){
        print("ana hna aho");
        binUsedList[i].add("Not Assigned Yet");
        print("omaromar ${binUsedList[i]}");


      }
    }
    for (int i = 0; i < _ID.length; i++) {
      print("dkhlt $i");
      Widg.add(
        Container(
            // color:Colors.white,
            // height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.015),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Colors.white,
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [
                    0.3,

                    // 0.6,
                    0.7,
                  ],
                  colors: [color2, color1],
                )),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                    Text(
                      "${_ID[i]}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    )
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                    Icon(Icons.map_sharp),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    Text(
                      "${Bin[i]}, Cairo, Egypt",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.06),
                    Container(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage("images/avatar.jpg"),
                                  radius: 35,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(children: [
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.03),
                                Text(
                                  "Driver",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black45),
                                ),
                              ]),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.009),
                              Row(
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.04),
                                  Text(
                                    "${_driverName[i]}",
                                    style: TextStyle(fontSize: 18),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2),
                          Column(
                            children: [Icon(Icons.fire_truck_sharp)],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Row(children: [
                  SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Text(
                    "Bins",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )
                ]),
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                    Icon(Icons.restore_from_trash),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    Column(
                      children: [
                          for(int y = 0 ; y <binUsedList[i].length;y++)
                            Text(
                              "${binUsedList[i][y]}",
                              style: TextStyle(fontSize: 16),
                            )
                      ],
                      //[[1],[2,3]]
                    )

                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                )
              ],
            )),
      );
      // print("widg ${Widg.length}");
    }

  }

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  var color1 = const Color(0xFF94cfd4);
  var color2 = const Color(0xFF95d3c5);
  void showAlertDialog1(BuildContext context){
    var alertDialog = AlertDialog(
      content: Text("Are you sure you want to add this Truck?"),
      scrollable: true,
      actions: [
        ElevatedButton(onPressed: (){
        addNewTruck();

          Navigator.pop(context);


        },
            style: ElevatedButton.styleFrom(backgroundColor: color1),
            child: Text('Yes')),
        ElevatedButton(onPressed: (){
          Navigator.pop(context);
        },
            style: ElevatedButton.styleFrom(backgroundColor: color1),
            child: Text('No')),
      ],
    );
    showDialog(context: context,
        builder: (BuildContext context){return
          alertDialog;});}
  void driverAlertDialog1(BuildContext context){
    var alertDialog = AlertDialog(
      content: Text("Are you sure you want to add this Driver?"),
      scrollable: true,
      actions: [
        ElevatedButton(onPressed: (){
        addNewDriver();

          Navigator.pop(context);


        },
            style: ElevatedButton.styleFrom(backgroundColor: color1),
            child: Text('Yes')),
        ElevatedButton(onPressed: (){
          Navigator.pop(context);
        },
            style: ElevatedButton.styleFrom(backgroundColor: color1),
            child: Text('No')),
      ],
    );
    showDialog(context: context,
        builder: (BuildContext context){return
          alertDialog;});}



  void showAlertDialog2(BuildContext context){
    var alertDialog = AlertDialog(
      content: Center(
        child:Column(
            children:[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround ,
                children: [

                  Icon(Icons.fire_truck,size: 30,),

                  Icon(Icons.person,size: 30,)
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

            ElevatedButton(onPressed: (){
              showAlertDialog(context);


            },
                style: ElevatedButton.styleFrom(backgroundColor: color1),
                child: Text('Truck')),

            ElevatedButton(onPressed: (){
              showAlertDialog5(context);

              // Navigator.pop(context);


            },
                style: ElevatedButton.styleFrom(backgroundColor: color1),
                child: Text('Driver')),
          ],
        ),]),
      ),
      scrollable: true,
      // actions: [
      //   ElevatedButton(onPressed: (){
      //     addNewTruck();
      //
      //     Navigator.pop(context);
      //
      //
      //   },
      //       style: ElevatedButton.styleFrom(backgroundColor: color1),
      //       child: Text('Yes')),
      //   ElevatedButton(onPressed: (){
      //     Navigator.pop(context);
      //   },
      //       style: ElevatedButton.styleFrom(backgroundColor: color1),
      //       child: Text('No')),
      // ],
    );
    showDialog(context: context,
        builder: (BuildContext context){return
          alertDialog;});}


  String? selectedValue;
  String? driverIDValue;
  String driver = "";


  void showAlertDialog(BuildContext context){
    var alertDialog = AlertDialog(
      content:

      Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0,2)
                  ),]),
            padding: EdgeInsets.all(1),
            child: TextField(
              controller: truckId,
              // controller: name,
              decoration: InputDecoration(
                  focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: color1)),
                  focusColor: color1,
                  labelStyle: TextStyle(color: color1),
                  hintText: 'Truck ID',
                  prefixIcon:Icon(Icons.delete,color: color1,)
              ),
              onChanged: (String value){
                setState(() {
                  // fullName = value ;
                });
              },
            ),
          ),

          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0,2)
                  ),]),
            padding: EdgeInsets.all(1),
            child: TextField(
              controller: truckCapacity,

              decoration: InputDecoration(focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: color1)),
                  focusColor: color1,
                  labelStyle: TextStyle(color: color1),
                  hintText: 'Truck Capacity',
                  prefixIcon:Icon(Icons.fire_truck,color:color1)
              ),
              onChanged: (String value){
                setState(() {
                  // Email = value;
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0,2)
                  ),]),
            padding: EdgeInsets.all(1),
            child: TextField(
              controller: truckLocation,
              decoration: InputDecoration(
                  focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color:color1)),
                  focusColor: color1,
                  labelStyle: TextStyle(color: color1),
                  hintText: 'Truck Location',
                  prefixIcon:Icon(Icons.location_city,color: color1)
              ),
              onChanged: (String value){

                setState(() {
                  // mobileNumber = value ;
                });
              },
            ),
          ),


          SizedBox(height: MediaQuery.of(context).size.height*0.015,),
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              hint: Row(
                children: const [
                  Center(
                    child: Text(
                      'Choose Driver ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF94cfd4),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              items: _driverIDRefrence
                  .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 18,
                    // fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ))
                  .toList(),
              value: driverIDValue,
              onChanged: (value) {
                setState(() {
                  driverIDValue = value as String;
                  driver = driverIDValue.toString();

                });
              },
              buttonStyleData: ButtonStyleData(
                height:
                MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.53,
                padding:
                const EdgeInsets.only(left: 14, right: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  // border: Border.all(
                  //   color: Colors.black26,
                  // ),
                  color: color,
                ),
                elevation: 0,
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.keyboard_arrow_down,
                ),
                iconSize: 25,
                iconEnabledColor: Colors.black,
                iconDisabledColor: Colors.grey,
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight:
                MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.47,
                padding: null,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,
                ),
                elevation: 8,
                offset: const Offset(0, 0),
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(40),
                  thickness:
                  MaterialStateProperty.all<double>(6),
                  thumbVisibility:
                  MaterialStateProperty.all<bool>(true),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
                padding: EdgeInsets.only(left: 14, right: 14),
              ),
            ),
          ),
        ],
      ),
      scrollable: true,
      actions: [
        ElevatedButton(onPressed: (){
          if(truckId.text!=""&&truckCapacity.text!=""&&truckLocation.text!=""&&driver!="") {
            showAlertDialog1(context);
          }
          else{
            Fluttertoast.showToast(
                msg: "Please fill all the fields",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.9
            );

          }
        },
            style: ElevatedButton.styleFrom(backgroundColor: color1),
            child: Text('Add')),],);
    showDialog(context: context,
        builder: (BuildContext context){return
          alertDialog;});}
  void showAlertDialog5(BuildContext context){
    var alertDialog = AlertDialog(
      content:

      Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0,2)
                  ),]),
            padding: EdgeInsets.all(1),
            child: TextField(
              controller: drivername1,
              // controller: name,
              decoration: InputDecoration(
                  focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: color1)),
                  focusColor: color1,
                  labelStyle: TextStyle(color: color1),
                  hintText: 'Driver Name',
                  prefixIcon:Icon(Icons.delete,color: color1,)
              ),
              onChanged: (String value){
                setState(() {
                  // fullName = value ;
                });
              },
            ),
          ),

          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0,2)
                  ),]),
            padding: EdgeInsets.all(1),
            child: TextField(
              controller: drivermobileNumber,

              decoration: InputDecoration(focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: color1)),
                  focusColor: color1,
                  labelStyle: TextStyle(color: color1),
                  hintText: 'Driver Mobile Number',
                  prefixIcon:Icon(Icons.fire_truck,color:color1)
              ),
              onChanged: (String value){
                setState(() {
                  // Email = value;
                });
              },
            ),
          ),




        ],
      ),
      scrollable: true,
      actions: [
        ElevatedButton(onPressed: (){
          if(drivername1.text!=""&&drivermobileNumber.text!="") {
            driverAlertDialog1(context);
          }
          else{
            Fluttertoast.showToast(
                msg: "Please fill all the fields",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.9
            );

          }
        },
            style: ElevatedButton.styleFrom(backgroundColor: color1),
            child: Text('Add')),],);
    showDialog(context: context,
        builder: (BuildContext context){return
          alertDialog;});}
  // void driverAlertDialog(BuildContext context){
  //   var alertDialog = AlertDialog(
  //     content:
  //
  //     Column(
  //       children: [
  //         Container(
  //           margin: EdgeInsets.all(10),
  //           decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.circular(20),
  //               boxShadow: [
  //                 BoxShadow(
  //                     color: Colors.black26,
  //                     blurRadius: 6,
  //                     offset: Offset(0,2)
  //                 ),]),
  //           padding: EdgeInsets.all(1),
  //           child: TextField(
  //             controller: drivername1,
  //             // controller: name,
  //             decoration: InputDecoration(
  //                 focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: color1)),
  //                 focusColor: color1,
  //                 labelStyle: TextStyle(color: color1),
  //                 hintText: 'Driver Name',
  //                 prefixIcon:Icon(Icons.delete,color: color1,)
  //             ),
  //             onChanged: (String value){
  //               setState(() {
  //                 // fullName = value ;
  //               });
  //             },
  //           ),
  //         ),
  //
  //         Container(
  //           margin: EdgeInsets.all(10),
  //           decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.circular(20),
  //               boxShadow: [
  //                 BoxShadow(
  //                     color: Colors.black26,
  //                     blurRadius: 6,
  //                     offset: Offset(0,2)
  //                 ),]),
  //           padding: EdgeInsets.all(1),
  //           child: TextField(
  //             controller: drivermobileNumber,
  //
  //             decoration: InputDecoration(focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: color1)),
  //                 focusColor: color1,
  //                 labelStyle: TextStyle(color: color1),
  //                 hintText: 'Driver Mobile Number',
  //                 prefixIcon:Icon(Icons.fire_truck,color:color1)
  //             ),
  //             onChanged: (String value){
  //               setState(() {
  //                 // Email = value;
  //               });
  //             },
  //           ),
  //         ),
  //
  //
  //
  //
  //       ],
  //     ),
  //     scrollable: true,
  //     actions: [
  //       ElevatedButton(onPressed: (){
  //         if(drivername1.text!=""&&drivermobileNumber.text!="") {
  //           driverAlertDialog1(context);
  //         }
  //         else{
  //           Fluttertoast.showToast(
  //               msg: "Please fill all the fields",
  //               toastLength: Toast.LENGTH_SHORT,
  //               gravity: ToastGravity.CENTER,
  //               timeInSecForIosWeb: 1,
  //               backgroundColor: Colors.red,
  //               textColor: Colors.white,
  //               fontSize: 16.9
  //           );
  //
  //         }
  //       },
  //           style: ElevatedButton.styleFrom(backgroundColor: color1),
  //           child: Text('Add')),],);
  //   showDialog(context: context,
  //       builder: (BuildContext context){return
  //         alertDialog;});}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getTruckData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(
              // appBar: AppBar(
              //   // shape: RoundedRectangleBorder(
              //   //     borderRadius: BorderRadius.only(
              //   //         bottomLeft: Radius.circular(30),
              //   //         bottomRight: Radius.circular(30))),
              //   elevation: 5,
              //   iconTheme: IconThemeData(color: Colors.white),
              //   backgroundColor: Colors.white,
              //   title: Text(
              //     "Truck",
              //     style: TextStyle(color: Colors.black),
              //   ),
              //   centerTitle: true,
              //   actions: [
              //     Row(
              //       children: [
              //         //   child: IconButton(
              //         //       onPressed: () {
              //         //        /* Navigator.push(context,
              //         //             MaterialPageRoute(builder: (context) => start()));
              //         //       */},
              //         //       icon: Icon(
              //         //         Icons.logout,
              //         //         size: 20,
              //         //         color: Colors.black,
              //         //       )),
              //         // )
              //       ],
              //     )
              //   ],
              // ),
              body: Stack(children: <Widget>[
                ListView(shrinkWrap: true, children: <Widget>[
                  Container(
                      color: Colors.grey[100],
                      child: Column(children: [
                        Container(
                            // color: Colors.white,
                            height: MediaQuery.of(context).size.height * 0.18,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(30),
                                    bottomLeft: Radius.circular(30)),
                                color: Colors.white),
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                                Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    // alignment: Alignment.center,

                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.fire_truck,
                                            size: 38,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                        ),
                                        Text(
                                          "Truck",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 34,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width:MediaQuery.of(context).size.width * 0.18 ,
                                        ),
                                        IconButton(onPressed: (){}, icon: Icon(Icons.add,size: 38,))
                                      ],
                                    )),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.035,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.07,
                                    ),

                                  ],
                                ),
                              ],
                            )),
                        Column(
                          children: [
                            Container(
                                width:MediaQuery.of(context).size.width ,
                                height: MediaQuery.of(context).size.height * 0.6,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 4,
                                    color: Colors.black,
                                  ),
                                )
                            )
                          ],
                        )
                      ]))
                ])
              ]),
              // body:ListView(
              //     children:[
              //       Column(
              //   children: [
              //
              //     Container(
              //       // color: Colors.black45,
              //       width: MediaQuery.of(context).size.width,
              //       height: MediaQuery.of(context).size.height * 0.3,
              //
              //       decoration: BoxDecoration(
              //         image: DecorationImage(
              //           image: AssetImage('images/omar8.jpg'),
              //           fit: BoxFit.fill,
              //         ),
              //       ),
              //     ),
              //     Container(
              //       // color:Colors.white,
              //       height: MediaQuery.of(context).size.height * 0.4,
              //       width: MediaQuery.of(context).size.width,
              //       margin:
              //       EdgeInsets.all(MediaQuery.of(context).size.height * 0.015),
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.all(Radius.circular(25)),
              //           color: Colors.white,
              //           gradient: LinearGradient(
              //             begin: Alignment.bottomCenter,
              //             end: Alignment.topCenter,
              //             stops: [
              //               0.3,
              //
              //               // 0.6,
              //               0.7,
              //             ],
              //             colors: [color2, color1],
              //           )),
              //
              //         child: Column(
              //           children: [
              //             SizedBox(
              //                 height: MediaQuery.of(context).size.height * 0.04),
              //             Row(
              //               children: [
              //                 SizedBox(
              //                     width: MediaQuery.of(context).size.width * 0.1),
              //                 Text(
              //                   "QST-201",
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.bold, fontSize: 24),
              //                 )
              //               ],
              //             ),
              //             SizedBox(
              //                 height: MediaQuery.of(context).size.height * 0.02),
              //             Row(
              //               children: [
              //                 SizedBox(
              //                     width: MediaQuery.of(context).size.width * 0.1),
              //                 Icon(Icons.map_sharp),
              //                 SizedBox(
              //                     width: MediaQuery.of(context).size.width * 0.05),
              //                 Text(
              //                   "Madinty, Cairo, Egypt",
              //                   style: TextStyle(fontSize: 16),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //                 height: MediaQuery.of(context).size.height * 0.02),
              //             Row(
              //               children: [
              //                 SizedBox(
              //                     width: MediaQuery.of(context).size.width * 0.06),
              //                 Container(
              //                   child: Row(
              //                     children: [
              //                       Column(
              //                         children: [
              //                           Container(
              //                             child: CircleAvatar(
              //                               backgroundImage:
              //                               AssetImage("images/avatar.jpg"),
              //                               radius: 35,
              //
              //                             ),
              //                           )
              //                         ],
              //                       ),
              //                       Column(
              //                         children: [
              //                           Row(children: [
              //                             SizedBox(
              //                                 width: MediaQuery.of(context)
              //                                     .size
              //                                     .width *
              //                                     0.03),
              //                             Text(
              //                               "Driver",
              //                               style: TextStyle(
              //                                   fontSize: 16,
              //                                   color: Colors.black45),
              //                             ),
              //                           ]),
              //                           SizedBox(
              //                               height:
              //                               MediaQuery.of(context).size.height *
              //                                   0.009),
              //                           Row(
              //                             children: [
              //                               SizedBox(
              //                                   width: MediaQuery.of(context)
              //                                       .size
              //                                       .width *
              //                                       0.04),
              //                               Text(
              //                                 "Omar Mansour",
              //                                 style: TextStyle(fontSize: 18),
              //                               )
              //                             ],
              //                           )
              //                         ],
              //                       ),
              //                       SizedBox(
              //                           width: MediaQuery.of(context).size.width *
              //                               0.2),
              //                       Column(
              //                         children: [Icon(Icons.fire_truck_sharp)],
              //                       )
              //                     ],
              //                   ),
              //                 )
              //               ],
              //             ),
              //             Row(
              //                 children: [
              //                   SizedBox(
              //                       width: MediaQuery.of(context).size.width * 0.1),
              //                   SizedBox(
              //                       height: MediaQuery.of(context).size.height * 0.1),
              //                   Text("Bins",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
              //                 ]
              //             ),
              //             Row(
              //               children: [
              //                 SizedBox(
              //                     width: MediaQuery.of(context).size.width * 0.1),
              //                 Icon(Icons.restore_from_trash),
              //                 SizedBox(
              //                     width: MediaQuery.of(context).size.width * 0.05),
              //                 Text(
              //                   "S Teseen Rd - RB1",
              //                   style: TextStyle(fontSize: 16),
              //                 )
              //               ],
              //             ),
              //           ],
              //         )
              //     ),
              //
              //   ],
              // ),]),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: Colors.black.withOpacity(.1),
                    )
                  ],
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 8),
                    child: GNav(
                      rippleColor: Colors.grey[300]!,
                      hoverColor: Colors.grey[100]!,
                      gap: 8,
                      activeColor: Colors.black,
                      iconSize: 24,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      duration: Duration(milliseconds: 400),
                      tabBackgroundColor: Colors.grey[100]!,
                      color: Colors.black,
                      tabs: [
                        GButton(
                          icon: Icons.delete,
                          text: 'Bin',
                        ),
                        GButton(
                          icon: Icons.fire_truck,
                          text: 'Truck',
                        ),
                        GButton(
                          icon: Icons.person,
                          text: 'user',
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
                                    builder: (context) => AdminBin()));
                          if (_index == 1)
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Truck()));
                          if (_index == 2)
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) =>AdminUserProfile()));
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
          print("omar124 ${Widg.length}");
          return Scaffold(
            // appBar: AppBar(
            //   // shape: RoundedRectangleBorder(
            //   //     borderRadius: BorderRadius.only(
            //   //         bottomLeft: Radius.circular(30),
            //   //         bottomRight: Radius.circular(30))),
            //   elevation: 5,
            //   iconTheme: IconThemeData(color: Colors.white),
            //   backgroundColor: Colors.white,
            //   title: Text(
            //     "Truck",
            //     style: TextStyle(color: Colors.black),
            //   ),
            //   centerTitle: true,
            //   actions: [
            //     Row(
            //       children: [
            //         //   child: IconButton(
            //         //       onPressed: () {
            //         //        /* Navigator.push(context,
            //         //             MaterialPageRoute(builder: (context) => start()));
            //         //       */},
            //         //       icon: Icon(
            //         //         Icons.logout,
            //         //         size: 20,
            //         //         color: Colors.black,
            //         //       )),
            //         // )
            //       ],
            //     )
            //   ],
            // ),
            body: Stack(children: <Widget>[
              ListView(shrinkWrap: true, children: <Widget>[
                Container(
                    color: Colors.grey[100],
                    child: Column(children: [
                      Container(
                          // color: Colors.white,
                          height: MediaQuery.of(context).size.height * 0.18,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30)),
                              color: Colors.white),
                          child: Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  // alignment: Alignment.center,

                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.fire_truck,
                                          size: 38,
                                        ),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context)
                                            .size
                                            .width *
                                            0.1,
                                      ),
                                      Text(
                                        "Truck",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 34,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width:MediaQuery.of(context).size.width * 0.18 ,
                                      ),
                                      IconButton(onPressed: (){
                                        showAlertDialog2(context);
                                      }, icon: Icon(Icons.add,size: 38,))
                                    ],
                                  )),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.035,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.07,
                                  ),

                                ],
                              ),
                            ],
                          )),
                      for(int i = 0 ; i<Widg.length;i++)
                        Widg[i],
                    ]))
              ])
            ]),
            // body:ListView(
            //     children:[
            //       Column(
            //   children: [
            //
            //     Container(
            //       // color: Colors.black45,
            //       width: MediaQuery.of(context).size.width,
            //       height: MediaQuery.of(context).size.height * 0.3,
            //
            //       decoration: BoxDecoration(
            //         image: DecorationImage(
            //           image: AssetImage('images/omar8.jpg'),
            //           fit: BoxFit.fill,
            //         ),
            //       ),
            //     ),
            //     Container(
            //       // color:Colors.white,
            //       height: MediaQuery.of(context).size.height * 0.4,
            //       width: MediaQuery.of(context).size.width,
            //       margin:
            //       EdgeInsets.all(MediaQuery.of(context).size.height * 0.015),
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.all(Radius.circular(25)),
            //           color: Colors.white,
            //           gradient: LinearGradient(
            //             begin: Alignment.bottomCenter,
            //             end: Alignment.topCenter,
            //             stops: [
            //               0.3,
            //
            //               // 0.6,
            //               0.7,
            //             ],
            //             colors: [color2, color1],
            //           )),
            //
            //         child: Column(
            //           children: [
            //             SizedBox(
            //                 height: MediaQuery.of(context).size.height * 0.04),
            //             Row(
            //               children: [
            //                 SizedBox(
            //                     width: MediaQuery.of(context).size.width * 0.1),
            //                 Text(
            //                   "QST-201",
            //                   style: TextStyle(
            //                       fontWeight: FontWeight.bold, fontSize: 24),
            //                 )
            //               ],
            //             ),
            //             SizedBox(
            //                 height: MediaQuery.of(context).size.height * 0.02),
            //             Row(
            //               children: [
            //                 SizedBox(
            //                     width: MediaQuery.of(context).size.width * 0.1),
            //                 Icon(Icons.map_sharp),
            //                 SizedBox(
            //                     width: MediaQuery.of(context).size.width * 0.05),
            //                 Text(
            //                   "Madinty, Cairo, Egypt",
            //                   style: TextStyle(fontSize: 16),
            //                 ),
            //               ],
            //             ),
            //             SizedBox(
            //                 height: MediaQuery.of(context).size.height * 0.02),
            //             Row(
            //               children: [
            //                 SizedBox(
            //                     width: MediaQuery.of(context).size.width * 0.06),
            //                 Container(
            //                   child: Row(
            //                     children: [
            //                       Column(
            //                         children: [
            //                           Container(
            //                             child: CircleAvatar(
            //                               backgroundImage:
            //                               AssetImage("images/avatar.jpg"),
            //                               radius: 35,
            //
            //                             ),
            //                           )
            //                         ],
            //                       ),
            //                       Column(
            //                         children: [
            //                           Row(children: [
            //                             SizedBox(
            //                                 width: MediaQuery.of(context)
            //                                     .size
            //                                     .width *
            //                                     0.03),
            //                             Text(
            //                               "Driver",
            //                               style: TextStyle(
            //                                   fontSize: 16,
            //                                   color: Colors.black45),
            //                             ),
            //                           ]),
            //                           SizedBox(
            //                               height:
            //                               MediaQuery.of(context).size.height *
            //                                   0.009),
            //                           Row(
            //                             children: [
            //                               SizedBox(
            //                                   width: MediaQuery.of(context)
            //                                       .size
            //                                       .width *
            //                                       0.04),
            //                               Text(
            //                                 "Omar Mansour",
            //                                 style: TextStyle(fontSize: 18),
            //                               )
            //                             ],
            //                           )
            //                         ],
            //                       ),
            //                       SizedBox(
            //                           width: MediaQuery.of(context).size.width *
            //                               0.2),
            //                       Column(
            //                         children: [Icon(Icons.fire_truck_sharp)],
            //                       )
            //                     ],
            //                   ),
            //                 )
            //               ],
            //             ),
            //             Row(
            //                 children: [
            //                   SizedBox(
            //                       width: MediaQuery.of(context).size.width * 0.1),
            //                   SizedBox(
            //                       height: MediaQuery.of(context).size.height * 0.1),
            //                   Text("Bins",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
            //                 ]
            //             ),
            //             Row(
            //               children: [
            //                 SizedBox(
            //                     width: MediaQuery.of(context).size.width * 0.1),
            //                 Icon(Icons.restore_from_trash),
            //                 SizedBox(
            //                     width: MediaQuery.of(context).size.width * 0.05),
            //                 Text(
            //                   "S Teseen Rd - RB1",
            //                   style: TextStyle(fontSize: 16),
            //                 )
            //               ],
            //             ),
            //           ],
            //         )
            //     ),
            //
            //   ],
            // ),]),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
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
                        icon: Icons.delete,
                        text: 'Bin',
                      ),
                      GButton(
                        icon: Icons.fire_truck,
                        text: 'Truck',
                      ),
                      GButton(
                        icon: Icons.person,
                        text: 'user',
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
                                  builder: (context) => AdminBin()));
                        if (_index == 1)
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Truck()));
                        if (_index == 2)
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) =>AdminUserProfile()));
                      });
                      // if (_index == 3)                    });
                    },
                  ),
                ),
              ),
            ),
          );
        });
  }
}
