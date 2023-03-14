import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recycling/EditProfile.dart';

class myaccount extends StatefulWidget {
  String Email = '';
  String Password = '';
  String fullName = '';
  String mobileNumber = '';
  String gender = '';
  String dateOfBirth = '';
  var user_points;
  var data;
  var items_recycled;

  myaccount(
      {required this.Email,
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
  State<myaccount> createState() => _myaccountState(
      Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth,user_points: user_points,items_recycled: items_recycled, data:data
     );
}

class _myaccountState extends State<myaccount> {
  String Email = '';
  String Password = '';
  String fullName = '';
  String mobileNumber = '';
  String gender = '';
  String dateOfBirth = '';
  var data;
  var user_points;
  var items_recycled;
  _myaccountState(
      {required this.Email,
        required this.Password,
        required this.fullName,
        required this.mobileNumber,
        required this.gender,
        required this.dateOfBirth,
        required this.user_points,
        required this.items_recycled,
        required this.data

      });
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
                height: MediaQuery.of(context).size.height*0.25,
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
                            )),
                  SizedBox(width: MediaQuery.of(context).size.width*0.67,),
                  SizedBox(height: 30, child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green,elevation: 0),
                      onPressed: (){
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => editProfile(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, data: data)));

                      }, child:Text('Edit',style: TextStyle(color: Colors.white,fontSize: 16),)),),
                      ],

                    ),
                    Row(
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width*0.33,),
                        CircleAvatar(

                          backgroundImage:
                          NetworkImage('https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',),
                          radius: 70,

                        )
                      ],
                    ),

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