import 'package:flutter/material.dart';
import 'package:snapshat_like/data/chat_json.dart';

import '../profil/profil_page.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
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
                            Icon(Icons.search, color: Colors.white, size: 31),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Contact',
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
                                    return const ProfilePage();
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
                    height: MediaQuery.of(context).size.height,
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
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
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
