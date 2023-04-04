import 'package:flutter/material.dart';
import 'package:recycling/AdminMainMenu.dart';
import 'package:recycling/Truck.dart';
import 'package:recycling/MainMenu.dart';
import 'package:recycling/start.dart';
import 'package:recycling/test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
// import 'firebase_options.dart';
void main(){
// async{
//
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     name: 'hardware proj1',
//       options: DefaultFirebaseOptions.currentPlatform
//   );

  runApp( MyHomePage());
}



class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

List<Widget> cart=[];
List<String> orders=[];
double totalAmount=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // home:AdminBin()
      // home:AdminBin()
      // home:Truck()
      home:start()
      // home:homePage(Email: "Email", Password: "Password", fullName: "fullName", mobileNumber: "mobileNumber", gender: "gender", dateOfBirth: 'dateOfBirth', user_points: "user_points", items_recycled: "items_recycled", data: "data")
      // home :testo(),
    );
  }
}
