import 'package:flutter/material.dart';
import 'package:snapshat_like/ui/pages/home/profil/profil_page.dart';
import 'package:snapshat_like/ui/pages/home/settings/settings_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [SettingsPage(),  ProfilPage(), SettingsPage()];
  final List<MaterialColor> _colorsSelectBottomItems = const [Colors.blue,  Colors.yellow, Colors.green];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Colors.black,
        selectedItemColor: _colorsSelectBottomItems[_selectedIndex],
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.message_outlined), label: "▲"),
          BottomNavigationBarItem(icon: Icon(Icons.photo_camera_outlined), label: "▲"),
          BottomNavigationBarItem(icon: Icon(Icons.place_outlined), label: "▲"),
        ],
      ),
    );
  }
}