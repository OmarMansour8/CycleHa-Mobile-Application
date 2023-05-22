import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:recycling/sSignInPage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:recycling/start.dart';

class Change_Password extends StatefulWidget {
  String Email = '';
  String Password = '';
  String fullName = '';
  String mobileNumber = '';
  String gender = '';
  String dateOfBirth = '';
  var user_points;
 var data;
  var items_recycled;





  Change_Password({required this.Email,
    required this.Password,
    required this.fullName,
    required this.mobileNumber,
    required this.gender,
    required this.dateOfBirth,
    required this.user_points,
    required this.items_recycled,
    required this.data

  });
  @override
  State<Change_Password> createState() => _Change_PasswordState(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth,user_points: user_points,items_recycled: items_recycled, data:data);
}
class _Change_PasswordState extends State<Change_Password> {
  String Email='';
  String Password='';
  String fullName = '';
  String mobileNumber = '';
  String gender='';
  String dateOfBirth = '';
  String newPassword='';
  String currentPassword='';
  String confirmPassword='';
  bool buttonEnabled = false;
  // final currentUser = FirebaseAuth.instance.currentUser;
  final newPasswordContoller =TextEditingController();
  var data;
  var user_points;
  var items_recycled;
  //method to enable save button
  enableButton(){
    buttonEnabled = true;
  }

//constructor

  _Change_PasswordState({required this.Email,
    required this.Password,
    required this.fullName,
    required this.mobileNumber,
    required this.gender,
    required this.dateOfBirth,
    required this.user_points,
    required this.items_recycled,
    required this.data

  });

  // //change password in user document(optional)
  // updateData(val){
  //   FirebaseFirestore.instance.collection('Users').doc(Email).update({'Password': '$val'});
  // }
  //change password from fire base authentication

  Future changePassword(newPassword) async{

    var url = Uri.parse('https://phlegmier-marches.000webhostapp.com/cahngePassword.php') ;
    var data1 = {"password": newPassword.toString(),
      "mobile": mobileNumber.toString(),
    };
    final response = await http.post(url, body:{"password": newPassword.toString(),
      "mobile": mobileNumber.toString(),
    });
    try {
      var data = json.decode(response.body);
      print("omar1");
      print(data);
      if (data == "Error") {
        Navigator.pop(context);
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
        Fluttertoast.showToast(
            msg: "Password Changed Successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Sign_In1()));


      }

      else {
        print("error");
      }
    }
    catch (e) {
      print(e);
    }
  }
  disableButton(){
    buttonEnabled = false;
  }
  void dispose(){
    newPasswordContoller.dispose();
    super.dispose();
  }
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
  @override
  Widget build(BuildContext context) {
    print("data $Password");
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Padding(
                padding: EdgeInsets.all(20),

                child: ListView(
                    children: <Widget>[
                      IconButton(onPressed: (){Navigator.pop(context);}, icon:Icon(Icons.arrow_back_ios),alignment: Alignment.topLeft,),
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Change your Password',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                      //old Password Field
                      Container(
                        margin: EdgeInsets.all(15),
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
                          obscureText: true,
                          decoration: InputDecoration(
                              focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                              focusColor: Colors.green,
                              labelStyle: TextStyle(color: Colors.green),
                              hintText: 'Old Password',
                              prefixIcon:Icon(Icons.password,color: Colors.green)
                          ),
                          onChanged: (val){
                            setState(() {
                              currentPassword = val;
                              if(currentPassword==Password&&newPassword==confirmPassword&&newPassword!=''&&confirmPassword!=''&&newPassword!=currentPassword){
                                enableButton();
                                }
                              else{
                                disableButton();
                               }

                            });
                          }

                          ,
                        ),
                      ),
                      //new Password Field
                      Container(
                        margin: EdgeInsets.all(15),
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
                            obscureText: true,
                            decoration: InputDecoration(
                                focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                                focusColor: Colors.green,
                                labelStyle: TextStyle(color: Colors.green),
                                hintText: 'New Password',
                                prefixIcon:Icon(Icons.password  ,color: Colors.green)
                            ),
                            onChanged: (val) {
                              setState(() {
                                newPassword=val;
                              });
                            }
                        ),
                      ),
                      //Confirm Password Field
                      Container(
                        margin: EdgeInsets.all(15),
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
                            obscureText: true,
                            decoration: InputDecoration(
                                focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                                focusColor: Colors.green,
                                labelStyle: TextStyle(color: Colors.green),
                                hintText: 'Confirm Password',
                                prefixIcon:Icon(Icons.password,color: Colors.green)
                            ),
                            onChanged: (val) {
                              setState(() {
                                confirmPassword = val;
                              });

                            }

                        ),
                      ),
                      //error msg
                      Row(
                          children:[
                            SizedBox(width: 25,),
                            Text((() {
                              if(currentPassword==Password&&newPassword==confirmPassword&&newPassword!=''&&confirmPassword!=''&&newPassword!=currentPassword){
                                enableButton();
                                return "";}
                              else{
                                disableButton();
                                return "Old password must be correct and\nnew password must match in both fields ";}
                            })(),style: TextStyle(color: Colors.redAccent),),
                          ]),
                      SizedBox(height: 80,),

                      //save button

                      SizedBox(height: 60, child: ElevatedButton(onPressed:buttonEnabled ? (){

                        showAlertDialog(context);
                        // updateData(newPassword);
                        changePassword(newPassword);



                      }:null, child: Text('Confirm'),style: ElevatedButton.styleFrom(primary: Colors.green),),
                      )]
                )

            )
        )
    );
  }

}