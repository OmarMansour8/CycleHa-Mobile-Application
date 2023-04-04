import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:recycling/MainMenu.dart';
import 'package:recycling/SignIn.dart';
import 'package:http/http.dart'as http;

class Sign_Up extends StatefulWidget {
  const Sign_Up({Key? key}) : super(key: key);
  @override
  State<Sign_Up> createState() => _Sign_UpState();
}
class _Sign_UpState extends State<Sign_Up> {
   var Email;
   var  Password;
   var  fullName;
   var  mobileNumber;
   var  gender;
   var  dateOfBirth;
   String  totalAmount =  '' ;
   var user_points;
   var items_recycled;
   var data;
   bool buttonEnabled = false;
   TextEditingController name = new TextEditingController();
   TextEditingController email = new TextEditingController();
   TextEditingController mobile = new TextEditingController();
   TextEditingController pass = new TextEditingController();
   bool visible = false ;

   Future getUserData(String name,String mobile) async{
   var url =  Uri.parse(
       'https://phlegmier-marches.000webhostapp.com/getUserData.php');
   var response = await http.post(url,body:{
     "mobile": mobile,
   }
   );

    // print(json.decode(response.body));
     var data = await json.decode(response.body);
     print(data);
     return data[0][name];
     // return json.decode(response.body);
}


   Future SendData() async {
     var url = Uri.parse('https://phlegmier-marches.000webhostapp.com/register.php') ;
     var data1 = {"name": name.text,
       "email": email.text,
       "mobile": mobile.text,
       "password": pass.text,
       "dot": dateOfBirth,
       "admin_username": "om",
       "user_points": "0"};
    final response = await http.post(url, body:{
      "name": name.text,
      "email": email.text,
      "mobile": mobile.text,
      "password": pass.text,
      "dot": dateOfBirth,
      "admin_username": "01550083829",
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
       getData(mobile.text);
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
              msg: "This User Already Exit!",
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

  // final FirebaseAuth _auth = FirebaseAuth.instance;
  List<Widget> cart=[];
  //
  DateTime date1=DateTime.now();
  Future<Null>selectDate(BuildContext context) async{
    final DateTime? picked=await showDatePicker(
      context: context, initialDate: date1, firstDate: DateTime(1960), lastDate: DateTime(2030),);
    if(picked!=null && picked!= date1){
      setState((){
        date1=picked;
        print(date1.toString());
        // dateOfBirth=picked ;
      });}}
  enableButton(){
    buttonEnabled = true;
  }

  disableButton(){
    buttonEnabled = false;
  }
  bool loading = false;
  final phoneNumberController = TextEditingController();


   Future<void> getData(String mobile) async {
     Email = await getUserData("User_Email",mobile);
     fullName = await getUserData("User_Name",mobile);
     mobileNumber = await getUserData("User_MobileNumber",mobile);
     dateOfBirth = await getUserData("User_DateofBirth",mobile);
     Password = await getUserData("User_Password",mobile);
     user_points = await getUserData("User_Points",mobile);

     print(Email);
     print(fullName);
     print(mobileNumber);
     print(dateOfBirth);
     print(Password);
     print(user_points);
     Navigator.push(
       context,
       MaterialPageRoute(
           builder: (context) =>
               homePage(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data)
       ), // MaterialPageRoute
     );



   }


  // final auth = FirebaseAuth.instance ;
  @override
  Widget build(BuildContext context) {
     // getData("User_Email");
    // fullName = getUserData("User_Name").toString();
    // mobileNumber = getUserData("User_MobileNumber").toString();
    // dateOfBirth = getUserData("User_Email").toString();
    // Email = getUserData("User_Email").toString();
    // Email = getUserData("User_Email").toString();
    // getData();

    dateOfBirth='${date1.year} - ${date1.month} - ${date1.day}'.toString() ;
    // Size size = MediaQuery.of(context).size;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body:
            Padding(
                padding: EdgeInsets.all(20),
                child: ListView(
                  children: <Widget>[
                    IconButton(onPressed: (){Navigator.pop(context);}, icon:Icon(Icons.arrow_back_ios),alignment: Alignment.topLeft,),
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 38),
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
                                offset: Offset(0,2)
                            ),]),
                      padding: EdgeInsets.all(1),
                      child: TextField(
                          // controller: fullName,
                        controller: name,
                        decoration: InputDecoration(
                            focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                            focusColor: Colors.green,
                            labelStyle: TextStyle(color: Colors.green),
                            hintText: 'Full Name',
                            prefixIcon:Icon(Icons.account_circle_rounded,color: Colors.green,)
                        ),
                        onChanged: (String value){
                          setState(() {
                            fullName = value ;
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
                          controller: email,

                        decoration: InputDecoration(focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                            focusColor: Colors.green,
                            labelStyle: TextStyle(color: Colors.green),
                            hintText: 'Email',
                            prefixIcon:Icon(Icons.alternate_email_outlined,color: Colors.green)
                        ),
                        onChanged: (String value){
                          setState(() {
                            Email = value;
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
                          controller: mobile,
                        decoration: InputDecoration(
                            focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                            focusColor: Colors.green,
                            labelStyle: TextStyle(color: Colors.green),
                            hintText: 'Mobile Number',
                            prefixIcon:Icon(Icons.phone,color: Colors.green)
                        ),
                        onChanged: (String value){

                          setState(() {
                            mobileNumber = value ;
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
                        controller: pass,
                        obscureText: true,
                        cursorColor: Colors.green,

                        decoration: InputDecoration(
                            focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                            focusColor: Colors.green,
                            labelStyle: TextStyle(color: Colors.green),
                            hintText: 'New Password',
                            prefixIcon:Icon(Icons.password,color: Colors.green)
                        ),
                        onChanged: (String value){
                          setState(() {
                            Password = value ;

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
                              offset: Offset(0,2),
                            ),]),
                      padding: EdgeInsets.all(1),
                      child:Row(
                        children: [
                          Text('  Date of Birth:  ',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 15)),
                          IconButton(onPressed: (){selectDate(context);}, icon: Icon(Icons.date_range,color: Colors.green,)),
                          Text(('${date1.year} - ${date1.month} - ${date1.day}').toString(),style: TextStyle(color: Colors.black87),)
                        ],
                      ),

                    ),


                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Select your Gender:",style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold)),
                        RadioButtonGroup(activeColor: Colors.green,
                            labels:<String>["Male","Female"],
                            onSelected: (String selected) {


                              setState(() {
                                gender = selected;
                              });}
                        )
                      ],
                    ),
                    Text((() {
                      if(fullName!=''&&Email!=''&&mobileNumber!=''&&Password!=''&&gender!=''){
                        enableButton();
                        return "";}
                      else{
                        disableButton();
                        return "Please fill all fields , make sure your mobile number is 11 digits";}
                    })(),style: TextStyle(color: Colors.redAccent),),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 12),
                        width: MediaQuery.of(context).size.width*0.9,
                        child:ClipRRect(
                          borderRadius: BorderRadius.circular(29),
                          child:SizedBox(height: 60, child:  ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                              onPressed:(){
                                SendData();
                                getUserData(mobile.text,mobile.text);
                                getData(mobile.text);


                                // userRegistration();
                              },
                              child:Text('Sign Up',style: TextStyle(color: Colors.white,fontSize: 19),)

  )
  ),
  )
  ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Sign_In()));
                      },
                      child: const Text('Already have an account?',style: TextStyle(color: Colors.green,fontSize: 16)),
                    ),
                  ],
                ))
        )


    );




  }





}