import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:screen_loader/screen_loader.dart';

void main() {
  configScreenLoader(
    loader: AlertDialog(
      title: Text('Gobal Loader..'),
    ),
    bgBlur: 20.0,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Screen Loader',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Screen(),
    );
  }
}

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

/// A Stateful screen
class _ScreenState extends State<Screen> with ScreenLoader {
  @override
  loader() {
    return AlertDialog(
      title: Text('Wait.. Loading data..'),
    );
  }

  @override
  loadingBgBlur() => 10.0;

  Widget _buildBody() {
    return Center(
      child: Icon(
        Icons.home,
        size: MediaQuery.of(context).size.width,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _index;
    return Scaffold(
      body:
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height ,
            child:

            Column(
              children: [
                Container(
                  // color:Colors.white,
                  // height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.015),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Colors.red,
                      /*gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [
                        0.3,

                        // 0.6,
                        0.7,
                      ],
                      colors: [color2, color1],
                    )*/),
                    child: Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                        Row(
                          children: [
                            SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                            Text(
                              "{_ID[i]}",
                              style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                            )
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                        Row(
                          children: [
                            SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                            Icon(Icons.map_sharp),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                            Text(
                              "{Bin[i]}, Cairo, Egypt",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                        Row(
                          children: [
                            SizedBox(width: MediaQuery.of(context).size.width * 0.06),
                            Container(
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        child: CircleAvatar(
                                          backgroundImage:
                                          AssetImage("images/avatar.jpg"),
                                          radius: 35,
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(children: [
                                        SizedBox(
                                            width: MediaQuery.of(context).size.width *
                                                0.03),
                                        Text(
                                          "Driver",
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.black45),
                                        ),
                                      ]),
                                      SizedBox(
                                          height: MediaQuery.of(context).size.height *
                                              0.009),
                                      Row(
                                        children: [
                                          SizedBox(
                                              width: MediaQuery.of(context).size.width *
                                                  0.04),
                                          Text(
                                            "{_driverName[i]}",
                                            style: TextStyle(fontSize: 18),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.2),
                                  Column(
                                    children: [Icon(Icons.fire_truck_sharp)],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(children: [
                          SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                          Text(
                            "Bins",
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          )
                        ]),
                        Row(
                          children: [
                            SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                            Icon(Icons.restore_from_trash),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                            Column(
                              children: [
                                // for(int y = 0 ; y <binUsedList[i].length;y++)
                                //   Text(
                                //     "{binUsedList[i][y]}",
                                //     style: TextStyle(fontSize: 16),
                                //   )
                              ],
                              //[[1],[2,3]]
                            )

                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                      ],
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),Container(
                  // color:Colors.white,
                  // height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.015),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Colors.red,
                      /*gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [
                        0.3,

                        // 0.6,
                        0.7,
                      ],
                      colors: [color2, color1],
                    )*/),
                    child: Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                        Row(
                          children: [
                            SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                            Text(
                              "{_ID[i]}",
                              style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                            )
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                        Row(
                          children: [
                            SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                            Icon(Icons.map_sharp),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                            Text(
                              "{Bin[i]}, Cairo, Egypt",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                        Row(
                          children: [
                            SizedBox(width: MediaQuery.of(context).size.width * 0.06),
                            Container(
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        child: CircleAvatar(
                                          backgroundImage:
                                          AssetImage("images/avatar.jpg"),
                                          radius: 35,
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(children: [
                                        SizedBox(
                                            width: MediaQuery.of(context).size.width *
                                                0.03),
                                        Text(
                                          "Driver",
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.black45),
                                        ),
                                      ]),
                                      SizedBox(
                                          height: MediaQuery.of(context).size.height *
                                              0.009),
                                      Row(
                                        children: [
                                          SizedBox(
                                              width: MediaQuery.of(context).size.width *
                                                  0.04),
                                          Text(
                                            "{_driverName[i]}",
                                            style: TextStyle(fontSize: 18),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.2),
                                  Column(
                                    children: [Icon(Icons.fire_truck_sharp)],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(children: [
                          SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                          Text(
                            "Bins",
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          )
                        ]),
                        Row(
                          children: [
                            SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                            Icon(Icons.restore_from_trash),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                            Column(
                              children: [
                                // for(int y = 0 ; y <binUsedList[i].length;y++)
                                //   Text(
                                //     "{binUsedList[i][y]}",
                                //     style: TextStyle(fontSize: 16),
                                //   )
                              ],
                              //[[1],[2,3]]
                            )

                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        )
                      ],
                    )),
              ],
            )
          ),

        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: Colors.black,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100]!,
                color: Colors.black,
                tabs: [
                  GButton(
                    icon: Icons.person,
                    text: 'Bin',
                  ),
                  GButton(
                    icon: Icons.computer,
                    text: 'Truck',
                  ),
                  GButton(
                    icon: Icons.person,
                    text: 'user',
                  ),

                ],
                selectedIndex: _index,
                onTabChange: (index) {
                  setState(() {
                    _index = index;
                    if (_index == 0) {

    }

                if (_index == 1) {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => AdminBin1()));
                }
                // if (_index == 2)
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (context) =>
                    //     MyProfile(Email: Email,
                    //         Password: Password,
                    //         fullName: fullName,
                    //         mobileNumber: mobileNumber,
                    //         gender: gender,
                    //         dateOfBirth: dateOfBirth,
                    //         user_points: user_points,
                    //         items_recycled: items_recycled,
                    //         data: data)));
                  });
                  // if (_index == 3)                    });
                },
              ),
            ),
          ),
        )
      
    );
  }
}

/// A Stateless screen
class BasicScreen extends StatelessWidget with ScreenLoader {
  BasicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return loadableWidget(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Basic ScreenLoader Example'),
        ),
        body: Center(
          child: Icon(
            Icons.home,
            size: MediaQuery.of(context).size.width,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await this.performFuture(NetworkService.getData);
          },
          child: Icon(Icons.refresh),
        ),
      ),
    );
  }
}

class NetworkService {
  static Future getData() async {
    return await Future.delayed(Duration(seconds: 2));
  }
}