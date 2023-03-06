import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recycling/MainMenu.dart';
import 'package:recycling/MyAccount.dart';
import 'package:recycling/MyProfile.dart';
import 'package:recycling/Settings.dart';
import 'package:custom_info_window/custom_info_window.dart';




class maps extends StatefulWidget {
  String Email = '';
  String Password = '';
  String fullName = '';
  String mobileNumber = '';
  String gender = '';
  String dateOfBirth = '';
  List<Widget> cart = [];
  double totalAmount = 0;
  List<String> orders=[];
  maps(
      {required this.Email,
        required this.Password,
        required this.fullName,
        required this.mobileNumber,
        required this.gender,
        required this.dateOfBirth,
        required this.cart,
        required this.totalAmount,required this.orders});


  @override
  State<maps> createState() => _mapsState(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, cart: cart, totalAmount: totalAmount, orders: orders);

}

class _mapsState extends State<maps> {
  String Email = '';
  String Password = '';
  String fullName = '';
  String mobileNumber = '';
  String gender = '';
  String dateOfBirth = '';
  List<Widget> cart = [];
  double totalAmount = 0;
  List<String> orders=[];


  _mapsState({required this.Email,
    required this.Password,
    required this.fullName,
    required this.mobileNumber,
    required this.gender,
    required this.dateOfBirth,
    required this.cart,
    required this.totalAmount
    ,required this.orders});
  var _index = 1;
  LatLng _location = const LatLng(30.0272, 31.4917);
  late GoogleMapController mapController;
  void _myMaCreated (GoogleMapController controller){
    mapController = controller;
  }
  Completer<GoogleMapController> _controller = Completer();  final List<LatLng> _latLen = <LatLng>[

    LatLng(30.0272, 31.4917),
    LatLng(30.0766, 31.2845),
    LatLng(30.0202, 31.4991),
  ];
  int lCounter = 0;

  List<Marker> _marker = [];
  final List<Marker> _list = const [
  Marker(
  markerId: MarkerId("omar"),
  position: const LatLng(30.0272, 31.4917),
  infoWindow: InfoWindow(title: "Fue"),

  ),

  Marker(
      markerId: MarkerId("omar"),
      position: const LatLng(30.0766, 31.2845),
      infoWindow: InfoWindow(title: "Ain Shams"),
      ),
  Marker(
      markerId: MarkerId("omar"),
      position: const LatLng(30.0202, 31.4991),
      infoWindow: InfoWindow(title: "Auc"),
     )
  ];



