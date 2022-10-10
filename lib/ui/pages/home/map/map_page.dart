import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:convert' as convert;
import 'package:location/location.dart';

import '../../../../data/models/characters_response.dart';
import 'package:snapshat_like/ui/pages/theme/colors.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Future<MeteoDeGulli?> _getCharacters() async {
    var url = Uri.parse('https://www.prevision-meteo.ch/services/json/lat=50.6lng=3.06');

    var request = await http.get(url);
    if(request.statusCode == 200){
      Map<String, dynamic> parsedObject = convert.jsonDecode(request.body) as Map<String, dynamic>;
      return MeteoDeGulli.fromJson(parsedObject);
    } else {
      return null;
    }
  }
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(50.6282606, 3.0689255),
    zoom: 15.4746,
  );

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
      builder: (BuildContext context, AsyncSnapshot<MeteoDeGulli?> snapshot){
        if(snapshot.connectionState == ConnectionState.done) {
          if(snapshot.hasData) {
            if (snapshot.data != null) {
              MeteoDeGulli meteo = snapshot.data!;
              /*return Text(meteo.currentCondition!.condition!);*/
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
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black.withOpacity(0.3)),
                              child: Icon(
                                Icons.account_circle,
                                color: Colors.yellow,
                                size: 23,
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
      myLocationButtonEnabled: false,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}