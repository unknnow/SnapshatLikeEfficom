import 'package:flutter/material.dart';
import 'package:snapshat_like/data/chat_json.dart';
import 'package:snapshat_like/ui/pages/home/contact/recherche_page.dart';
import 'package:snapshat_like/ui/pages/home/conversation/message_page.dart';
//import 'package:snapshat_like/ui/pages/home/home_page.dart';
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
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                //children:
                                //const <Widget>[
                                children: <Widget>[
                                  IconButton(
                                    padding: EdgeInsets.all(0.0),
                                    iconSize: 10,
                                    icon: Image.asset('images/user.png'),
                                    onPressed: (
                                        ) {
                                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext){
                                      return ProfilePage();
                                    }));
                                  },
                                ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  IconButton(
                                    padding: EdgeInsets.all(0.0),
                                    icon: Icon(Icons.search, color: Colors.white, size: 31),
                                    onPressed: (
                                        ) {
                                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext){
                                        return RecherchePage();
                                      }));
                                    },
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('Chat',
                                    style: TextStyle(color: Colors.white, fontSize: 27),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height+41,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(14),
                                  topRight: Radius.circular(14))),
                            child: Column(
                              children: [
                                Column(
                                    children: List.generate(chat_data.length, (index) {
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
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
                                                                      return const MessagePage();
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
                                            height: 0,
                                          ),
                                          Divider()
                                        ],
                                      );
                                    })),
                              ],
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
