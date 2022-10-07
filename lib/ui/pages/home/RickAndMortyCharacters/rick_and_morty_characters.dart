import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:convert' as convert;

import '../../../../data/models/characters_response.dart';

class RickAndMortyCharactersPage extends StatefulWidget {
  const RickAndMortyCharactersPage({Key? key}) : super(key: key);

  @override
  State<RickAndMortyCharactersPage> createState() => _RickAndMortyCharactersPageState();
}

class _RickAndMortyCharactersPageState extends State<RickAndMortyCharactersPage> {


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


  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: _getCharacters(),
      builder: (BuildContext context, AsyncSnapshot<MeteoDeGulli?> snapshot){
        if(snapshot.connectionState == ConnectionState.done) {
          if(snapshot.hasData) {
            if (snapshot.data != null) {
              MeteoDeGulli meteo = snapshot.data!;
              /*return Text(meteo.currentCondition!.condition!);*/
              return Center(
                  child : Column(
                    children: [
                      Image.network(meteo.currentCondition!.iconBig!),
                      Text(meteo.currentCondition!.condition!),
                      Text(meteo.currentCondition!.tmp!.toString() + ' °C'),
                    ],
                  )
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
}