  List<LatLng> location = [const LatLng(30.0272, 31.4917),const LatLng(30.0202, 31.4991), const LatLng(30.0766, 31.2845),];
  List places=["x","y","z"];
  int counter = 0;
  Uint8List? marketimages;
  List<String> images = [
    'images/basket.png',
    'images/basket.png',
    'images/basket.png',
  ];
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
    child: Text('Done')),],);
    showDialog(context: context,
    builder: (BuildContext context){return
    alertDialog;});}


  void initState() {
    // TODO: implement initState
    super.initState();
    // initialize loadData method
    loadData();
    _marker.addAll(_list);
  }
  List<String> _info = const["Future University Of Egypt\nCapacity: 100","Ain Shams University\nCapacity: 300","American University in Cairo\nCapacity: 200" ];
  List<Widget> _information = [
    SnackBar(
      content: const Text('Future University Of Egypt\nCapacity: 100"'),
      duration: Duration(seconds: 3),
    )
    ,
    SnackBar(
      content: const Text('"American University in Cairo\nCapacity: 200"'),
      duration: Duration(seconds: 3),
    )
    ,
    SnackBar(
      content: const Text('Ain Shams University\nCapacity: 300'),
      duration: Duration(seconds: 3),
    )

  ];
  // created method for displaying custom markers according to index
  loadData() async{
    for(int i=0 ;i<images.length; i++){
      final Uint8List markIcons = await getImages(images[i], 100);
      // makers added according to index
      _markers.add(
          Marker(
            // given marker id
            markerId: MarkerId(i.toString()),
            // given marker icon
            icon: BitmapDescriptor.fromBytes(markIcons),
            // given position
            position: _latLen[i],
            infoWindow: InfoWindow(

              // given title for marker
              title: _info[i].toString(),
              onTap: (){

                  showAlertDialog(context,_info[i]);
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
  // created list of coordinates of various locations
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Scaffold(
        appBar: AppBar(
          title: Text('Our Branch'),
          // leading: IconButton(onPressed: (){Navigator.pop(context);}, icon:Icon(Icons.arrow_back_ios)),
          backgroundColor: Colors.green,
          actions: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      setState(() async {

                        if(counter==0) {
                          counter = places.length - 1;
                          GoogleMapController controller = await _controller.future;
                          controller.animateCamera(CameraUpdate.newCameraPosition(
                            // on below line we have given positions of Location 5
                              CameraPosition(
                                target: LatLng(30.0766, 31.2845),
                                zoom: 14,
                              )
                          ));
                          setState(() {
                          });


                          _location = const LatLng(30.0766, 31.2845);
                        }
                        else if(counter==1){
                          counter--;
                          GoogleMapController controller = await _controller.future;
                          controller.animateCamera(CameraUpdate.newCameraPosition(
                            // on below line we have given positions of Location 5
                              CameraPosition(
                                target: LatLng(30.0272, 31.4917),
                                zoom: 14,
                              )
                          ));
                          setState(() {
                          });
                          _location = const LatLng(30.0272, 31.4917);
                        }
                        else if(counter == 2){
                          counter--;
                          GoogleMapController controller = await _controller.future;
                          controller.animateCamera(CameraUpdate.newCameraPosition(
                            // on below line we have given positions of Location 5
                              CameraPosition(
                                target: LatLng(30.0202, 31.4991),
                                zoom: 14,
                              )
                          ));
                          setState(() {
                          });
                          _location = const LatLng(30.0202, 31.4991);


                        }
                      });

                    },
                    icon: Icon(
                      Icons.chevron_left,
                      size: 30,
                      color: Colors.white,
                    )),
                Text('${places[counter]}'),

                IconButton(
                    onPressed: () {
                      setState(() async{

                        if(counter==0) {
                          counter++;
                          GoogleMapController controller = await _controller.future;
                          controller.animateCamera(CameraUpdate.newCameraPosition(
                            // on below line we have given positions of Location 5
                              CameraPosition(
                                target: LatLng(30.0202, 31.4991),
                                zoom: 14,
                              )
                          ));
                          setState(() {
                          });
                          _location = const LatLng(30.0202, 31.4991);
                          print(_location);
                        }

                        else if(counter == 1){
                          counter++;
                          GoogleMapController controller = await _controller.future;
                          controller.animateCamera(CameraUpdate.newCameraPosition(
                            // on below line we have given positions of Location 5
                              CameraPosition(
                                target: LatLng(30.0766, 31.2845),
                                zoom: 14,
                              )
                          ));
                          setState(() {
                          });
                          _location = const LatLng(30.0766, 31.2845);
                          print(_location);



                        }

                        else if(counter==2){
                          counter =0;
                          GoogleMapController controller = await _controller.future;
                          controller.animateCamera(CameraUpdate.newCameraPosition(
                            // on below line we have given positions of Location 5
                              CameraPosition(
                                target: LatLng(30.0272, 31.4917),
                                zoom: 14,
                              )
                          ));
                          setState(() {
                          });
                          _location = const LatLng(30.0272, 31.4917);
                          print(_location);

                        }

                      });

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

        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home),
              ),
              /*  BottomNavigationBarItem(
                label: "Offers",
                icon: Icon(Icons.local_offer),
              ),*/
              BottomNavigationBarItem(
                label: "Map",
                icon: Icon(Icons.location_on),
              ),
              BottomNavigationBarItem(
                label: "More",
                icon: Icon(Icons.more_horiz),
              ),
            ],
            currentIndex: _index,
            unselectedItemColor: Colors.black54,
            selectedItemColor: Colors.green,
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            selectedLabelStyle:
            TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            backgroundColor: Colors.white,
            onTap: (index) {
              setState(() {
                _index = index;
                if (_index == 0)
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => homePage(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, cart: cart, totalAmount: totalAmount, orders: orders)));
                if (_index == 1)
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => maps(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, cart: cart, totalAmount: totalAmount, orders: orders)));
                if (_index == 2)
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => MyProfile(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, cart: cart, totalAmount: totalAmount, orders: orders)));

                // if (_index == 3)
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => AddToCart(Email: Email, Password: Password, fullName: fullName, mobileNumber: mobileNumber, gender: gender, dateOfBirth: dateOfBirth, cart: cart, totalAmount: totalAmount, orders: orders)));
              });
            }),
    )


    );
  }

}

