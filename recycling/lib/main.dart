import 'package:flutter/material.dart';
import 'package:recycling/AdminMainMenu.dart';
import 'package:recycling/MainMenu.dart';
import 'package:recycling/start.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:recycling/test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
void main() {


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

      home:AdminHomePage()
      // home:start()
      // home:homePage(Email: "Email", Password: "Password", fullName: "fullName", mobileNumber: "mobileNumber", gender: "gender", dateOfBirth: "dateOfBirth", cart: cart, totalAmount: totalAmount, orders: orders)
      // home :testo(),
    );
  }
}
