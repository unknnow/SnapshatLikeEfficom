import 'package:flutter/material.dart';
import 'package:snapshat_like/ui/pages/home/chat/chat_page.dart';
import 'package:snapshat_like/ui/pages/home/conversation/message_page.dart';
import 'package:snapshat_like/ui/pages/home/descover/descover_page.dart';
import 'package:snapshat_like/ui/pages/home/profil/profil_page.dart';
import 'package:snapshat_like/ui/pages/home/settings/settings_page.dart';
import 'package:snapshat_like/ui/pages/home/camera/camera_page.dart';
import 'package:snapshat_like/ui/pages/home/map/map_page.dart';
import 'package:snapshat_like/ui/pages/home/presentation/presentation_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;

  final List<Widget> _pages =  [
    ChatPage(), CameraPage(), MapPage(), DescoverPage(),
  ];
  final List<MaterialColor> _colorsSelectBottomItems = const [
    Colors.blue,  Colors.yellow, Colors.green, Colors.red
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text(widget.title),
      ),*/
      body: _pages[_selectedIndex],
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),*/

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Colors.black,
        selectedItemColor: _colorsSelectBottomItems[_selectedIndex],
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.message_outlined), label: "▲"),
          BottomNavigationBarItem(icon: Icon(Icons.photo_camera_outlined), label: "▲"),
          BottomNavigationBarItem(icon: Icon(Icons.place_outlined), label: "▲"),
          BottomNavigationBarItem(icon: Icon(Icons.play_arrow_outlined), label: "▲"),
        ],
      ),
    );
  }
}