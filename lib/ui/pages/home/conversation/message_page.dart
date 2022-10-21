import 'package:flutter/material.dart';
import 'package:snapshat_like/ui/pages/home/chat/chat_page.dart';
import 'package:snapshat_like/ui/pages/home/home_page.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFa05dce),
      body: Stack(
        children: <Widget>[
          Container(
              child: Column(
                children: <Widget>[

                  Container(
                    /*decoration: BoxDecoration(
                      color: Colors.purple,),*/
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: const <Widget>[
                            CircleAvatar(
                              backgroundImage: AssetImage('images/user.png'),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Message',
                              style: TextStyle(color: Colors.white, fontSize: 27),
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
                                    return const MyHomePage(title: 'ChatPage');
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
                    height: MediaQuery.of(context).size.height-139,
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 12, left: 21),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14),
                            topRight: Radius.circular(14))),
                    child: SingleChildScrollView(
                    child: Column(
                        children: [
                    Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20,0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(right: 16.0),
                          child: const CircleAvatar(
                            backgroundImage: NetworkImage(
                                "http://res.cloudinary.com/kennyy/image/upload/v1531317427/avatar_z1rc6f.png"),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text("Jean", style: TextStyle(fontWeight: FontWeight.bold)),
                            Container(
                              margin: const EdgeInsets.only(top: 5.0),
                              child: const Text("Hello, ça va toi ? "),
                            )
                          ],
                        ),
                      ],
                    ),
                    ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
                        child:
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(right: 16.0),
                              child: const CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://img.freepik.com/vecteurs-libre/homme-affaires-caractere-avatar-isole_24877-60111.jpg?w=2000"),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text("Didier", style: TextStyle(fontWeight: FontWeight.bold),),
                                Container(
                                  margin: const EdgeInsets.only(top: 5.0),
                                  child: const Text("Ca va bien moi"),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                    ),
              ),
            ),

                  Spacer(),

                  Container(decoration: BoxDecoration(
                    color: Colors.white,),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,),
                    padding: const EdgeInsets.fromLTRB(7, 7, 7, 7),
                    //margin: const EdgeInsets.all(7.0),
                    height: 75,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(35.0),
                              // ignore: prefer_const_literals_to_create_immutables
                              boxShadow: [
                                const BoxShadow(
                                    offset: Offset(0, 3),
                                    blurRadius: 5,
                                    color: Colors.grey)
                              ],
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                    icon: const Icon(
                                      Icons.face,
                                      color: Colors.blueAccent,
                                    ),
                                    onPressed: () {}),
                                const Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: "Votre message",
                                        hintStyle:
                                        TextStyle(color: Colors.blueAccent),
                                        border: InputBorder.none),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.photo_camera,
                                      color: Colors.blueAccent),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(Icons.attach_file,
                                      color: Colors.blueAccent),
                                  onPressed: () {},
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Container(
                          padding: const EdgeInsets.all(15.0),
                          decoration: const BoxDecoration(
                              color: Colors.blueAccent, shape: BoxShape.circle),
                          child: InkWell(
                            child: const Icon(
                              Icons.keyboard_voice,
                              color: Colors.white,
                            ),
                            onLongPress: () {},
                          ),
                        )
                      ],
                    ),
                  ),


                  /*Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 21),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black.withOpacity(.2),offset: Offset(3, 19),blurRadius: 12,spreadRadius: 2)
                          ]
                      ),
                    ),
                  ),*/
        ],
      ),

    ),
    ],
      ),
    );
  }
}