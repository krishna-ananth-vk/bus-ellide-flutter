import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/map_screen.dart';
import '../screens/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  Key _mapKey = UniqueKey();

  late final List<Widget> _pages = [
    HomeScreen(),
    MapScreen(key: _mapKey),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    if (index == 1) {
      // 3. If switching to the Map tab, generate a new UniqueKey().
      // This tells Flutter the MapScreen widget is a *new* instance,
      // forcing the framework to dispose the old one and rebuild the new one immediately.
      setState(() {
        _selectedIndex = index;
        _mapKey = UniqueKey(); // Force the map screen to rebuild
        _pages[1] = MapScreen(key: _mapKey); // Update the page list
      });
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus_outlined),
            activeIcon: Icon(Icons.directions_bus),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
