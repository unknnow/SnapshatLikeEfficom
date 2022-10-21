import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:snapshat_like/ui/pages/home/contact/contacte_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../contact/recherche_page.dart';
import '../home_page.dart';

void main() => runApp(ProfilePage());
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(

      body:
      Center(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              color: Color(0xFFa05dce),
              child:

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    //children:
                    //const <Widget>[
                    children: <Widget>[
                      /*IconButton(
                        padding: EdgeInsets.all(0.0),
                        iconSize: 10,
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: (
                            ) {
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext){
                            return MyHomePage(title: 'profil',); //to do MyHomePage
                          }));
                        },
                      ),*/
                      SizedBox(
                        width: 35,
                      ),
                      Text('Profil',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: IconButton(
                          padding: EdgeInsets.all(0.0),
                          icon: const Icon(Icons.chevron_right, color: Colors.white, size: 31),
                          onPressed: (
                              ) {
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext){
                              return MyHomePage(title: 'profil',);
                            }));
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Color(0xFFa05dce),
              child: Container(

                padding: EdgeInsets.only(top: 40.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(14),
                        topRight: Radius.circular(14)
                    )
                ),
                child: CircleAvatar(
                  backgroundImage: NetworkImage('https://w7.pngwing.com/pngs/140/571/png-transparent-snapchat-youtube-android-the-hobbit-snapchat-face-head-cartoon.png'),
                  maxRadius: 50,
                  backgroundColor: Color.fromARGB(100, 22, 44, 33),

                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(bottom: 80.0),
                child: Center(child: Text("utilisateur1", style: TextStyle(fontSize: 30)))
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 35),
              height: 60,
              width: 20,
              color: Colors.transparent,
              child: Container(
                  decoration:  BoxDecoration(
                      image: DecorationImage
                        (image: NetworkImage('https://cdn-icons-png.flaticon.com/512/685/685655.png'),
                          alignment: Alignment.centerLeft
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                          offset: Offset(
                            5.0,
                            5.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: new Center(
                    child: new Text("Change ton emoji (non dev)",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                      textAlign: TextAlign.center,),
                  )),

            ),


            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 35),
              height: 60,
              width: 20,
              color: Colors.transparent,
              child: InkWell(
              child: Container(
                  decoration:  BoxDecoration(
                      image: DecorationImage
                        (image: NetworkImage('https://png.pngitem.com/pimgs/s/146-1468281_profile-icon-png-transparent-profile-picture-icon-png.png'),
                          alignment: Alignment.centerLeft
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                          offset: Offset(
                            5.0,
                            5.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: new Center(
                    child: new Text("Change ton mot de passe (non dev)",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                      textAlign: TextAlign.center,),
                  )
              ),
              onTap:(){
                /*Navigator.push(context, MaterialPageRoute(builder: (BuildContext){
                  return ContactPage();
                }));*/
              },),
            ),

            Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 35),
                height: 60,
                width: 20,
                color: Colors.transparent,
                child: InkWell(
                  child: Container(
                      decoration:  BoxDecoration(
                          image: DecorationImage
                            (image: NetworkImage('https://cdn3.iconfinder.com/data/icons/network-and-communications-10/32/network_contact_list_contact_log_contact_book-512.png'),
                              alignment: Alignment.centerLeft
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10.0,
                              spreadRadius: 5.0,
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      child: new Center(
                        child: new Text("Liste de contacts",
                          style: TextStyle(fontSize: 17, color: Colors.black),
                          textAlign: TextAlign.center,),
                      )
                  ),
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext){
                      return ContactPage();
                    }));
                  },
                )
            ),
          ],
        ),
      ),
    );
  }


}