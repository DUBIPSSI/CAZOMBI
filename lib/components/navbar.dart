import 'package:flutter/material.dart';
import 'package:zombi/pages/case_opening.dart';
import 'package:zombi/pages/main.dart';
import 'package:zombi/pages/profil.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Image.asset('assets/home.png'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
          ),
          IconButton(
            icon: Image.asset('assets/chest.png'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CaseOpening()),
              );
            },
          ),
          IconButton(
            icon: Image.asset('assets/avatar.png'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}