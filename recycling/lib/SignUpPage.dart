// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:flutter/material.dart';
// import 'package:recycling/MainMenu.dart';
// import 'package:recycling/SignUp.dart';
// import 'package:recycling/main.dart';
// // import 'HomePage.dart';
//
// class SignUpPage extends StatefulWidget {
//   const SignUpPage({Key? key}) : super(key: key);
//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }
//
// class _SignUpPageState extends State<SignUpPage> {
//   var Email;
//   var  Password;
//   String firstname="";
//   String lastname="";
//   String  fullName = "";
//
//   var  mobileNumber;
//   var  gender;
//   var  dateOfBirth;
//   String  totalAmount =  '' ;
//   var user_points;
//   var items_recycled;
//   var data;
//   bool buttonEnabled = false;
//   TextEditingController fname = new TextEditingController();
//   TextEditingController lname = new TextEditingController();
//   TextEditingController email = new TextEditingController();
//   TextEditingController mobile = new TextEditingController();
//   TextEditingController pass = new TextEditingController();
//   bool visible = false ;
//
//   Future getUserData(String name,String mobile) async{
//     var url =  Uri.parse(
//         'https://phlegmier-marches.000webhostapp.com/getUserData.php');
//     var response = await http.post(url,body:{
//       "mobile": mobile,
//     }
//     );
//
//     // print(json.decode(response.body));
//     var data = await json.decode(response.body);
//     print(data);
//     return data[0][name];
//     // return json.decode(response.body);
//   }
//
//
//   Future SendData() async {
//     fullName = firstname + " "+ lastname;;
//     var url = Uri.parse('https://phlegmier-marches.000webhostapp.com/register.php') ;
//     var data1 = {"name": fullName,
//       "email": email.text,
//       "mobile": mobile.text,
//       "password": pass.text,
//       "dot": dateOfBirth,
//       "admin_username": "om",
//       "user_points": "0"};
//     final response = await http.post(url, body:{
//       "name": fullName,
//       "email": email.text,
//       "mobile": mobile.text,
//       "password": pass.text,
//       "dot": dateOfBirth,
//       "admin_username": "01550083829",
//     });
//     try {
//       var data = json.decode(response.body);
//       //  print("omar1");
//       print(data);
//       if (data == "Error") {
//         Fluttertoast.showToast(
//             msg: "Something Went Wrong Please Try Again Later",
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.CENTER,
//             timeInSecForIosWeb: 1,
//             backgroundColor: Colors.red,
//             textColor: Colors.white,
//             fontSize: 16.9
//         );
//       }
//       else if (data == "Success") {
//         getData(mobile.text);
//         Fluttertoast.showToast(
//             msg: "Registration Successful",
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.CENTER,
//             timeInSecForIosWeb: 1,
//             backgroundColor: Colors.green,
//             textColor: Colors.white,
//             fontSize: 16.0);
//
//
//       }
//       if (data == "Already Exists") {
//         Fluttertoast.showToast(
//             msg: "This User Already Exit!",
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.CENTER,
//             timeInSecForIosWeb: 1,
//             backgroundColor: Colors.red,
//             textColor: Colors.white,
//             fontSize: 16.9
//         );
//       }
//       else {
//         print("error");
//       }
//     }
//     catch (e) {
//       print(e);
//     }
//   }
//
//   // final FirebaseAuth _auth = FirebaseAuth.instance;
//   List<Widget> cart=[];
//   //
//   DateTime date1=DateTime.now();
//   Future<Null>selectDate(BuildContext context) async{
//     final DateTime? picked=await showDatePicker(
//       context: context, initialDate: date1, firstDate: DateTime(1960), lastDate: DateTime(2030),);
//     if(picked!=null && picked!= date1){
//       setState((){
//         date1=picked;
//         print(date1.toString());
//         // dateOfBirth=picked ;
//       });}}
//   enableButton(){
//     buttonEnabled = true;
//   }
//
//   disableButton(){
//     buttonEnabled = false;
//   }
//   bool loading = false;
//   final phoneNumberController = TextEditingController();
//
//
//   Future<void> getData(String mobile) async {
//     Email = await getUserData("User_Email",mobile);
//     fullName = await getUserData("User_Name",mobile);
//     mobileNumber = await getUserData("User_MobileNumber",mobile);
//     dateOfBirth = await getUserData("User_DateofBirth",mobile);
//     Password = await getUserData("User_Password",mobile);
//     user_points = await getUserData("User_Points",mobile);
//
//     print(Email);
//     print(fullName);
//     print(mobileNumber);
//     print(dateOfBirth);
//     print(Password);
//     print(user_points);
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//           builder: (context) =>
//               homePage(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data)
//       ), // MaterialPageRoute
//     );
//
//
//
//   }
//   void showAlertDialog(BuildContext context){
//     var alertDialog = AlertDialog(
//       backgroundColor: Colors. transparent, elevation: 0,
//       content: Container(
//         alignment: Alignment.center,
//         child: CircularProgressIndicator(
//           strokeWidth: 4,
//           color: Colors.green,
//         ),
//       ),
//     );
//     showDialog(context: context,
//         builder: (BuildContext context){return
//           alertDialog;});}
//
//
//   // final auth = FirebaseAuth.instance ;
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     dateOfBirth='${date1.year} - ${date1.month} - ${date1.day}'.toString() ;
//
//     return Scaffold(
//         backgroundColor: Colors.white,
//
//       body:
//       SingleChildScrollView(
//         child:
//
//
//           Column(
//             children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.height*0.07,
//               ),
//               Row(children: [
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width*0.08,
//                 ),
//                 IconButton(icon:Icon(Icons.arrow_back_ios,size: 24,),onPressed: (){
//                   Navigator.pop(context);
//
//                 },)
//               ],),
//
//
//               Center(
//                 child: Text("Sign Up",style :TextStyle(fontSize: 35)),
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height*0.05,
//               ),
//                     Row(children: [
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width*0.1,
//                       ),
//                       Text("Mobile Number",style :TextStyle(fontSize:20,color: Colors.grey)),
//
//                     ],),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height*0.03,
//               ),
//               Container(
//                 margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.08, 0, MediaQuery.of(context).size.width*0.08, 0),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                   border: Border.all(style: BorderStyle.solid,color: Colors.grey)
//                     ),
//                 padding: EdgeInsets.all(5),
//                 child: TextField(
//
//                   controller: mobile,
//                   decoration: InputDecoration(
//                       focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
//                       focusColor: Colors.green,
//                       labelStyle: TextStyle(color: Colors.green),
//                       // hintText: '01234567890',
//
//                       // prefixIcon:Icon(Icons.phone,color: Colors.green)
//                   ),
//                   onChanged: (String value){
//
//                     setState(() {
//                       mobileNumber = value ;
//                     });
//                   },
//                 ),
//               ),
//
//               SizedBox(
//                 height: MediaQuery.of(context).size.height*0.03,
//               ),
//               Row(children: [
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width*0.1,
//                 ),
//                 Text("Full Name",style :TextStyle(fontSize:20,color: Colors.grey)),
//
//               ],),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height*0.03,
//               ),
//
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   new Flexible(
//                     child: new Container(
//                       margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.08, 0, 0, 0),
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(10),
//                           border: Border.all(style: BorderStyle.solid,color: Colors.grey)
//                       ),
//                       padding: EdgeInsets.all(5),
//                       child: TextField(
//                         controller: fname,
//                         decoration: InputDecoration(
//                           focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
//                           focusColor: Colors.green,
//                           labelStyle: TextStyle(color: Colors.green),
//                           // hintText: 'First Name',
//
//                           // prefixIcon:Icon(Icons.phone,color: Colors.green)
//                         ),
//                         onChanged: (String value){
//
//                           setState(() {
//                             firstname = value ;
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 20.0,),
//                   new Flexible(
//                     child: new Container(
//                       margin: EdgeInsets.fromLTRB(0, 0, MediaQuery.of(context).size.width*0.08, 0),
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(10),
//                           border: Border.all(style: BorderStyle.solid,color: Colors.grey)
//                       ),
//                       padding: EdgeInsets.all(5),
//                       child: TextField(
//                         controller: lname,
//                         decoration: InputDecoration(
//                           focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
//                           focusColor: Colors.green,
//                           labelStyle: TextStyle(color: Colors.green),
//                           // hintText: 'Last Name',
//
//                           // prefixIcon:Icon(Icons.phone,color: Colors.green)
//                         ),
//                         onChanged: (String value){
//
//                           setState(() {
//                             lastname = value ;
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//
//                 ],
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height*0.03,
//               ),
//
//               Row(children: [
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width*0.1,
//                 ),
//                 Text("Email",style :TextStyle(fontSize:20,color: Colors.grey)),
//
//               ],),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height*0.03,
//               ),
//               Container(
//                 margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.08, 0, MediaQuery.of(context).size.width*0.08, 0),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(style: BorderStyle.solid,color: Colors.grey)
//                 ),
//                 padding: EdgeInsets.all(5),
//                 child: TextField(
//                   controller: email,
//                   decoration: InputDecoration(
//                     focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
//                     focusColor: Colors.green,
//                     labelStyle: TextStyle(color: Colors.green),
//                     // hintText: '',
//
//                     // prefixIcon:Icon(Icons.phone,color: Colors.green)
//                   ),
//                   onChanged: (String value){
//
//                     setState(() {
//                       Email = value ;
//                     });
//                   },
//                 ),
//               ),
//
//               SizedBox(
//                 height: MediaQuery.of(context).size.height*0.03,
//               ),
//
//               Row(children: [
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width*0.1,
//                 ),
//                 Text("Password",style :TextStyle(fontSize:20,color: Colors.grey)),
//
//               ],),
//
//               SizedBox(
//                 height: MediaQuery.of(context).size.height*0.03,
//               ),
//               Container(
//                 margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.08, 0, MediaQuery.of(context).size.width*0.08, 0),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(style: BorderStyle.solid,color: Colors.grey)
//                 ),
//                 padding: EdgeInsets.all(5),
//                 child: TextField(
//                   obscureText: true,
//                   controller: pass,
//                   decoration: InputDecoration(
//                     focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
//                     focusColor: Colors.green,
//                     labelStyle: TextStyle(color: Colors.green),
//                     // hintText: '',
//
//                     // prefixIcon:Icon(Icons.phone,color: Colors.green)
//                   ),
//                   onChanged: (String value){
//
//                     setState(() {
//                       Password = value ;
//                     });
//                   },
//                 ),
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height*0.03,
//               ),
//
//               Row(children: [
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width*0.1,
//                 ),
//                 Text("Date of Birth",style :TextStyle(fontSize:20,color: Colors.grey)),
//
//               ],),
//
//               SizedBox(
//                 height: MediaQuery.of(context).size.height*0.03,
//               ),
//               Container(
//                 margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.08, 0, MediaQuery.of(context).size.width*0.08, 0),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(style: BorderStyle.solid,color: Colors.grey)
//                 ),
//                 padding: EdgeInsets.all(5),
//                 child:Row(
//                   children: [
//                     // Text('  Date of Birth:  ',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 15)),
//                     IconButton(onPressed: (){selectDate(context);}, icon: Icon(Icons.date_range,color: Colors.green,)),
//                     Text(('${date1.year} - ${date1.month} - ${date1.day}').toString(),style: TextStyle(color: Colors.black87),)
//                   ],
//                 ),
//
//               ),
//
//
//
//                SizedBox(height: MediaQuery.of(context).size.height*0.05,),
//
//                     Container(
//                         margin: EdgeInsets.symmetric(vertical: 12),
//                         width: size.width * 0.49,
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(15),
//                           child: SizedBox(height: 60, child:  ElevatedButton(
//                             onPressed: () {
//                               showAlertDialog(context);
//                               SendData();
//                               getUserData(mobile.text,mobile.text);
//                               getData(mobile.text);
//
//                             },
//                             child: Text(
//                               'Sign Up',
//                               style:
//                               TextStyle(color: Colors.white, fontSize: 18),
//                             ),
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Color.fromRGBO(64, 168, 88, 1),
//                             ),
//                           )),
//                         )),
//
//
//
//
//             ],
//           ),
//
//       ),
//     );
//
//   }
// }