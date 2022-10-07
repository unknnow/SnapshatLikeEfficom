import 'package:flutter/material.dart';

class PresentationPage extends StatelessWidget {
  const PresentationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: Scaffold(
          backgroundColor: Colors.yellowAccent,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 70),
                    child: Image.network('https://png.pngtree.com/element_our/png/20181011/snapchat-social-media-icon-design-template-vector-png_126980.jpg'),
                  ),
                  Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )
                            ),
                            child: const Text('Se connecter'),
                            onPressed: () {},
                          )
                      ),
                      Container(
                          padding: const EdgeInsets.all(20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )
                            ),
                            child: const Text('Creer un compte'),
                            onPressed: () {},
                          )
                      ),
                    ],
                  )
                ],
              ),
            )
        )
    );
  }
}