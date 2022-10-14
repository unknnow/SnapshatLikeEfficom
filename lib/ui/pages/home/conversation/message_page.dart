import 'package:flutter/material.dart';

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
