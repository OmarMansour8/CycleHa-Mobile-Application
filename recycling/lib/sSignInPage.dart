import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:recycling/AdminBin.dart';
import 'package:recycling/AdminMainMenu.dart';
import 'package:recycling/MainMenu.dart';
import 'package:recycling/SignUp.dart';
import 'package:recycling/main.dart';
// import 'HomePage.dart';

class Sign_In1 extends StatefulWidget {
  const Sign_In1({Key? key}) : super(key: key);
  @override
  State<Sign_In1> createState() => _Sign_In1State();
}

class _Sign_In1State extends State<Sign_In1> {
  var Email ;
  var Password ;
  var fullName ;
  var mobileNumber ;
  var gender ;
  var dateOfBirth ;
  var data;
  var user_points;
  var items_recycled;
  var location;
  bool checkCondition = true;
  TextEditingController mobile = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  static var metalCount;
  static var plasticCount;
  static var metalPoints;
  static var plasticPoints;

  Future getUserData(String mobile) async{
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
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              homePage(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data, location: location)
      ), // MaterialPageRoute
    );
    return data1;

    // return json.decode(response.body);
  }
  Future SendData(var x) async {
    var url = Uri.parse('https://phlegmier-marches.000webhostapp.com/register.php') ;
    var data1 = {"points": x,};
    final response = await http.post(url, body:{
      data1
    });
    try {
      var data = json.decode(response.body);
      //  print("omar1");
      print(data);
      if (data == "Error") {
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
      else if (data == "Success") {
        getData(mobile.text,data);
        Fluttertoast.showToast(
            msg: "Registration Successful",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);


      }
      if (data == "Already Exists") {
        Fluttertoast.showToast(
            msg: "This User Already Exist!",
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


  getData(String mobile,var data)  {
    Email = data[0]["User_Email"];
    fullName = data[0]["User_Name"];
    mobileNumber = data[0]["User_MobileNumber"];
    dateOfBirth = data[0]["User_DateofBirth"];
    Password = data[0]["User_Password"];
    location = data[0]["User_Location"];


  }


  Future AdminLogin() async {
    var url = Uri.parse('https://phlegmier-marches.000webhostapp.com/admin.php') ;
    var response = await http.post(Uri.parse('https://phlegmier-marches.000webhostapp.com/admin.php'), body: {
      "mobile": mobile.text,
      "pass": pass.text,
    });
    var data = json.decode (response.body);
    print("3amoura $data");
    if (data.toString() == "Success") {
      await Fluttertoast.showToast (
        msg: 'Login Successful',
        backgroundColor: Colors.green,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,

      );
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                AdminBin()
        ), // MaterialPageRoute
      );

    } else {
      await Login();
    }
  }

  Future Login() async {
    var url = Uri.parse('https://phlegmier-marches.000webhostapp.com/login.php') ;
    var response = await http.post(Uri.parse('https://phlegmier-marches.000webhostapp.com/login.php'), body: {
      "mobile": mobile.text,
      "pass": pass.text,
    });
    var data = json.decode (response.body);
    if (data.toString() == "Success") {
      getUserData(mobile.text);
      await Fluttertoast.showToast (
        msg: 'Login Successful',
        backgroundColor: Colors.green,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );

    } else {
      Navigator.pop(context);
      Fluttertoast.showToast (
        backgroundColor: Colors.red,
        textColor: Colors.white,
        msg: 'Incorrect Username or Password',
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }
  List<Widget> cart=[];
  // String gender = FirebaseFirestore.instance.collection('Users').;
  void showAlertDialog(BuildContext context){
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

  //final Widget child;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(

      body:
      SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Color.fromRGBO(64, 168, 88, 1)
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.12,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.15 ,),
                  Text("Hello Again,",style: TextStyle(color: Colors.white,fontSize: 34,fontWeight: FontWeight.bold, letterSpacing: 1.5),),
//Welcome to e3ada app! Let's recycle smarter and make a positive impact on the planet.
                ],),

              SizedBox(
                height: MediaQuery.of(context).size.height*0.008,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.15 ,),
                  Text("Welcome Back",style: TextStyle(color: Colors.white,fontSize: 34,fontWeight: FontWeight.bold,letterSpacing: 1.5),),

                ],),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.03,
              ),

              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.15 ,),
                  Text("Let's recycle smarter and make",style: TextStyle(color: Colors.white,letterSpacing: 2),),

                ],),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.15 ,),
                  Text("a positive impact on the planet",style: TextStyle(color: Colors.white,letterSpacing: 2),),

                ],),

              SizedBox(
                height: MediaQuery.of(context).size.height*0.09,
              ),

              Container(
                width: MediaQuery.of(context).size.width-MediaQuery.of(context).size.width*0.1,
                height: MediaQuery.of(context).size.height*0.48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30),bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.07,
                    ),

                    Container(
                      // height: MediaQuery.of(context).size.height*0.8,
                      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.08, 0, MediaQuery.of(context).size.width*0.08, 0),
                      decoration: BoxDecoration(
                        color:Color.fromRGBO(246, 248, 252, 5),
                        borderRadius: BorderRadius.circular(20),
                        // boxShadow: [
                        //   BoxShadow(
                        //       color: Colors.black26,
                        //       // blurRadius: 6,
                        //       offset: Offset(2, 2),
                        //
                        //
                        //   ),

                        // ],


                      ),
                      padding: EdgeInsets.all(1),
                      child: TextField(
                        cursorColor: Color.fromRGBO(64, 168, 88, 1),
                        onChanged: (value) {
                          setState(() {
                            Email = value;
                          });
                        },
                        controller: mobile,
                        decoration: InputDecoration(
                          focusColor:Color.fromRGBO(64, 168, 88, 1),
                          labelStyle: TextStyle(color: Color.fromRGBO(64, 168, 88, 1)),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          labelText: 'Phone Number',
                          prefixIcon: Icon(Icons.account_circle_rounded, color:Color.fromRGBO(64, 168, 88, 1)),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.08,
                        0,
                        MediaQuery.of(context).size.width * 0.08,
                        0,
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(246, 248, 252, 5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.all(1),
                      child: TextField(
                        obscureText: true,
                        cursorColor: Color.fromRGBO(64, 168, 88, 1),
                        onChanged: (value) {
                          setState(() {
                            Password = value;
                          });
                        },
                        controller: pass,
                        decoration: InputDecoration(
                          focusColor: Color.fromRGBO(64, 168, 88, 1),
                          labelStyle: TextStyle(color: Color.fromRGBO(64, 168, 88, 1)),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.password, color: Color.fromRGBO(64, 168, 88, 1)),
                        ),
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height*0.05,),


                    Container(
                        margin: EdgeInsets.symmetric(vertical: 12),
                        width: size.width * 0.49,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: SizedBox(height: 60, child:  ElevatedButton(
                            onPressed: () {
                              showAlertDialog(context);
                              AdminLogin();
                            },
                            child: Text(
                              'Sign In',
                              style:
                              TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:Color.fromRGBO(64, 168, 88, 1),

                            ),
                          )),
                        )),
                  ],
                ),

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Text('Does not have an account?',style: TextStyle(color: Colors.white),),
                  TextButton(
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Sign_Up()));
                    },
                  )
                ],
                // mainAxisAlignment: MainAxisAlignment.center,
              ),


            ],
          ),
        ),),
    );

  }
}