import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sama/pages/home_page.dart';
import 'package:sama/pages/main_screen.dart';

void main() {
  runApp(const ProviderScope(child: SketchNotesApp()));
}

class SketchNotesApp extends StatelessWidget {
  const SketchNotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SketchNotes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        textTheme: GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
