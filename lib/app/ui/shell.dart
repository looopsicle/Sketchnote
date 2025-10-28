import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sama/config/navigation/routers/routes_location.dart';

class AppShell extends StatefulWidget {
  final Widget child;
  const AppShell({super.key, required this.child});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _selectedIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedIndex = _getCurrentIndex(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: widget.child),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 10,
        child: SizedBox(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildNavItem(Icons.home, 0, RouteLocation.notes),
              _buildNavItem(Icons.folder_open, 1, RouteLocation.folders),
              _buildPlusButton(context),
              _buildNavItem(Icons.calendar_today, 3, RouteLocation.calendar),
              _buildNavItem(Icons.person_outline, 4, RouteLocation.profile),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlusButton(BuildContext context) {
    return InkWell(
      onTap: () => _showAddNoteDialog(context),
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

  Widget _buildNavItem(IconData icon, int index, String route) {
    final isSelected = _selectedIndex == index;

    return IconButton(
      icon: Icon(
        icon,
        color: isSelected ? Colors.blueAccent : Colors.grey,
        size: 28,
      ),
      onPressed: () {
        setState(() => _selectedIndex = index);
        context.go(route);
      },
    );
  }

  void _showAddNoteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        String title = '';
        String content = '';

        return AlertDialog(
          title: const Text('Add New Note'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                onChanged: (value) => title = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Content'),
                onChanged: (value) => content = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: save note ke provider / local db
                print('New note added: $title - $content');
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(RouteLocation.folders)) return 1;
    if (location.startsWith(RouteLocation.calendar)) return 3;
    if (location.startsWith(RouteLocation.profile)) return 4;
    return 0;
  }
}
