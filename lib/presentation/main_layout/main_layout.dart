import 'package:evently_c13_offline/presentation/main_layout/home/home_tab.dart';
import 'package:evently_c13_offline/presentation/main_layout/love/love.dart';
import 'package:evently_c13_offline/presentation/main_layout/map/maps_tab.dart';
import 'package:evently_c13_offline/presentation/main_layout/profile/profile.dart';
import 'package:flutter/material.dart';

class MAinLayOut extends StatefulWidget {
  MAinLayOut({super.key});

  @override
  State<MAinLayOut> createState() => _MAinLayOutState();
}

class _MAinLayOutState extends State<MAinLayOut> {
  int selectedIndex = 0;

  var tabs = [
    HomeTab(),
    Maps(),
    Love(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomNavBar(),
      body: tabs[selectedIndex],
    );
  }

  buildBottomNavBar() => BottomAppBar(
        notchMargin: 6,
        child: BottomNavigationBar(
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.map_outlined), label: 'Maps'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Fav'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ]),
      );
}
