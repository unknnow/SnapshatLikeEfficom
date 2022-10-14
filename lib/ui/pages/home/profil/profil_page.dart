import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 40.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://w7.pngwing.com/pngs/140/571/png-transparent-snapchat-youtube-android-the-hobbit-snapchat-face-head-cartoon.png'),
                maxRadius: 50,
                backgroundColor: Color.fromARGB(100, 22, 44, 33),

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
                    child: new Text("Change ton emoji",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                      textAlign: TextAlign.center,),
                  )),

            ),


            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 35),
              height: 60,
              width: 20,
              color: Colors.transparent,
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
                    child: new Text("Change ton mot de passe",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                      textAlign: TextAlign.center,),
                  )),

            ),

            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 35),
              height: 60,
              width: 20,
              color: Colors.transparent,
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
                  )),

            ),

          ],
        ),
      ),
    );
  }
}
