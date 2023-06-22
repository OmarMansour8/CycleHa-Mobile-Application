import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:recycling/AdminUserProfile.dart';
import 'package:recycling/Truck.dart';
import 'package:recycling/utils/stacked_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:http/http.dart' as http;


class AdminBin extends StatefulWidget {
  @override
  State<AdminBin> createState() => _AdminBinState();
}

class _AdminBinState extends State<AdminBin> {

  var _index = 0;
  var color = const Color.fromRGBO(220, 238, 255, 1);
  var binData;
  var binData1;
  List<String> omar =[];
  List _name = [];
  List _ID = [];
  List PlasticCapacity = [];
  List MetalCapacity = [];
  List Location = [];
  List Bin_Area = [];
  List Bin_Area1 = [];
  List<Widget> Widg =[];
  int enter=0;
  var truckId=[];
  var driversId=[];
  var trucks;
  var drivers;
  //[]


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
    trucks = data1;
    drivers = data2;
    print("trucks $trucks");
    print("drivers $drivers");

  }
  Future addNewBin()async{

    var response = await http.post( Uri.parse(
        'https://phlegmier-marches.000webhostapp.com/addBin.php'),body:{
      "binId" : binId.text.toString(),
      "binArea" : binArea.text.toString(),
      "binLocation" : binLocation.text.toString(),
      "locationlt" : locationlat.text.toString(),
      "locationlng" : locationlng.text.toString(),
      "TruckId" : truck,
      "DriverId" : driver

    }
    );



    try {
      var data1 = await json.decode(response.body);
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
      else if (data1 == "Bin Sucessfully Added") {
        Fluttertoast.showToast(
            msg: "Bin Sucessfully Added",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);

        Navigator.pop(context);


      }
      if (data1 == "Bin ID Already Exist") {
        Fluttertoast.showToast(
            msg: "Bin ID Already Exist",
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

  }
  Future getSpecificBinData(var selectedValue)async{

    var response = await http.post( Uri.parse(
        'https://phlegmier-marches.000webhostapp.com/getSpecificBin.php'),body:{
      "area" : selectedValue.toString()

    }
    );
    var url =  Uri.parse(
        'https://phlegmier-marches.000webhostapp.com/getBin.php');
    var response1 = await http.post(url,body:{
    }
    );

    // print(json.decode(response.body));
    var data1 = await json.decode(response.body);
    // print("data1 $data1");
    binData=data1;

    // print(json.decode(response.body));
    var data2 = await json.decode(response1.body);
    // print("data2 $data2");
    binData1 = data2;
    print("length ${binData1}");

    // print("mamaos ${data1.runtimeType}");
    await getTruckData();
    if(enter == 0){
      getInformation();
      enter++;
    }
    else{

      getInformation2();
    }
    return data1;
  }
  Future getBinData() async{
    var url =  Uri.parse(
        'https://phlegmier-marches.000webhostapp.com/getBin.php');
    var response = await http.post(url,body:{
    }
    );

    // print(json.decode(response.body));
    var data1 = await json.decode(response.body);
    // print(data1);
    binData=data1;
    print("length ${binData.length}");

    // print("mamaos ${data1.runtimeType}");
    if(enter == 0){
      getInformation();
      enter++;
    }
    return data1;

    // return json.decode(response.body);
  }

  getInformation(){
    _name.clear();
    _ID.clear();
    PlasticCapacity.clear();
    MetalCapacity.clear();
    Bin_Area.clear();
    Bin_Area1.clear();
    print(binData1.length);

    for(int i = 0 ; i<binData1.length;i++){
      print("abl $i");
      print(binData1[i]);
      if(binData1[i]["Bin_ID"]!="Not Yet") {
        print("b3d $i");

        _name.add(binData1[i]["Bin_Location"]);
        _ID.add(binData1[i]["Bin_ID"]);
        PlasticCapacity.add(binData1[i]["Plastic_Capacity"]);
        MetalCapacity.add(binData1[i]["Metal_Capacity"]);
        Bin_Area.add(binData1[i]["Bin_Area"]);
        Bin_Area1.add(binData1[i]["Bin_Area"]);
      }
      print("name $_name");
      print("area $Bin_Area");

    }
    print("plastic $PlasticCapacity");
    print("metal $MetalCapacity");

    for(int i = 0 ; i<PlasticCapacity.length;i++){
      if(PlasticCapacity[i]==""){
        PlasticCapacity[i]="-";

      }
      if(MetalCapacity[i]==""){
        MetalCapacity[i]="-";
      }
    }
    print("plastic $PlasticCapacity");
    print("metal $MetalCapacity");

    for(int i = 0 ; i<trucks.length;i++){
      truckId.add(trucks[i]["Truck_ID"].toString());
    }

    for(int i = 0 ; i<drivers.length;i++){
      driversId.add(drivers[i]["Driver_Id"]);
    }

    var Areaname = Bin_Area1.toSet().toList();
    items=Areaname;

    for(int i = 0 ; i<_name.length;i++){
      // print("dkhlt $i");
      Widg.add(
        Container(
          // color:Colors.white,
          height: MediaQuery.of(context).size.height * 0.35,
          width: MediaQuery.of(context).size.width,
          margin:
          EdgeInsets.all(MediaQuery.of(context).size.height * 0.015),
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
                colors: [Colors.redAccent, Colors.deepOrangeAccent],
              )),

          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Text(
                    "${_name[i]}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 27),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Text(
                    "${Bin_Area[i]}",
                    style: TextStyle(fontSize: 20, color: Colors.white60),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Text(
                    "Plastic Capacity : ",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.28,
                  ),
                  Text(
                    "${PlasticCapacity[i]}",
                    style: new TextStyle(
                        fontSize: 18.0, color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.019,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Text(
                    "Metal Capacity   : ",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.28,
                  ),
                  Text(
                    "${MetalCapacity[i]}",
                    style: new TextStyle(
                        fontSize: 18.0, color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
      // print("widg ${Widg.length}");

    }



  }

  getInformation2(){

    Widg.clear();
    _name.clear();
    _ID.clear();
    PlasticCapacity.clear();
    MetalCapacity.clear();
    Bin_Area.clear();
    Bin_Area1.clear();
    print("ablo $Bin_Area1");


    for(int i = 0 ; i<binData.length;i++){
      print("abl $i");
      print(binData1[i]);
      if(binData1[i]["Bin_ID"]!="Not Yet") {
        print("b3d $i");

        _name.add(binData[i]["Bin_Location"]);
        _ID.add(binData[i]["Bin_ID"]);
        PlasticCapacity.add(binData[i]["Plastic_Capacity"]);
        MetalCapacity.add(binData[i]["Metal_Capacity"]);
        Bin_Area.add(binData[i]["Bin_Area"]);
      }
      print("name $_name");
      print("area $Bin_Area");

    }

    for(int i = 0 ; i<binData1.length;i++){
      Bin_Area1.add(binData1[i]["Bin_Area"]);

    }
    print("plastic $PlasticCapacity");
    print("metal $MetalCapacity");

    for(int i = 0 ; i<PlasticCapacity.length;i++){
      if(PlasticCapacity[i]==""){
        PlasticCapacity[i]="-";

      }
      if(MetalCapacity[i]==""){
        MetalCapacity[i]="-";
      }
    }
    print("plastic $PlasticCapacity");
    print("metal $MetalCapacity");

    for(int i = 0 ; i<trucks.length;i++){
      truckId.add(trucks[i]["Truck_ID"].toString());
    }

    for(int i = 0 ; i<drivers.length;i++){
      driversId.add(drivers[i]["Driver_Id"]);
    }

    var Areaname = Bin_Area1.toSet().toList();
    items=Areaname;
    for(int i = 0 ; i<items.length;i++){
      if(items[i]==""){
        items.removeAt(i);

      }
    }
    print("b3do $items");


    for(int i = 0 ; i<_name.length;i++){
      // print("dkhlt $i");
      Widg.add(
        Container(
          // color:Colors.white,
          height: MediaQuery.of(context).size.height * 0.35,
          width: MediaQuery.of(context).size.width,
          margin:
          EdgeInsets.all(MediaQuery.of(context).size.height * 0.015),
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
                colors: [Colors.redAccent, Colors.deepOrangeAccent],
              )),

          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Text(
                    "${_name[i]}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 27),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Text(
                    "${Bin_Area[i]}",
                    style: TextStyle(fontSize: 20, color: Colors.white60),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Text(
                    "Plastic Capacity : ",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.28,
                  ),
                  Text(
                    "${PlasticCapacity[i]}",
                    style: new TextStyle(
                        fontSize: 18.0, color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.019,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Text(
                    "Metal Capacity   : ",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.28,
                  ),
                  Text(
                    "${MetalCapacity[i]}",
                    style: new TextStyle(
                        fontSize: 18.0, color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
      // print("widg ${Widg.length}");

    }
// Navigator.pop(context);


  }


  var items = [];
  TextEditingController binId = new TextEditingController();
  TextEditingController binArea = new TextEditingController();
  TextEditingController binLocation = new TextEditingController();
  TextEditingController locationlat = new TextEditingController();
  TextEditingController locationlng = new TextEditingController();
  String bin_id="";
  String bin_area="";
  String bin_location="";
  String lt="";
  String lng="";
  String truck = "";
  String driver = "";


  var color1 = const Color(0xFF94cfd4);
  var color2 = const Color(0xFF95d3c5);
  String? TruckIDValue;
  String? driverIDValue;
  String? selectedValue2;
  void showAlertDialog1(BuildContext context){
    var alertDialog = AlertDialog(
      content: Text("Are you sure you want to add this item?"),
      scrollable: true,
      actions: [
        ElevatedButton(onPressed: (){
          addNewBin();
          bin_id = binId.text;
          bin_area = binArea.text;
          bin_location = binLocation.text;
          lt= locationlat.text;
          lng = locationlng.text;

          print(bin_id);
          print(bin_area);
          print(bin_location);
          print(lt);
          print(lng);
          print(truck);
          print(driver);
          Navigator.pop(context);


        },
            child: Text('Yes'),style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrangeAccent),),
        ElevatedButton(onPressed: (){
          Navigator.pop(context);
          },
            child: Text('No'),style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrangeAccent)),
      ],
    );
    showDialog(context: context,
        builder: (BuildContext context){
      return alertDialog;});}
  String dropdownvalue = 'Item 1';
  var Item ;

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
              controller: binId,
              // controller: name,
              decoration: InputDecoration(
                  focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.redAccent)),
                  focusColor: Colors.redAccent,
                  labelStyle: TextStyle(color: Colors.redAccent),
                  hintText: 'Bin ID',
                  prefixIcon:Icon(Icons.delete,color: Colors.redAccent,)
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
              controller: binArea,

              decoration: InputDecoration(focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.redAccent)),
                  focusColor: Colors.redAccent,
                  labelStyle: TextStyle(color: Colors.redAccent),
                  hintText: 'Bin Area',
                  prefixIcon:Icon(Icons.fire_truck_outlined,color: Colors.redAccent)
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
              controller: binLocation,
              decoration: InputDecoration(
                  focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.redAccent)),
                  focusColor: Colors.redAccent,
                  labelStyle: TextStyle(color: Colors.redAccent),
                  hintText: 'Bin Location',
                  prefixIcon:Icon(Icons.location_city,color: Colors.redAccent)
              ),
              onChanged: (String value){

                setState(() {
                  // mobileNumber = value ;
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
              controller: locationlat,
              // obscureText: true,
              cursorColor: Colors.redAccent,

              decoration: InputDecoration(
                  focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.redAccent)),
                  focusColor: Colors.redAccent,
                  labelStyle: TextStyle(color: Colors.redAccent),
                  hintText: 'Location Latitude',
                  prefixIcon:Icon(Icons.password,color: Colors.redAccent)
              ),
              onChanged: (String value){
                setState(() {
                  // Password = value ;

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
              controller: locationlng,
              // obscureText: true,
              cursorColor: Colors.redAccent,

              decoration: InputDecoration(
                  focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.redAccent)),
                  focusColor: Colors.redAccent,
                  labelStyle: TextStyle(color: Colors.redAccent),
                  hintText: 'Location Longitude',
                  prefixIcon:Icon(Icons.password,color: Colors.redAccent)
              ),
              onChanged: (String value){
                setState(() {
                  // Password = value ;

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
                      'Choose Truck Collector',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              items: truckId
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
              value: TruckIDValue,
              onChanged: (value) {
                setState(() {
                  TruckIDValue = value as String;
                  truck = TruckIDValue.toString();

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
                        color: Colors.redAccent,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              items: driversId
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
          if(binId.text!=""&&binArea.text!=""&&binLocation.text!=""&&locationlat.text!=""&&locationlng.text!=""&&truck!=""&&driver!="") {
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
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            child: Text('Add')),],);
    showDialog(context: context,
        builder: (BuildContext context){return
          alertDialog;});}

  void showAlertDialog2(BuildContext context){
    var alertDialog = AlertDialog(
      backgroundColor: Colors. transparent, elevation: 0,
      content: Container(
        decoration: BoxDecoration(),
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          strokeWidth: 4,
          color: Colors.green,
        ),
      ),
    );
    showDialog(context: context,
        builder: (BuildContext context){return
          alertDialog;});}


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getSpecificBinData(selectedValue2),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(
              body:Stack(
                  children: <Widget>[
                    ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          Container(
                            color: Colors.grey[100],
                            child: Column(
                              children: [
                                Container(
                                  // color: Colors.white,
                                    height: MediaQuery.of(context).size.height * 0.28,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(30),
                                            bottomLeft: Radius.circular(30)),
                                        color: Colors.white),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context).size.height * 0.05,
                                        ),


                                        Container(
                                            height: MediaQuery.of(context).size.height * 0.1,
                                            // alignment: Alignment.center,

                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context).size.width * 0.1,
                                                ),
                                                Text(
                                                  "Dashboard",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 34,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width:MediaQuery.of(context).size.width * 0.1 ,
                                                ),
                                                // IconButton(
                                                //   onPressed: (){
                                                //
                                                //   },
                                                //   icon: Icon(Icons.account_circle,
                                                //     size: 38,),
                                                // ),
                                                SizedBox(
                                                  width:MediaQuery.of(context).size.width * 0.2 ,
                                                ),
                                                IconButton(onPressed: (){showAlertDialog(context);}, icon: Icon(Icons.add,size: 38,))
                                              ],
                                            )


                                        ),

                                        SizedBox(
                                          height: MediaQuery.of(context).size.height * 0.004,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.07,
                                            ),
                                            DropdownButtonHideUnderline(
                                              child: DropdownButton2(

                                                isExpanded: true,
                                                hint: Row(
                                                  children: const [
                                                    Center(
                                                      child: Text(
                                                        'Choose Bin',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.black,
                                                        ),
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                items: items
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
                                                value: selectedValue2,
                                                onChanged: (value) {
                                                  setState(() {
                                                    selectedValue2 = value as String;
                                                  });
                                                },
                                                buttonStyleData: ButtonStyleData(
                                                  height:
                                                  MediaQuery.of(context).size.height * 0.07,
                                                  width: MediaQuery.of(context).size.width * 0.47,
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
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.14,
                                            ),
                                            ElevatedButton(onPressed: (){
                                              // showAlertDialog2(context);
                                              getSpecificBinData(selectedValue2);
                                            }, child: Text("Search"),style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrangeAccent)),

                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context).size.height * 0.006,
                                            )
                                          ],
                                        ),
                                        // Row(
                                        //   children: [
                                        //     SizedBox(
                                        //       width: MediaQuery.of(context).size.width * 0.74,
                                        //     ),
                                        //     Text(
                                        //       "Top Achiever",
                                        //       style: TextStyle(fontWeight: FontWeight.bold),
                                        //     )
                                        //   ],
                                        // )
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



                              ],
                            ),
                          )])]),
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
          return Scaffold(
            body:Stack(
                children: <Widget>[
                  ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        Container(
                          color: Colors.grey[100],
                          child: Column(
                            children: [
                              Container(
                                // color: Colors.white,
                                  height: MediaQuery.of(context).size.height * 0.28,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(30),
                                          bottomLeft: Radius.circular(30)),
                                      color: Colors.white),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height * 0.05,
                                      ),


                                      Container(
                                          height: MediaQuery.of(context).size.height * 0.1,
                                          // alignment: Alignment.center,

                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context).size.width * 0.1,
                                              ),
                                              Text(
                                                "Dashboard",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 34,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width:MediaQuery.of(context).size.width * 0.2 ,
                                              ),
                                              // IconButton(
                                              //   onPressed: (){
                                              //
                                              //   },
                                              //   icon: Icon(Icons.account_circle,
                                              //     size: 38,),
                                              // ),
                                              SizedBox(
                                                width:MediaQuery.of(context).size.width * 0.1 ,
                                              ),
                                              IconButton(onPressed: (){showAlertDialog(context);}, icon: Icon(Icons.add,size: 38,))
                                            ],
                                          )


                                      ),

                                      SizedBox(
                                        height: MediaQuery.of(context).size.height * 0.004,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width * 0.07,
                                          ),
                                          DropdownButtonHideUnderline(
                                            child: DropdownButton2(

                                              isExpanded: true,
                                              hint: Row(
                                                children: const [
                                                  Center(
                                                    child: Text(
                                                      'Choose Bin',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              items: items
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
                                              value: selectedValue2,
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedValue2 = value as String;
                                                });
                                              },
                                              buttonStyleData: ButtonStyleData(
                                                height:
                                                MediaQuery.of(context).size.height * 0.07,
                                                width: MediaQuery.of(context).size.width * 0.47,
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
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width * 0.14,
                                          ),
                                          ElevatedButton(onPressed: (){
                                            // showAlertDialog2(context);
                                            getSpecificBinData(selectedValue2);
                                          }, child: Text("Search"),style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrangeAccent)),

                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context).size.height * 0.006,
                                          )
                                        ],
                                      ),
                                      // Row(
                                      //   children: [
                                      //     SizedBox(
                                      //       width: MediaQuery.of(context).size.width * 0.74,
                                      //     ),
                                      //     Text(
                                      //       "Top Achiever",
                                      //       style: TextStyle(fontWeight: FontWeight.bold),
                                      //     )
                                      //   ],
                                      // )
                                    ],
                                  )),

                              for(int i = 0 ; i<Widg.length;i++)
                                Widg[i],



                            ],
                          ),
                        )])]),
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
    );
  }
}


