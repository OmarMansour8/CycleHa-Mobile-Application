import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:recycling/MainMenu.dart';
import 'package:recycling/SignUp.dart';
import 'package:recycling/main.dart';
// import 'HomePage.dart';

class Sign_In extends StatefulWidget {
  const Sign_In({Key? key}) : super(key: key);
  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  var Email ;
  var Password ;
  var fullName ;
  var mobileNumber ;
  var gender ;
  var dateOfBirth ;
  var data;
  var user_points;
  var items_recycled;
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
              homePage(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data)
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
    dateOfBirth = data[0]["USer_DateofBirth"];
    Password = data[0]["User_Password"];


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

  //final Widget child;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Padding(
                padding: EdgeInsets.all(20),
                child: ListView(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios),
                      alignment: Alignment.topLeft,
                    ),
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 40),
                        )),
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                offset: Offset(0, 2)),
                          ]),
                      padding: EdgeInsets.all(1),
                      child: TextField(
                        cursorColor: Colors.green,
                        onChanged: (value) {
                          setState(() {
                            Email = value;
                          });
                        },
                        controller: mobile,
                        decoration: InputDecoration(
                          focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                          focusColor: Colors.green,
                          labelStyle: TextStyle(color: Colors.green),
                          labelText: 'Phone Number',
                          prefixIcon: Icon(Icons.account_circle,color: Colors.green,),),
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
                                offset: Offset(0, 2)),
                          ]),
                      padding: EdgeInsets.all(1),
                      child: TextField(
                        obscureText: true,
                        cursorColor: Colors.green,
                        onChanged: (value) {
                          setState(() {
                            Password = value;
                          });
                        },
                        controller: pass,
                        decoration: InputDecoration(
                            focusColor: Colors.green,
                            labelStyle: TextStyle(color: Colors.green),
                            focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),

                            labelText: 'Password',

                            prefixIcon: Icon(Icons.password,color: Colors.green,)),
                      ),
                    ),

                    SizedBox(height: 30,),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 12),
                        width: size.width * 0.9,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(29),
                          child: SizedBox(height: 60, child:  ElevatedButton(

                            onPressed: () {
                              Login();

                            },
                            child: Text(
                              'Sign In',
                              style:
                              TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                          )),
                        )),
                    Row(
                      children: <Widget>[
                        const Text('Does not have account?'),
                        TextButton(
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 20, color: Colors.green),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Sign_Up()));
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ],
                ))

        ));
  }
}