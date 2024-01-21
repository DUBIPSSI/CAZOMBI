import 'package:flutter/material.dart';
import 'package:zombi/components/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.purple,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome on CAZOMBI OPENING",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,
                  fontFamily: "Creepster",
                ),
              ),
              SizedBox(
                height: 550,
                width:
                    double.infinity,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Positioned(
                      top: 50,
                      child: Image.asset(
                        'assets/open_chest.png',
                        height: 550,
                      ),
                    ),
                    Image.asset(
                      'assets/zombi.png',
                      height: 300,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
