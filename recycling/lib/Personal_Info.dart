import 'package:flutter/material.dart';

class personal_info extends StatefulWidget {
  String Email = '';
  String Password = '';
  String fullName = '';
  String mobileNumber = '';
  String gender = '';
  String dateOfBirth = '';
  var user_points;
  var data;
  var items_recycled;
  var metalCount;
  var plasticCount ;
  var location;
  // List<Widget> cart = [];
  // double totalAmount = 0;
  // List<String> orders = [];

  personal_info(
      {required this.Email,
        required this.Password,
        required this.fullName,
        required this.mobileNumber,
        required this.gender,
        required this.dateOfBirth,
        required this.user_points,
        required this.items_recycled,
        required this.data,
        required this.metalCount,
        required this.plasticCount,
        required this.location});
  @override
  State<personal_info> createState() => _personal_infoState(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data, metalCount: metalCount, plasticCount: plasticCount, location: location);
}

class _personal_infoState extends State<personal_info> {
  String Email = '';
  String Password = '';
  String fullName = '';
  String mobileNumber = '';
  String gender = '';
  String dateOfBirth = '';
  var user_points;
  var data;
  var items_recycled;
  var metalCount;
  var plasticCount ;
  var location;
  _personal_infoState(
      {required this.Email,
        required this.Password,
        required this.fullName,
        required this.mobileNumber,
        required this.gender,
        required this.dateOfBirth,
        required this.user_points,
        required this.items_recycled,
        required this.data,
        required this.metalCount,
        required this.plasticCount,
        required this.location});
  // void getData() {
  //   FirebaseFirestore.instance
  //       .collection('Users')
  //       .doc(Email)
  //       .get()
  //       .then((value) {
  //     fullName = value.get('Full Name');
  //     mobileNumber = value.get('Mobile Number');
  //     gender = value.get('Gender');
  //     dateOfBirth = value.get('Date Of Birth');
  //     print(fullName);
  //     print(mobileNumber);
  //     print(gender);
  //     print(dateOfBirth);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(),
      home: Scaffold(
        body: ListView(children: [
          Column(
            children: [
              Container(
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60)),
                  color: Color.fromRGBO(64, 168, 88, 1),
                ),
                child: Column(
                  children: [

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
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 115,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/avatar.jpg"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(100)),
                            height: 115,
                          ),
                        ]),
                    SizedBox(height: 5,),
                    Center(
                      child: Text(
                        "Account info",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
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
                    'Location',
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
                    child: Text('$location',
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
        ],

        ),
      ),
    );
  }
}