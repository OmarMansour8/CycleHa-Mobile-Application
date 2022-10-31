import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class myaccount extends StatefulWidget {
  String Email = '';
  String Password = '';
  String fullName = '';
  String mobileNumber = '';
  String gender = '';
  String dateOfBirth = '';
  List<Widget> cart = [];
  double totalAmount = 0;
  List<String> orders = [];

  myaccount(
      {required this.Email,
        required this.Password,
        required this.fullName,
        required this.mobileNumber,
        required this.gender,
        required this.dateOfBirth,
        required this.cart,
        required this.totalAmount,
        required this.orders});
  @override
  State<myaccount> createState() => _myaccountState(
      Email: Email,
      Password: Password,
      fullName: fullName,
      mobileNumber: mobileNumber,
      gender: gender,
      dateOfBirth: dateOfBirth,
      cart: cart,
      totalAmount: totalAmount,
      orders: orders);
}

class _myaccountState extends State<myaccount> {
  String Email = '';
  String Password = '';
  String fullName = '';
  String mobileNumber = '';
  String gender = '';
  String dateOfBirth = '';
  List<Widget> cart = [];
  String name = 'Juicy Burger';
  String image = "images/image4.jpeg";
  double totalAmount = 0;
  List<String> orders = [];

  _myaccountState(
      {required this.Email,
        required this.Password,
        required this.fullName,
        required this.mobileNumber,
        required this.gender,
        required this.dateOfBirth,
        required this.cart,
        required this.totalAmount,
        required this.orders});
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

  @override
  Widget build(BuildContext context) {
    getData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60)),
                  color: Colors.green,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.chevron_left,
                              size: 35,
                              color: Colors.white,
                            ))
                      ],
                    ),
                    Row(children: [
                      SizedBox(
                        width: 145,
                      ),
                      Container(
                        width: 115,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/user.png"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(100)),
                        height: 115,
                      ),
                    ]),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 132, top: 0),
                          child: Text(
                            "Account info",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Full Name',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 70,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: Text('$fullName',
                        style: TextStyle(fontSize: 18, color: Colors.black54)),
                    //Text('${fullName}',style: TextStyle(fontSize: 18,)),
                  )
                ],
              ),
              Divider(
                color: Colors.black26,
                indent: 20,
                endIndent: 20,
                height: 25,
                thickness: 1,
              ),

              SizedBox(
                height: 5,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 70,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: Text('$Email',
                        style: TextStyle(fontSize: 18, color: Colors.black54)),
                    //Text('${Email}',style: TextStyle(fontSize: 18,)),
                  )
                ],
              ),
              Divider(
                color: Colors.black26,
                indent: 20,
                endIndent: 20,
                height: 25,
                thickness: 1,
              ),

              SizedBox(
                height: 5,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Date Of Birth',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 70,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: Text('$dateOfBirth',
                        style: TextStyle(fontSize: 18, color: Colors.black54)),
                    //Text('${dateOfBirth}',style: TextStyle(fontSize: 18,)),
                  )
                ],
              ),
              Divider(
                color: Colors.black26,
                indent: 20,
                endIndent: 20,
                height: 25,
                thickness: 1,
              ),

              SizedBox(
                height: 5,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Mobile Number',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 70,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: Text('$mobileNumber',
                        style: TextStyle(fontSize: 18, color: Colors.black54)),
                    //Text('${mobileNumber}',style: TextStyle(fontSize: 18,)),
                  )
                ],
              ),
              Divider(
                color: Colors.black26,
                indent: 20,
                endIndent: 20,
                height: 25,
                thickness: 1,
              ),

              SizedBox(
                height: 5,
              ),
              // ElevatedButton(onPressed: (){
              //   print(Email);
              //   print(Password);
              //   print(gender);
              //   print(dateOfBirth);
              //   print(fullName);
              //   print(mobileNumber);
              //
              // }, child: Text('omaar!!')),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Gender',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 70,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: Text('$gender',
                        style: TextStyle(fontSize: 18, color: Colors.black54)),
                    //Text('${gender}',style: TextStyle(fontSize: 18,)),
                  )
                ],
              ),
              Divider(
                color: Colors.black26,
                indent: 20,
                endIndent: 20,
                height: 25,
                thickness: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}