import 'package:flutter/material.dart';
import 'package:sama/features/calendar/presentation/screens/calendar_screen.dart';
import 'package:sama/features/folders/presentation/screens/folders_screen.dart';
import 'package:sama/features/notes/presentation/screens/home_screen.dart';
import 'package:sama/features/user/presentation/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    FoldersScreen(),
    CalendarScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      // Index 2 adalah tombol plus
      print('Tombol Plus diklik!');
      return;
    }

    // menyesuaikan index untuk daftar _pages karena tombol plus bukan halaman
    int pageIndex = index > 2 ? index - 1 : index;

    setState(() {
      _selectedIndex = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 10,
        child: SizedBox(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildNavItem(Icons.home, 0),
              _buildNavItem(Icons.folder_open, 1),
              _buildPlusButton(),
              _buildNavItem(Icons.calendar_today, 3),
              _buildNavItem(Icons.person_outline, 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlusButton() {
    return InkWell(
      onTap: () => _onItemTapped(2),
      customBorder: const CircleBorder(),
      child: Container(
        width: 56,
        height: 56,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF2C2C2C),
        ),
        child: const Icon(Icons.add, color: Colors.white, size: 32),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    // Logic untuk select item yang aktif
    int pageIndex = index > 2 ? index - 1 : index;
    final isSelected = _selectedIndex == pageIndex;

    return IconButton(
      icon: Icon(
        icon,
        color: isSelected && index != 2 ? Colors.blueAccent : Colors.grey,
        size: 28,
      ),
      onPressed: () => _onItemTapped(index),
    );
  }
}
