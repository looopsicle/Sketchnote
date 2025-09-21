import 'package:flutter/material.dart';
import 'package:sama/widgets/folders_section.dart';
import 'package:sama/widgets/header_widget.dart';
import 'package:sama/widgets/recent_notes_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    // button plus tidak memiliki index, handle secara terpisah
    if (index == 2) {
      print(
        'plus button clicked!',
      ); // Di sini kamu bisa tambahkan navigasi atau fungsi untuk membuat note baru
      return;
    }

    // state untuk ikon selain tombol plus. menyesuaikan index karena ada item di tengah
    int newIndex = index > 2 ? index - 1 : index;
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F0EA),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                // Dorong container putih ke bawah sejauh 120px dari atas
                padding: const EdgeInsets.only(top: 120),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF9F9F9),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 24),
                        FoldersSection(),
                        // SizedBox(height: 24),
                        RecentNotesSection(),
                        // Beri ruang di bawah agar tidak mentok saat scroll
                        SizedBox(height: 80),
                      ],
                    ),
                  ),
                ),
              ),
              const HeaderWidget(userName: 'Aurely'),
            ],
          ),
        ),
      ),
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
    final isSelected = _selectedIndex == (index > 2 ? index - 1 : index);
    return IconButton(
      icon: Icon(
        icon,
        color: isSelected ? Colors.blueAccent : Colors.grey,
        size: 28,
      ),
      onPressed: () => _onItemTapped(index),
    );
  }
}

//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         backgroundColor: const Color(0xFF2C2C2C),
//         foregroundColor: Colors.white,
//         elevation: 2,
//         shape: const CircleBorder(),
//         child: const Icon(Icons.add, size: 32),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: BottomAppBar(
//         shape: const CircularNotchedRectangle(),
//         notchMargin: 8.0,
//         color: Colors.white,
//         elevation: 10,
//         child: SizedBox(
//           height: 60.0,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _buildNavItem(Icons.home, 'Home', 0),
//                   _buildNavItem(Icons.folder_open, 'Files', 1),
//                 ],
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _buildNavItem(Icons.calendar_today, 'Calendar', 2),
//                   _buildNavItem(Icons.person_outline, 'Profile', 3),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildNavItem(IconData icon, String label, int index) {
//     final isSelected = _selectedIndex == index;
//     return MaterialButton(
//       minWidth: 40,
//       onPressed: () {
//         _onItemTapped(index);
//       },
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, color: isSelected ? Colors.black : Colors.grey, size: 28),
//         ],
//       ),
//     );
//   }
// }
