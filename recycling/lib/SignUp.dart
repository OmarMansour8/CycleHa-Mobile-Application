import 'dart:convert';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:recycling/MainMenu.dart';
import 'package:recycling/SignIn.dart';
import 'package:http/http.dart' as http;
import 'sSignInPage.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({Key? key}) : super(key: key);
  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
  var Email;
  var Password;
  var fullName;
  var mobileNumber;
  var gender;
  var dateOfBirth;
  String totalAmount = '';
  var user_points;
  var items_recycled;
  var data;
  bool buttonEnabled = false;

  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController mobile = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  bool visible = false;

//    Future getUserData(String mobile) async{
//    var url =  Uri.parse(
//        'https://phlegmier-marches.000webhostapp.com/getUserData.php');
//    var response = await http.post(url,body:{
//      "mobile": mobile,
//    }
//    );
//
//     // print(json.decode(response.body));
//      var data1 = await json.decode(response.body);
//
//    getData(mobile, data1);
//      print("data $data");
//      return data1[0][name];
//      // return json.decode(response.body);
// }
  Future getUserData(String mobile) async {
    var url = Uri.parse(
        'https://phlegmier-marches.000webhostapp.com/getUserData.php');

    var response = await http.post(url, body: {
      "mobile": mobile,
    });

    // print(json.decode(response.body));
    var data1 = await json.decode(response.body);
    getData(mobile, data1);
    print(data1);
    data = data1;

    print("mamaos ${data1.runtimeType}");
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => homePage(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data, location: location)), // MaterialPageRoute
    );
    return data1;

  }

  Future SendData() async {
    var url =
        Uri.parse('https://phlegmier-marches.000webhostapp.com/register.php');
    var data1 = {
      "name": name.text,
      "email": email.text,
      "mobile": mobile.text,
      "password": pass.text,
      "dot": dateOfBirth,
      "location": location.toString(),
      "admin_username": "om",
      "user_points": "0"
    };
    final response = await http.post(Uri.parse('https://phlegmier-marches.000webhostapp.com/register.php'), body: {
      "name": name.text,
      "email": email.text,
      "mobile": mobile.text,
      "password": pass.text,
      "dot": dateOfBirth,
      "location": location.toString(),
      "admin_username": "01550083829",
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
            fontSize: 16.9);
      } else if (data == "Success") {
        getUserData(mobile.text);
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
        Navigator.pop(context);
        Fluttertoast.showToast(
            msg: "This Mobile Number Already Exist!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.9);
      } else {
        print("error");
      }
    } catch (e) {
      print(e);
    }
  }
  String? location;


  // final FirebaseAuth _auth = FirebaseAuth.instance;
  List<Widget> cart = [];
  //
  DateTime date1 = DateTime.now();
  Future<Null> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date1,
      firstDate: DateTime(1960),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != date1) {
      setState(() {
        date1 = picked;
        print(date1.toString());
        // dateOfBirth=picked ;
      });
    }
  }

  var truckId = [
    '6th of October City',
    'Abbasiya',
    'Ain Shams',
    'Al Rehab City',
    'Ard El Lewa',
    'Bab El Louk',
    'Badr City',
    'Boulak',
    'Cairo',
    'Dokki',
    'Down Town Cairo',
    'El Ahram',
    'El Basatin',
    'El Gamaleya',
    'El Maadi',
    'El Mokattam',
    'El Nozha',
    'El Sahel',
    'El Sayeda Zeinab',
    'El Shorouk City',
    'El Tagamu El Khames',
    'El Warraq',
    'El Zaytoun',
    'Faisal',
    'Garden City',
    'Giza',
    'Haram',
    'Heliopolis',
    'Helmeya',
    'Imbaba',
    'Khalifa City',
    'Maadi',
    'Madinty',
    'Manial',
    'Masr El Gedida',
    'Matare',
    'Mohandessin',
    'Mokattam',
    'Nasr City',
    'New Cairo',
    'Obour City',
    'Old Cairo',
    'QasrEl Nil',
    'Ramses',
    'Rehab',
    'Rod El Farag',
    'Rod El Farag Axis',
    'Saf',
    'Shoubra',
    'Shoubra El Kheima',
    'Smart Village',
    'Tagamo El Awal',
    'Tahrir Square',
    'Zamalek',
    // added Madinty to the list
  ];

  String? _selectedLocation;

  enableButton() {
    buttonEnabled = true;
  }

  disableButton() {
    buttonEnabled = false;
  }

  bool loading = false;
  final phoneNumberController = TextEditingController();

  getData(String mobile, var data) {
    Email = data[0]["User_Email"];
    fullName = data[0]["User_Name"];
    mobileNumber = data[0]["User_MobileNumber"];
    dateOfBirth = data[0]["USer_DateofBirth"];
    Password = data[0]["User_Password"];
    location = data[0]["User_Location"];
  }
  // Future<void> getData(String mobile) async {
  //   Email = await getUserData("User_Email",mobile);
  //   fullName = await getUserData("User_Name",mobile);
  //   mobileNumber = await getUserData("User_MobileNumber",mobile);
  //   dateOfBirth = await getUserData("User_DateofBirth",mobile);
  //   Password = await getUserData("User_Password",mobile);
  //   user_points = await getUserData("User_Points",mobile);
  //
  //   print(Email);
  //   print(fullName);
  //   print(mobileNumber);
  //   print(dateOfBirth);
  //   print(Password);
  //   print(user_points);
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //         builder: (context) =>
  //             homePage(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data)
  //     ), // MaterialPageRoute
  //   );
  //
  //
  //
  // }

  void showAlertDialog(BuildContext context) {
    var alertDialog = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        decoration: BoxDecoration(),
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          strokeWidth: 4,
          color: Colors.green,
        ),
      ),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
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

    dateOfBirth = '${date1.year} - ${date1.month} - ${date1.day}'.toString();
    // Size size = MediaQuery.of(context).size;
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
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 38,
                          ),
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Container(
                      // height: MediaQuery.of(context).size.height*0.8,
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.04,
                          0,
                          MediaQuery.of(context).size.width * 0.04,
                          0),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(246, 248, 252, 5),
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
                        // controller: fullName,
                        controller: name,
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green)),
                            focusColor: Colors.green,
                            labelStyle: TextStyle(color: Colors.green),
                            hintText: 'Full Name',
                            prefixIcon: Icon(
                              Icons.account_circle_rounded,
                              color: Colors.green,
                            )),
                        onChanged: (String value) {
                          setState(() {
                            fullName = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                      // height: MediaQuery.of(context).size.height*0.8,
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.04,
                          0,
                          MediaQuery.of(context).size.width * 0.04,
                          0),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(246, 248, 252, 5),
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
                        controller: email,
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green)),
                            focusColor: Colors.green,
                            labelStyle: TextStyle(color: Colors.green),
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.alternate_email_outlined,
                                color: Colors.green)),
                        onChanged: (String value) {
                          setState(() {
                            Email = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                      // height: MediaQuery.of(context).size.height*0.8,
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.04,
                          0,
                          MediaQuery.of(context).size.width * 0.04,
                          0),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(246, 248, 252, 5),
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
                        controller: mobile,
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green)),
                            focusColor: Colors.green,
                            labelStyle: TextStyle(color: Colors.green),
                            hintText: 'Mobile Number',
                            prefixIcon: Icon(Icons.phone, color: Colors.green)),
                        onChanged: (String value) {
                          setState(() {
                            mobileNumber = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                      // height: MediaQuery.of(context).size.height*0.8,
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.04,
                          0,
                          MediaQuery.of(context).size.width * 0.04,
                          0),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(246, 248, 252, 5),
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
                        controller: pass,
                        obscureText: true,
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green)),
                            focusColor: Colors.green,
                            labelStyle: TextStyle(color: Colors.green),
                            hintText: 'New Password',
                            prefixIcon:
                                Icon(Icons.password, color: Colors.green)),
                        onChanged: (String value) {
                          setState(() {
                            Password = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                      // height: MediaQuery.of(context).size.height*0.8,
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.04,
                          0,
                          MediaQuery.of(context).size.width * 0.04,
                          0),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(246, 248, 252, 5),
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
                      child: Row(
                        children: [
                          Text('  Date of Birth:  ',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                          IconButton(
                              onPressed: () {
                                selectDate(context);
                              },
                              icon: Icon(
                                Icons.date_range,
                                color: Colors.green,
                              )),
                          Text(
                            ('${date1.year} - ${date1.month} - ${date1.day}')
                                .toString(),
                            style: TextStyle(color: Colors.black87),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Container(
                      // height: MediaQuery.of(context).size.height*0.8,
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.04,
                          0,
                          MediaQuery.of(context).size.width * 0.04,
                          0),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(246, 248, 252, 5),
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
                      child: Row(
                        children: [
                          Text('  Location :  ',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                          DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              isExpanded: true,
                              hint: Row(
                                children: const [
                                  Center(
                                    child: Text(
                                      'Choose Your Location',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              items: truckId
                                  .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    // fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                                  .toList(),
                              value: location,
                              onChanged: (value) {
                                setState(() {
                                  location = value as String;
                                  // truck = TruckIDValue.toString();

                                });
                              },
                              buttonStyleData: ButtonStyleData(
                                height:
                                MediaQuery.of(context).size.height * 0.07,
                                width: MediaQuery.of(context).size.width * 0.53,
                                padding:
                                const EdgeInsets.only(left: 14, right: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  // border: Border.all(
                                  //   color: Colors.black26,
                                  // ),
                                  color: Colors.white,
                                ),
                                elevation: 0,
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                ),
                                iconSize: 25,
                                iconEnabledColor: Colors.black,
                                iconDisabledColor: Colors.grey,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                maxHeight:
                                MediaQuery.of(context).size.height * 0.2,
                                width: MediaQuery.of(context).size.width * 0.47,
                                padding: null,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Colors.white,
                                ),
                                elevation: 8,
                                offset: const Offset(0, 0),
                                scrollbarTheme: ScrollbarThemeData(
                                  radius: const Radius.circular(40),
                                  thickness:
                                  MaterialStateProperty.all<double>(6),
                                  thumbVisibility:
                                  MaterialStateProperty.all<bool>(true),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                                padding: EdgeInsets.only(left: 14, right: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Select your Gender:",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        RadioButtonGroup(
                            activeColor: Colors.green,
                            labels: <String>["Male", "Female"],
                            onSelected: (String selected) {
                              setState(() {
                                gender = selected;
                              });
                            })
                      ],
                    ),
                    Text(
                      (() {
                        if (fullName != '' &&
                            Email != '' &&
                            mobileNumber != '' &&
                            Password != '' &&
                            gender != '') {
                          enableButton();
                          return "";
                        } else {
                          disableButton();
                          return "Please fill all fields , make sure your mobile number is 11 digits";
                        }
                      })(),
                      style: TextStyle(color: Colors.redAccent),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 12),
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(29),
                          child: SizedBox(
                              height: 60,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green),
                                  onPressed: () {
                                    if (name.text == "" ||
                                        email.text == "" ||
                                        mobile.text == "" ||
                                        pass.text == "") {
                                      Fluttertoast.showToast(
                                          msg: "Please Fill All the Fields",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.9);
                                    } else {
                                      showAlertDialog(context);

                                      SendData();
                                    }

                                    // userRegistration();
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 19),
                                  ))),
                        )),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Sign_In1()));
                      },
                      child: const Text('Already have an account?',
                          style: TextStyle(color: Colors.green, fontSize: 16)),
                    ),
                  ],
                ))));
  }
}
