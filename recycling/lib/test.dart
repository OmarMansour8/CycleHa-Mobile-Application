import 'package:http/http.dart' as http;
import 'dart:convert';

// Future ItemCount() async{
//   var user_points ;
//   int plasticCount = 0;
//   int plasticPoints = 5;
//   var url =  Uri.parse(
//       'https://phlegmier-marches.000webhostapp.com/omar.php');
//   var response = await http.post(Uri.parse(
//       'https://phlegmier-marches.000webhostapp.com/omar.php'),body:{
//     'mobile' : "01550083829",
//     'type' : "plastic"
//   }
//   );
//
//   // print(json.decode(response.body));
//   var data1 = await json.decode(response.body);
//   print(data1);
//   // plasticData = getPlasticCount(mobileNumber);
//   // print("mahmoud $plasticData");
//   // metalData = getMetalCount(mobileNumber);
//   // getData(mobile, data1);
//   print("data $data1");
//   plasticCount=0;
//   for(int i =0; i<data1.length;i++){
//     plasticCount+=int.parse(data1[0]["Item_Amount"]);
//   }
//   user_points = (plasticCount*plasticPoints);
//   print(user_points);
//   // user_points = (metalCount*metalPoints)+(plasticCount*plasticPoints);
//
//   return user_points;
// }
//
// var data;
// var Email ;
// var Password ;
// var fullName ;
// var mobileNumber ;
// var gender ;
// var dateOfBirth ;
// var user_points;
// Future getUserData(String mobile) async{
//   var url =  Uri.parse(
//       'https://phlegmier-marches.000webhostapp.com/getUserData.php');
//
//   var response = await http.post(url, body: {
//     "mobile": mobile,
//   }
//   );
//
//   // print(json.decode(response.body));
//   var data1 = await json.decode(response.body);
//   getData(mobile, data1);
//   print(data1);
//   data=data1;
//
//
//   return data1;
//
//   // return json.decode(response.body);
// }
//
// getData(String mobile,var data)  {
//   Email = data[0]["User_Email"];
//   fullName = data[0]["User_Name"];
//   mobileNumber = data[0]["User_MobileNumber"];
//   dateOfBirth = data[0]["USer_DateofBirth"];
//   Password = data[0]["User_Password"];
//
//
// }
// Future getSpecificBinData()async{
//   var url =  Uri.parse(
//       'https://phlegmier-marches.000webhostapp.com/getSpecificBin.php');
//   var response = await http.post( Uri.parse(
//       'https://phlegmier-marches.000webhostapp.com/getSpecificBin.php'),body:{
//     "area" : "5th Sattlement"
//
//   }
//   );
//
//   // print(json.decode(response.body));
//   var data1 = await json.decode(response.body);
//   print(data1);
//   // binData = data1;
//   // print("length ${binData.length}");
//
//   print("mamaos ${data1.runtimeType}");
//   // if(enter == 0){
//   //   getInformation();
//   //   enter++;
//   // }
//   return data1;
// }

Future getTruckData() async{
  var url =  Uri.parse(
      'https://phlegmier-marches.000webhostapp.com/getTruck.php');
  var response = await http.post(url,body:{
  }
  );

  // print(json.decode(response.body));
  var data1 = await json.decode(response.body);
  print(data1);
  truckData1=data1;
  print("length ${truckData1.length}");

  print("mamaos ${data1.runtimeType}");
  if(enter == 0){
    getInformation();
    enter++;
  }
  return data1;

  // return json.decode(response.body);
}
var truckData1;
List _driverName = [];
List _ID = [];
List Location = [];
List Bin = [];
int enter = 0;
getInformation(){
  for(int i = 0 ; i<truckData1.length;i++){
    // _driverName.add(truckData1[i]["Bin_Location"]);
    _ID.add(truckData1[i]["Truck_ID"]);
    Bin.add(truckData1[i]["Truck_Location"]);


  }}
void main() {
  print(getTruckData());
  // return json.decode(response.body);
}
