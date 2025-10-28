import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sama/config/navigation/routers/routes_location.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static SplashScreen builder(BuildContext context, GoRouterState state) =>
      const SplashScreen();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeIn;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();

    // Simulasi loading (cek auth dsb)
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.go(RouteLocation.notes); // redirect ke home/notes
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF051e3c),
      body: Center(
        child: FadeTransition(
          opacity: _fadeIn,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ganti dengan logo kamu
              Icon(Icons.note_alt_outlined, size: 80, color: Colors.white),
              const SizedBox(height: 20),
              const Text(
                "SketchNotes",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Organize your thoughts effortlessly",
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
