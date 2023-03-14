import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:recycling/MyAccount.dart';

class editProfile extends StatefulWidget {
  String Email = '';
  String Password = '';
  String fullName = '';
  String mobileNumber = '';
  String gender = '';
  String dateOfBirth = '';
 var data;
  var user_points;
  var items_recycled;

  editProfile(
      {required this.Email,
        required this.Password,
        required this.fullName,
        required this.mobileNumber,
        required this.gender,
        required this.dateOfBirth,
        required this.user_points,
        required this.data});
  @override
  State<editProfile> createState() => _editProfileState(
      Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth,user_points: user_points,items_recycled: items_recycled, data:data);
}

class _editProfileState extends State<editProfile> {
  String Email = '';
  String Password = '';
  String fullName = '';
  String mobileNumber = '';
  String gender = '';
  String dateOfBirth = '';
  var data;
  var user_points;
  var items_recycled;

  _editProfileState(
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
  String newEmail = '';
  String newfullName = '';
  String newmobileNumber = '';
  String newgender = '';
  String newdateOfBirth='';
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
  DateTime date1=DateTime.now();
  Future<Null>selectDate(BuildContext context) async{
    final DateTime? picked=await showDatePicker(
      context: context, initialDate: date1, firstDate: DateTime(1960), lastDate: DateTime(2030),);
    if(picked!=null && picked!= date1){
      setState((){
        date1=picked;
        print(date1.toString());});}}

  void ShowAlertDialog(BuildContext context){
    var alertDialog = AlertDialog(
      title: Text('Are you sure you want to save'),
      content: Text('this is a confirmation message for saving your data'),
      actions: [
        ElevatedButton(onPressed: (){
          if(newfullName!=''){
            fullName = newfullName;
            FirebaseFirestore.instance.collection('Users')
                .doc('$Email')
                .update({'Full Name' : newfullName}) // <-- Updated data
                .then((_) => print('Success'))
                .catchError((error) => print('Failed: $error'));}
          if(newdateOfBirth!=''){
            dateOfBirth=newdateOfBirth;
            FirebaseFirestore.instance.collection('Users')
                .doc('$Email')
                .update({'Date Of Birth' : newdateOfBirth}) // <-- Updated data
                .then((_) => print('Success'))
                .catchError((error) => print('Failed: $error'));}
          if(newgender!=''){
            gender = newgender;
            FirebaseFirestore.instance.collection('Users')
                .doc('$Email')
                .update({'Gender' : newgender}) // <-- Updated data
                .then((_) => print('Success'))
                .catchError((error) => print('Failed: $error'));}

          Navigator.push(context, MaterialPageRoute(builder: (context)=>myaccount(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data)));

          print('thanks');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Your information has been succesfully updated'),
              duration: Duration(seconds: 3),
            ),

          );
        }, child: Text('yes')),

        ElevatedButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('no'))
      ],
    );
    showDialog(context: context,
        builder: (BuildContext context){
          return alertDialog;}
    );

  }
  @override
  Widget build(BuildContext context) {

    getData();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Stack(
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  Column(
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
                            width: MediaQuery.of(context).size.width-50
                            ,
                            child: TextField(
                              cursorColor: Colors.green,
                              decoration: InputDecoration(
                                focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                                focusColor: Colors.green,
                                labelStyle: TextStyle(color: Colors.green),
                                hintText: '$fullName',


                              ),
                              onChanged: (fname){
                                setState(() {
                                  newfullName = fname;
                                });
                              },
                            ),
                            //Text('${fullName}',style: TextStyle(fontSize: 18,)),
                          )
                        ],
                      ),


                      SizedBox(
                        height: 15,
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
                            width: width*0.01,
                          ),
                          Container(
                              height: height*0.025,
                              child: Row(
                                children: [
                                  // SizedBox(width:MediaQuery.of(context).size.width*0. ,),
                                  IconButton(onPressed: (){selectDate(context);
                                   newdateOfBirth =  '${date1.year} - ${date1.month} - ${date1.day}'.toString();;
                                  }, icon: Icon(Icons.date_range,size: 20,)),
                                  SizedBox(width: width*0.001 ,),
                                  Text('$dateOfBirth'),
                                ],
                              )
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
                        height: 15,
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
                            width: 10,
                          ),
                          RadioButtonGroup(
                              picked: "$gender",
                              orientation: GroupedButtonsOrientation.HORIZONTAL,
                              activeColor: Colors.green,
                              labels:<String>["Male","Female"],
                              onSelected: (String selected) {


                                setState(() {
                                  newgender = selected;
                                });}
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
                      SizedBox(height: height*0.03,),
              SizedBox(height: height*0.05, width: width*0.5,  child:  ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: (){

              },
              child: Text('Save',style: TextStyle(color: Colors.white,fontSize: 19),))),
                    ],
                  ),
                ],
              )
            ],
          ),

        ),
      ),
    );
  }
}