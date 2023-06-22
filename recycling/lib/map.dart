import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:recycling/MainMenu.dart';
import 'package:recycling/MyAccount.dart';
import 'package:recycling/MyProfile.dart';
import 'package:recycling/Settings.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:http/http.dart' as http;
import 'package:recycling/main.dart';




class maps extends StatefulWidget {
  String Email = '';
  String Password = '';
  String fullName = '';
  String mobileNumber = '';
  String gender = '';
  String dateOfBirth = '';
  var data;
  var user_points;
  var items_recycled;
  var metalCount;
  var plasticCount ;
  var location23;


  maps(
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
        required this.location23


      });


  @override
  State<maps> createState() => _mapsState(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data, metalCount: metalCount, plasticCount: plasticCount, location23: location23);

}

class _mapsState extends State<maps> {
  String Email = '';
  String Password = '';
  String fullName = '';
  String mobileNumber = '';
  String gender = '';
  String dateOfBirth = '';
  var data;
  var user_points;
  var items_recycled;
  var binData;
  List<String> omar =[];
  List _name = [];
  List _ID = [];
  List PlasticCapacity = [];
  List MetalCapacity = [];
  List Location = [];
  List lt=[];
  List lng = [];
  var metalCount;
  var plasticCount ;
  var location23;

  //[a,b,c]
  //[low,full,low]
  //[full,low,full]

  _mapsState({
    required this.Email,
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
    required this.location23



  });
  var _index = 1;
  LatLng _location = const LatLng(30.0272, 31.4917);
  late GoogleMapController mapController;
  int enter = 1;
  Future getBinData() async{
    var url =  Uri.parse(
        'https://phlegmier-marches.000webhostapp.com/getBin.php');
    var response = await http.post(url,body:{});
    var data1 = await json.decode(response.body);
    print("omar $data1");
    binData=data1;
    getInformation();
    insert();
    if(enter==1){
    loadData();
    enter ++;
    }
    return data1;
  }
  Completer<GoogleMapController> _controller = Completer();
  final List<LatLng> latLen = <LatLng>[];
  int lCounter = 0;

  List<Marker> _marker = [];
  // final List<Marker> _list = const [
  // Marker(
  // markerId: MarkerId("omar"),
  // position: const LatLng(30.0272, 31.4917),
  // infoWindow: InfoWindow(title: "Fue"),
  //
  // ),
  //
  // Marker(
  //     markerId: MarkerId("omar"),
  //     position: const LatLng(30.0766, 31.2845),
  //     infoWindow: InfoWindow(title: "Ain Shams"),
  //     ),
  // Marker(
  //     markerId: MarkerId("omar"),
  //     position: const LatLng(30.0202, 31.4991),
  //     infoWindow: InfoWindow(title: "Auc"),
  //    )
  // ];



