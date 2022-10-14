import 'package:flutter/material.dart';
import 'package:snapshat_like/data/chat_json.dart';

import '../profil/profil_page.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xFFa05dce),
        body: Stack(
          children: <Widget>[
            Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                        SizedBox(
                          height: 24,
                        ),
                        Padding(
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
                                  Icon(Icons.search, color: Colors.white, size: 31),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Chat',
                                    style: TextStyle(color: Colors.white, fontSize: 27),
                                  )
                                ],
                              ),
                              Icon(Icons.cloud_outlined, color: Colors.white, size: 31)
                            ],
                          ),
                        ),
                        Container(
                          width: size.width,
                          height: size.height,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              color: Colors.white),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Column(
                                    children: List.generate(chat_data.length, (index) {
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 20, left: 20),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  width: (size.width - 40) * 0.68,
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        width: 50,
                                                        height: 50,
                                                        decoration: BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            image: DecorationImage(
                                                                image: NetworkImage(
                                                                    chat_data[index]['img']),
                                                                fit: BoxFit.cover)),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Container(
                                                        width: (size.width - 0) * 0.3,
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              chat_data[index]['name'],
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors.black,
                                                                  fontWeight: FontWeight.w400),
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                            SizedBox(
                                                              height: 3,
                                                            ),
                                                            Text(
                                                              chat_data[index]['description'],
                                                              style: TextStyle(
                                                                  fontSize: 11.8,
                                                                  color: Colors.black.withOpacity(0.5),
                                                                  fontWeight: FontWeight.w400),
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              chat_data[index]['nickname'],
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors.black.withOpacity(0.5),
                                                                  fontWeight: FontWeight.w400),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: (size.width - 40) * 0.32,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(30),
                                                            border: Border.all(color: Color(0xFF0daff5), width: 2)),
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(
                                                              right: 12, bottom: 4, left: 12, top: 4),
                                                          child: Row(
                                                            children: [
                                                              SizedBox(
                                                                width: 20,
                                                                height: 20,
                                                                child: IconButton(
                                                                  padding: EdgeInsets.all(0.0),
                                                                  icon: const Icon(Icons.local_phone, size: 20, color: Color(0xFF0daff5)),
                                                                  onPressed: (
                                                                      ) {
                                                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext){
                                                                      return MessagePage();
                                                                    }));
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(40),
                                                            border: Border.all(color: Colors.green, width: 2)),
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(
                                                              right: 12, bottom: 4, left: 12, top: 4),
                                                          child: Row(
                                                            children: [
                                                              SizedBox(
                                                                width: 20,
                                                                height: 20,
                                                                child: IconButton(
                                                                  padding: EdgeInsets.all(0.0),
                                                                  icon: const Icon(Icons.chat_bubble_outline),
                                                                  color: Colors.green,
                                                                  onPressed: (
                                                                      ) {
                                                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext){
                                                                      return MessagePage();
                                                                    }));
                                                                  },
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Divider()
                                        ],
                                      );
                                    })),
                              ],
                            ),
                          ),
                        )
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }
}
class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        // ignore: unnecessary_new
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                        child: const Text("Ehhh gros j'ai pas compris"),
                      )
                    ],
                  )
                ],
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.all(15.0),
              height: 61,
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
          ],
        ));
  }
}