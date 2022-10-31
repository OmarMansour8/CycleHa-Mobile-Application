import 'package:flutter/material.dart';
import 'package:recycling/start.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main()async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp( MyHomePage());
}



class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: start(),
    );
  }
}
