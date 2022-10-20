import 'dart:async';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:convert' as convert;
import 'package:location/location.dart';
import 'package:snapshat_like/ui/pages/home/map/location_service.dart';
import '../../../../data/models/meteo_response.dart';
import '../profil/profil_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Location',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MapPage(),
    );
  }
}

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  Future<MeteoResponse?> _getCharacters() async {//api
    var url = Uri.parse('https://www.prevision-meteo.ch/services/json/lat=${lat}lng=${long}');
    var request = await http.get(url);
    print('La Latitude est de ${lat}');
    print('La Latitude est de ${long}');
    print('La Latitude est de ${doublat}');
    print('La Latitude est de ${doublong}');

    if(request.statusCode == 200){
      Map<String, dynamic> parsedObject = convert.jsonDecode(request.body) as Map<String, dynamic>;
      return MeteoResponse.fromJson(parsedObject);
    } else {
      return null;
    }
  }
  Completer<GoogleMapController> _controller = Completer();

  String? lat,long;
  double doublat =50.15624, doublong=3.0689255;
  late CameraPosition _kGooglePlex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async{
    final service = LocationService();
    final locationData = await service.getLocation();

    if(locationData != null){
      setState(() {
        lat = locationData.latitude!.toStringAsFixed(7);
        long = locationData.longitude!.toStringAsFixed(7);
        doublat = locationData.latitude!.toDouble();
        doublong = locationData.longitude!.toDouble();
        _kGooglePlex = CameraPosition(
          /*target: LatLng(location.latitude, location.longitude),
    zoom: 15.4746,*/
          //target: LatLng(50.15624 , 3.0689255),
          target: LatLng(doublat, doublong),
          zoom: 15.4746,
        );
        //var doublelat = double.parse(locationData.latitude!.toStringAsFixed(7));
        //var doublelong = double.parse(locationData.longitude!.toStringAsFixed(7));
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: getFooter(),
      body: getBody(),
    );
  }
  @override
  Widget getFooter() {
    return  FutureBuilder(
      future: _getCharacters(),
      builder: (BuildContext context, AsyncSnapshot<MeteoResponse?> snapshot){
        if(snapshot.connectionState == ConnectionState.done) {
          if(snapshot.hasData) {
            if (snapshot.data != null) {
              MeteoResponse meteo = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.only(left: 30, top: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 50,
                              height: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black.withOpacity(0.3)),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 50,
                                    height: 40,
                                    child: IconButton(
                                      padding: EdgeInsets.all(0),
                                      iconSize: 10,
                                      icon: Image.asset('images/user.png'),
                                      onPressed: (
                                          ) {
                                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext){
                                          return ProfilePage();
                                        }));
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black.withOpacity(0.3)),
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 23,
                              ),
                            )
                          ],
                        ),
                        Container(//Container API
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.30),
                              spreadRadius: 20,
                              blurRadius: 40,
                              // changes position of shadow
                            ),
                          ]),
                          child: Column(
                            children: [
                              Text(
                                meteo.currentCondition!.condition!,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Image.network(
                                    meteo.currentCondition!.icon!,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    meteo.currentCondition!.tmp!.toString() + ' °C',
                                    style: TextStyle(color: Colors.white, fontSize: 13),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                    ],
                  ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 10,
                              blurRadius: 40,
                            ),
                          ], shape: BoxShape.circle, color: Colors.white),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: IconButton(
                                    icon: const Icon(Icons.near_me_outlined, size: 25,),
                                    onPressed: (
                                        ) {
                                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext){
                                        return ProfilePage();
                                      }));
                                    },
                                  ),
                                ),
                              ],
                            ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return Text('data null');
            };
          }else {
            return Text('empty');
          }
        }else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget getBody() {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }



}