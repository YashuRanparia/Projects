import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:surat_transit/Screens/ExploreScreen/ThirdScreen.dart';
import 'package:surat_transit/Service/getsMethod.dart';

import 'HomeScreenWidget/HomeScreen.dart';
import 'SecondScreen/searchRoutes.dart';

class CustomNavigation extends StatefulWidget {
  const CustomNavigation({super.key});

  @override
  State<CustomNavigation> createState() => _CustomNavigationState();
}

class _CustomNavigationState extends State<CustomNavigation> {
  var selectedindex = 0;
  static final List<Widget> _screens = [
    const HomeScreen(),
    const SearchRoutes(),
  ];
  void _onTapped(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: selectedindex == 2 ? true : false,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: selectedindex < 2
          ? _screens.elementAt(selectedindex)
          : const SizedBox(),
      bottomNavigationBar: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
              currentIndex: selectedindex,
              onTap: _onTapped,
              backgroundColor: Colors.white,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              selectedItemColor: const Color.fromRGBO(35, 138, 250, 1),
              unselectedItemColor: Colors.black45,
              type: BottomNavigationBarType.fixed,
              iconSize: 30,
              items: [
                const BottomNavigationBarItem(
                    icon: Icon(Icons.route_rounded),
                    label: "Routs",
                    activeIcon: Icon(
                      Icons.route_outlined,
                    )),
                const BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/edit.png'),
                    size: 42,
                  ),
                  label: "Plan",
                  activeIcon: ImageIcon(
                    AssetImage('assets/images/edit.png'),
                    color: Color.fromARGB(255, 255, 190, 59),
                    size: 42,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: GestureDetector(
                      onTap: () => nextScreen(context, const ExploreScreen()),
                      child: const Icon(Icons.explore_outlined)),
                  label: "Explore",
                  activeIcon: GestureDetector(
                    onTap: () => nextScreen(context, const ExploreScreen()),
                    child: const Icon(
                      Icons.explore_outlined,
                      color: Color.fromARGB(255, 55, 52, 52),
                      size: 32,
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
