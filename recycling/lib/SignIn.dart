import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:recycling/MainMenu.dart';
// import 'HomePage.dart';

class Sign_In extends StatefulWidget {
  const Sign_In({Key? key}) : super(key: key);
  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  String Email = '';
  String Password = '';
  String fullName = '';
  String mobileNumber = '';
  String gender = '';
  String dateOfBirth = '';
  double totalAmount = 0;
  List<String> orders=[];
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _controller = new TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  bool checkCondition = true;

  void getData() {
    FirebaseFirestore.instance
        .collection('Users')
        .doc(Email)
        .get()
        .then((value) {
      fullName = value.get('Full Name');
      mobileNumber = value.get('Mobile Number');
      gender = value.get('Gender');
      dateOfBirth = value.get('Date Of Birth');
      print(fullName);
      print(mobileNumber);
      print(gender);
      print(dateOfBirth);
    });
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
                          getData();
                        },
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
                            getData();
                          });
                        },
                        controller: _controller,
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
                            // padding: EdgeInsets.symmetric(vertical: 18,horizontal: 38),
                            // color: Colors.deepOrange,
                            // onPressed: (){},
                            onPressed: () async {
                              try {
                                final newUser =
                                await _auth.signInWithEmailAndPassword(
                                    email: Email, password: Password).catchError((err){
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

                                if (newUser != null) {
                                  print('Account has been successfuly created');



                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => homePage(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, cart: cart, totalAmount: totalAmount, orders: orders)));
                                  _controller.clear();

                                }

                              }
                              catch (e) {
                                print(e);
                              }
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
                           /* Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Sign_Up()));*/
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