Widget buildExpandedBox({
  required List<Widget> children,
  required Color color,
}) =>
    Expanded(
      child: Container(
        color: color,
        child: Container(
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );

Widget buildStackedImages({
  TextDirection direction = TextDirection.ltr,
}) {
  final double size = 45;
  final double xShift = 15;
  final urlImages = [
    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    'https://images.unsplash.com/photo-1616766098956-c81f12114571?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  ];

  final items = urlImages.map((urlImage) => buildImage(urlImage)).toList();

  return StackedWidgets(
    direction: direction,
    items: items,
    size: size,
    xShift: xShift,
  );
}

Widget buildImage(String urlImage) {
  final double borderSize = 2;

  return ClipOval(
    child: Container(
      padding: EdgeInsets.all(borderSize),
      color: Colors.deepOrangeAccent,
      child: ClipOval(
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}


Widget buildStackedImages1({
  TextDirection direction = TextDirection.ltr,
}) {
  final double size = 45;
  final double xShift = 15;
  final urlImages = [
    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    'https://images.unsplash.com/photo-1616766098956-c81f12114571?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  ];

  final items = urlImages.map((urlImage) => buildImage1(urlImage)).toList();

  return StackedWidgets(
    direction: direction,
    items: items,
    size: size,
    xShift: xShift,
  );
}

Widget buildImage1(String urlImage) {
  final double borderSize = 2;
  var color1 = const Color(0xFF94cfd4);
  var color2 = const Color(0xFF95d3c5);  return ClipOval(
    child: Container(
      padding: EdgeInsets.all(borderSize),
      color: color1,
      child: ClipOval(
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
