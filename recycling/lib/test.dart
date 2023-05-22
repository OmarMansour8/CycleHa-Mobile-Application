import 'package:http/http.dart' as http;
import 'dart:convert';


var Email ;
var Password ;
var fullName ;
var mobileNumber ;
var gender ;
var location ;
var dateOfBirth ;
var data;
var user_points;
var items_recycled;
List<List> binUsedList=[];

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
    'mobile' : mobile,
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
Future getUserData(String mobile) async{
  await getItemCount(mobile);
  var url =  Uri.parse(
      'https://phlegmier-marches.000webhostapp.com/getUserData.php');

  var response = await http.post(url, body: {
    "mobile": mobile,
  }
  );

  // print(json.decode(response.body));
  var data1 = await json.decode(response.body);
  getData(mobile, data1);
  print(data1);
  data=data1;

  print("mamaos ${data1.runtimeType}");

  return data1;

  // return json.decode(response.body);
}
getData(String mobile,var data)  {
  Email = data[0]["User_Email"];
  fullName = data[0]["User_Name"];
  mobileNumber = data[0]["User_MobileNumber"];
  dateOfBirth = data[0]["User_DateofBirth"];
  Password = data[0]["User_Password"];
  location = data[0]["User_Location"];


}

void main() {
getUserData("01016606186");
  // var x =
  // [{"Truck_ID": "124 - أ ي ج", "Truck_Capacity": "150"},{"Truck_ID": "124 - أ ي ج", "Truck_Capacity": "150"}, {"Truck_ID": "TST - 1",' Truck_Capacity': "150"}];
  // print(x.toSet().toList());

  // return json.decode(response.body);
}