  List<LatLng> location = [];
  List places=["x","y","z"];
  int counter = 0;
  Uint8List? marketimages;
  List<String> images = [];
  final List<Marker> _markers = <Marker>[];
  Future<Uint8List> getImages(String path, int width) async{
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return(await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();

  }


  void showAlertDialog(BuildContext context,String text){
    var alertDialog = AlertDialog(
        content: Text(text),
            actions: [
        ElevatedButton(onPressed: (){
      Navigator.pop(context);},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
    child: Text('Done')),],);
    showDialog(context: context,
    builder: (BuildContext context){return
    alertDialog;});}


  void initState() {
    // TODO: implement initState
    super.initState();
    // initialize loadData method
    getBinData();


    // _marker.addAll(_list);
  }


  // List<String> _info = const["Future University Of Egypt","Ain Shams University\nCapacity: 300","American University in Cairo\nCapacity: 200" ];


  // created method for displaying custom markers according to index
  loadData() async{
    // print("dkhlt");
    for(int i=0 ;i<_name.length; i++){
      final Uint8List markIcons = await getImages(images[i], 100);
      // makers added according to index
      // print("omaromar ${latLen[i]}");
      _markers.add(
          Marker(
            // given marker id
            markerId: MarkerId(i.toString()),
            // given marker icon
            icon: BitmapDescriptor.fromBytes(markIcons),
            // given position
            position: latLen[i],
            infoWindow: InfoWindow(

              // given title for marker
              title: _name[i].toString(),
              onTap: (){
                // print("iaomr");
                //   print(omar.length);
                  showAlertDialog(context,omar[i]);
                // _information[i];
                //     print("omar");
              }

            ),
          )
      );
      setState(() {
      });
    }
  }



  getInformation(){
    _name.clear();
    _ID.clear();
    PlasticCapacity.clear();
    MetalCapacity.clear();
    lt.clear();
    lng.clear();
    Location.clear();
    images.clear();
    latLen.clear();
    print("length ${binData.length}");
    for(int i = 0 ; i<binData.length;i++){
      print("abl $i");
      print("bindata ${binData[i]}");
      if(binData[i]["Bin_Lt"]!=""&&binData[i]["Bin_Lng"]!=""&&binData[i]["Bin_ID"]!="Not Yet"){
        print("b3d $i");

      _name.add(binData[i]["Bin_Location"]);
      _ID.add(binData[i]["Bin_ID"]);
      PlasticCapacity.add(binData[i]["Plastic_Capacity"]);
      MetalCapacity.add(binData[i]["Metal_Capacity"]);
      lt.add( double.parse(binData[i]["Bin_Lt"]));
      lng.add(double.parse(binData[i]["Bin_Lng"]));
      Location.add("${lt[lt.length-1]},${lng[lng.length-1]}");
      images.add('images/basket.png');
      latLen.add(LatLng(lt[lt.length-1], lng[lt.length-1]));

      }
      print("lt $lt");
      print("lng $lng");

      print("loc $Location");

      print("latlen $latLen");
    }
    location = latLen;
    print("location ale ana 3ayzha $location");
    print("location di ${location.length}");

    print("loaction $Location");


  }

  void insert(){
    for(int i =0 ; i<_name.length;i++){

      omar.add("${_name[i]}\nPlastic Section: ${PlasticCapacity[i]}\nMetal Section: ${MetalCapacity[i]}\n${_ID[i]}\n${Location[i]}");
      // print(omar.length);
    }


}
  // created list of coordinates of various locations
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: getBinData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            // Future hasn't finished yet, return a placeholder
           return Scaffold(
             appBar: AppBar(
               title: Text('Our Bins'),
               // leading: IconButton(onPressed: (){Navigator.pop(context);}, icon:Icon(Icons.arrow_back_ios)),
               backgroundColor: Colors.green,
               actions: [
                 Row(
                   children: [
                     IconButton(
                         onPressed: () {
                           setState(() async {


                             if(counter==0) {
                               counter = location.length - 1;
                               lCounter = location.length - 1;
                               GoogleMapController controller = await _controller.future;
                               controller.animateCamera(CameraUpdate.newCameraPosition(
                                 // on below line we have given positions of Location 5
                                   CameraPosition(
                                     target: location[counter],
                                     zoom: 14,
                                   )
                               ));
                               setState(() {
                               });


                               // _location = const LatLng(30.0766, 31.2845);
                             }
                             // else if(counter==1){
                             //   counter--;
                             //   GoogleMapController controller = await _controller.future;
                             //   controller.animateCamera(CameraUpdate.newCameraPosition(
                             //     // on below line we have given positions of Location 5
                             //       CameraPosition(
                             //         target: LatLng(30.0272, 31.4917),
                             //         zoom: 14,
                             //       )
                             //   ));
                             //   setState(() {
                             //   });
                             //   _location = const LatLng(30.0272, 31.4917);
                             // }
                             // else if(counter == 2){
                             //   counter--;
                             //   GoogleMapController controller = await _controller.future;
                             //   controller.animateCamera(CameraUpdate.newCameraPosition(
                             //     // on below line we have given positions of Location 5
                             //       CameraPosition(
                             //         target: LatLng(30.0202, 31.4991),
                             //         zoom: 14,
                             //       )
                             //   ));
                             //   setState(() {
                             //   });
                             //   _location = const LatLng(30.0202, 31.4991);
                             //
                             //
                             // }
                             else{
                               counter--;
                               lCounter--;
                               GoogleMapController controller = await _controller.future;
                               controller.animateCamera(CameraUpdate.newCameraPosition(
                                 // on below line we have given positions of Location 5
                                   CameraPosition(
                                     target: location[counter],
                                     zoom: 14,
                                   )
                               ));
                             }
                             print("counter $counter");
                           });

                         },
                         icon: Icon(
                           Icons.chevron_left,
                           size: 30,
                           color: Colors.white,
                         )),
                     // Text('${places[counter]}'),

                     IconButton(
          onPressed: () {
          setState(() async {

          if(counter==location.length-1) {
          counter = 0;
          lCounter=0;
          GoogleMapController controller = await _controller.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(
          // on below line we have given positions of Location 5
          CameraPosition(
          target: location[counter],
          zoom: 14,
          )
          ));
          setState(() {
          });


          // _location = const LatLng(30.0766, 31.2845);
          }
          // else if(counter==1){
          //   counter--;
          //   GoogleMapController controller = await _controller.future;
          //   controller.animateCamera(CameraUpdate.newCameraPosition(
          //     // on below line we have given positions of Location 5
          //       CameraPosition(
          //         target: LatLng(30.0272, 31.4917),
          //         zoom: 14,
          //       )
          //   ));
          //   setState(() {
          //   });
          //   _location = const LatLng(30.0272, 31.4917);
          // }
          // else if(counter == 2){
          //   counter--;
          //   GoogleMapController controller = await _controller.future;
          //   controller.animateCamera(CameraUpdate.newCameraPosition(
          //     // on below line we have given positions of Location 5
          //       CameraPosition(
          //         target: LatLng(30.0202, 31.4991),
          //         zoom: 14,
          //       )
          //   ));
          //   setState(() {
          //   });
          //   _location = const LatLng(30.0202, 31.4991);
          //
          //
          // }
          else{
            counter++;
            lCounter++;
          GoogleMapController controller = await _controller.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(
          // on below line we have given positions of Location 5
          CameraPosition(
          target: location[counter],
          zoom: 14,
          )
          ));
          }
          });
          print("counter $counter");

          },
                         icon: Icon(
                           Icons.chevron_right,
                           size: 30,
                           color: Colors.white,
                         )),
                   ],
                 )
               ],
             ),
            body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child:Center(
                   child: CircularProgressIndicator(
                  strokeWidth: 4,
                  color: Colors.green,
                ),
                ),

               
           )
           ,
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
                         icon: Icons.home,
                         text: 'Home',
                       ),
                       GButton(
                         icon: Icons.location_on_outlined,
                         text: 'Map',
                       ),
                       GButton(
                         icon: Icons.more_horiz,
                         text: 'More',
                       ),

                     ],
                     selectedIndex: _index,
                     onTabChange: (index) {
                       setState(() {
                         _index = index;
                         if (_index == 0)
                           Navigator.push(
                               context,
                               MaterialPageRoute(
                                   builder: (context) => homePage(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data, location: location23)));
                         if (_index == 1)
                           Navigator.push(
                               context,
                               MaterialPageRoute(
                                   builder: (context) => maps(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data, metalCount: metalCount, plasticCount: plasticCount, location23: location23)));
                         if (_index == 2)
                           Navigator.push(
                               context, MaterialPageRoute(builder: (context) => MyProfile(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data, metalCount: metalCount, plasticCount: plasticCount, location: location23)));
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
             ),
           );
          }
          for(int i =0 ; i<_name.length;i++){
            omar.add("${_name[i]}\nPlastic Section: ${PlasticCapacity[i]}\nMetal Section: ${MetalCapacity[i]}\n${_ID[i]}\n${Location[i]}");
            // print(omar.length);
          }
          return Scaffold(
            appBar: AppBar(
              title: Text('Our Bins'),
              // leading: IconButton(onPressed: (){Navigator.pop(context);}, icon:Icon(Icons.arrow_back_ios)),
              backgroundColor: Colors.green,
              actions: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() async {


                            if(counter==0) {
                              counter = location.length - 1;
                              lCounter = location.length - 1;
                              GoogleMapController controller = await _controller.future;
                              controller.animateCamera(CameraUpdate.newCameraPosition(
                                // on below line we have given positions of Location 5
                                  CameraPosition(
                                    target: location[counter],
                                    zoom: 14,
                                  )
                              ));
                              setState(() {
                              });


                              // _location = const LatLng(30.0766, 31.2845);
                            }
                            // else if(counter==1){
                            //   counter--;
                            //   GoogleMapController controller = await _controller.future;
                            //   controller.animateCamera(CameraUpdate.newCameraPosition(
                            //     // on below line we have given positions of Location 5
                            //       CameraPosition(
                            //         target: LatLng(30.0272, 31.4917),
                            //         zoom: 14,
                            //       )
                            //   ));
                            //   setState(() {
                            //   });
                            //   _location = const LatLng(30.0272, 31.4917);
                            // }
                            // else if(counter == 2){
                            //   counter--;
                            //   GoogleMapController controller = await _controller.future;
                            //   controller.animateCamera(CameraUpdate.newCameraPosition(
                            //     // on below line we have given positions of Location 5
                            //       CameraPosition(
                            //         target: LatLng(30.0202, 31.4991),
                            //         zoom: 14,
                            //       )
                            //   ));
                            //   setState(() {
                            //   });
                            //   _location = const LatLng(30.0202, 31.4991);
                            //
                            //
                            // }
                            else{
                              counter--;
                              lCounter--;
                              GoogleMapController controller = await _controller.future;
                              controller.animateCamera(CameraUpdate.newCameraPosition(
                                // on below line we have given positions of Location 5
                                  CameraPosition(
                                    target: location[counter],
                                    zoom: 14,
                                  )
                              ));
                            }
                            print("counter $counter");
                          });

                        },
                        icon: Icon(
                          Icons.chevron_left,
                          size: 30,
                          color: Colors.white,
                        )),
                    // Text('${places[counter]}'),

                    IconButton(
                        onPressed: () {
                          setState(() async {

                            if(counter==location.length-1) {
                              counter = 0;
                              lCounter=0;
                              GoogleMapController controller = await _controller.future;
                              controller.animateCamera(CameraUpdate.newCameraPosition(
                                // on below line we have given positions of Location 5
                                  CameraPosition(
                                    target: location[counter],
                                    zoom: 14,
                                  )
                              ));
                              setState(() {
                              });


                              // _location = const LatLng(30.0766, 31.2845);
                            }
                            // else if(counter==1){
                            //   counter--;
                            //   GoogleMapController controller = await _controller.future;
                            //   controller.animateCamera(CameraUpdate.newCameraPosition(
                            //     // on below line we have given positions of Location 5
                            //       CameraPosition(
                            //         target: LatLng(30.0272, 31.4917),
                            //         zoom: 14,
                            //       )
                            //   ));
                            //   setState(() {
                            //   });
                            //   _location = const LatLng(30.0272, 31.4917);
                            // }
                            // else if(counter == 2){
                            //   counter--;
                            //   GoogleMapController controller = await _controller.future;
                            //   controller.animateCamera(CameraUpdate.newCameraPosition(
                            //     // on below line we have given positions of Location 5
                            //       CameraPosition(
                            //         target: LatLng(30.0202, 31.4991),
                            //         zoom: 14,
                            //       )
                            //   ));
                            //   setState(() {
                            //   });
                            //   _location = const LatLng(30.0202, 31.4991);
                            //
                            //
                            // }
                            else{
                              counter++;
                              lCounter++;
                              GoogleMapController controller = await _controller.future;
                              controller.animateCamera(CameraUpdate.newCameraPosition(
                                // on below line we have given positions of Location 5
                                  CameraPosition(
                                    target: location[counter],
                                    zoom: 14,
                                  )
                              ));
                            }
                          });
                          print("counter $counter");

                        },
                        icon: Icon(
                          Icons.chevron_right,
                          size: 30,
                          color: Colors.white,
                        )),
                  ],
                )
              ],
            ),
            body: Container(
              child: SafeArea(
                child: GoogleMap(
                  // given camera position
                  initialCameraPosition: CameraPosition(
                      target: location[lCounter] ,bearing: 45.0,tilt: 10 , zoom: 16.5),
                  // set markers on google map
                  markers: Set<Marker>.of(_markers),
                  // on below line we have given map type
                  mapType: MapType.hybrid,
                  // on below line we have enabled location
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  // on below line we have enabled compass
                  compassEnabled: true,
                  // below line displays google map in our app
                  onMapCreated: (GoogleMapController controller){
                    _controller.complete(controller);
                  },
                ),

              ),
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
                        icon: Icons.home,
                        text: 'Home',
                      ),
                      GButton(
                        icon: Icons.location_on_outlined,
                        text: 'Map',
                      ),
                      GButton(
                        icon: Icons.more_horiz,
                        text: 'More',
                      ),

                    ],
                    selectedIndex: _index,
                    onTabChange: (index) {
                      setState(() {
                        _index = index;
                        if (_index == 0)
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => homePage(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data, location: location23)));
                        if (_index == 1)
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => maps(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data, metalCount: metalCount, plasticCount: plasticCount, location23: location23)));
                        if (_index == 2)
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => MyProfile(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, user_points: user_points, items_recycled: items_recycled, data: data, metalCount: metalCount, plasticCount: plasticCount, location: location23)));
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
            ),
          );
        }
    );
  }}
