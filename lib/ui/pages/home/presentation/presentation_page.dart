import 'package:flutter/material.dart';
import 'package:snapshat_like/ui/pages/home/Login/login_page.dart';
import 'package:snapshat_like/ui/pages/home/inscription/inscription_page.dart';

class PresentationPage extends StatelessWidget {
  const PresentationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: Scaffold(
          backgroundColor: Color(0xFFF7E300),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(130, 20, 130, 70),
                    child: Image.asset('images/snap2.png'),
                  ),
                  Row(
                    children: [
                      Container(
                          width: 200.0,
                          height: 150.0,
                          padding: const EdgeInsets.fromLTRB(50, 20, 20, 70),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )
                            ),
                            child: const Text('Se connecter'),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                                return const LoginPage();
                              }));
                            },
                          )
                      ),
                      Container(
                          width: 170.0,
                          height: 150.0,
                          padding: const EdgeInsets.fromLTRB(10, 20, 20, 70),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )
                            ),
                            child: const Text('Creer un compte'),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                                return const InscriptionPage();
                              }));
                            },
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