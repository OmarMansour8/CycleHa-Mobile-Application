import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recycling/MainMenu.dart';
import 'package:recycling/SignIn.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({Key? key}) : super(key: key);
  @override
  State<Sign_Up> createState() => _Sign_UpState();
}
class _Sign_UpState extends State<Sign_Up> {
  String Email='';
  String Password='';
  String fullName = '';
  String mobileNumber = '';
  String gender='';
  String dateOfBirth = '';
  double totalAmount = 0;
  List<String> orders=[];
  bool buttonEnabled = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<Widget> cart=[];
  //
  DateTime date1=DateTime.now();
  Future<Null>selectDate(BuildContext context) async{
    final DateTime? picked=await showDatePicker(
      context: context, initialDate: date1, firstDate: DateTime(1960), lastDate: DateTime(2030),);
    if(picked!=null && picked!= date1){
      setState((){
        date1=picked;
        print(date1.toString());});}}
  enableButton(){
    buttonEnabled = true;
  }

  disableButton(){
    buttonEnabled = false;
  }
  @override
  Widget build(BuildContext context) {
    dateOfBirth='${date1.year} - ${date1.month} - ${date1.day}'.toString();
    Size size = MediaQuery.of(context).size;
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
                        decoration: InputDecoration(
                            focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                            focusColor: Colors.green,
                            labelStyle: TextStyle(color: Colors.green),
                            hintText: 'Full Name',
                            prefixIcon:Icon(Icons.account_circle_rounded,color: Colors.green,)
                        ),
                        onChanged: (String value){
                          setState(() {
                            fullName = value;
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
                        decoration: InputDecoration(
                            focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                            focusColor: Colors.green,
                            labelStyle: TextStyle(color: Colors.green),
                            hintText: 'Mobile Number',
                            prefixIcon:Icon(Icons.phone,color: Colors.green)
                        ),
                        onChanged: (String value){

                          setState(() {
                            mobileNumber = value;
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
                            Password = value;

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
                      if(fullName!=''&&Email!=''&&mobileNumber!=''&&Password!=''&&gender!=''&&mobileNumber.length==11){
                        enableButton();
                        return "";}
                      else{
                        disableButton();
                        return "Please fill all fields , make sure your mobile number is 11 digits";}
                    })(),style: TextStyle(color: Colors.redAccent),),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 12),
                        width: size.width*0.9,
                        child:ClipRRect(
                          borderRadius: BorderRadius.circular(29),
                          child:SizedBox(height: 60, child:  ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: Colors.green),
                              onPressed:buttonEnabled ? ()async{
                                try{
                                  final newUser = await _auth.createUserWithEmailAndPassword(email: Email, password: Password).catchError((err){
                                    showDialog(
                                      context: context,builder: (BuildContext context){
                                      return AlertDialog(
                                        title: Text('error'),
                                        content: Text(err.message),
                                        actions: [
                                          ElevatedButton(onPressed: (){
                                            Navigator.pop(context);
                                          }, child: Text('Ok'))
                                        ],
                                      ) ;
                                    },
                                    );
                                  });
                                  if(newUser != null){
                                    print('Account has been successfuly created');
                                    FirebaseFirestore.instance.collection('Users').doc('$Email').set( {
                                      'Full Name':'$fullName',
                                      'Email':'$Email',
                                      'Mobile Number':'$mobileNumber',
                                      'Password':'$Password',
                                      'Date Of Birth':'$dateOfBirth',
                                      'Gender':'$gender',
                                    });
                                    print(Email);
                                    print(Password);
                                    print(gender);
                                    print(dateOfBirth);
                                    print(fullName);
                                    print(mobileNumber);

                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>homePage(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, cart: cart, totalAmount: totalAmount, orders: orders)));



                                  }

                                }
                                catch(e){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e'),backgroundColor: Colors.black26,));

                                  print(e);
                                }
                              }:null, child:Text('Sign Up',style: TextStyle(color: Colors.white,fontSize: 19),))),)),
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