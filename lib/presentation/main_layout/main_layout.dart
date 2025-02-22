import 'package:evently_c13_offline/core/routes_manager/routes.dart';
import 'package:evently_c13_offline/presentation/main_layout/home/home_tab.dart';
import 'package:evently_c13_offline/presentation/main_layout/love/favTab.dart';
import 'package:evently_c13_offline/presentation/main_layout/map/maps_tab.dart';
import 'package:evently_c13_offline/presentation/main_layout/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    FavTab(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.createEvent);
        },
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
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),
              label: AppLocalizations.of(context)!.home_tab),
          BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined),
              label: AppLocalizations.of(context)!.map_tab),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),
              label: AppLocalizations.of(context)!.fav_tab),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: AppLocalizations.of(context)!.profile_tab),
        ]),
      );

// void showCreateEventBottomSheet() {
//   showModalBottomSheet(
//       isScrollControlled: true,
//       context: context, builder: (context) => CreateEvent());
// }
}
