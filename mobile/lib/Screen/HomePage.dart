import 'package:flutter/material.dart';

import '../Constant.dart';
import 'Reserve.dart';
import 'MyTicket.dart';
import 'Profile/profil.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  void _onItemTapped(int val) {
    setState(() {
      _selectedIndex = val;
    });
  }

  Widget getBody(int index) {
    switch (index) {
      case 0:
        return const MyHome();

      case 1:
        return const Reserve();
      case 2:
        return const Profil();

      default:
        const Reserve();
    }
    return const Reserve();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(_selectedIndex),
      bottomNavigationBar: bottomNavigation(),
    );
  }

  Widget bottomNavigation() {
    return BottomNavigationBar(
      selectedIconTheme:
          const IconThemeData(color: KPrimaryColor, opacity: 1.0, size: 30),
      unselectedIconTheme: const IconThemeData(opacity: 0.5, size: 15),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.article),
          label: 'Mes tickets',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Acceuil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Mon Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: KPrimaryColor,
      onTap: (val) {
        _onItemTapped(val);
      },
    );
  }
}
