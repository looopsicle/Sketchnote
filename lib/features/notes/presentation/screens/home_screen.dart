import 'package:flutter/material.dart';
import 'package:sama/features/folders/presentation/widgets/folders_section.dart';
import 'package:sama/widgets/header_widget.dart';
import 'package:sama/features/notes/presentation/widgets/recent_notes_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Hapus Scaffold dan BottomAppBar dari sini
    return Scaffold(
      backgroundColor: const Color(0xFFF5F0EA),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
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
                        SizedBox(height: 24),
                        RecentNotesSection(),
                        SizedBox(height: 80),
                      ],
                    ),
                  ),
                ),
              ),
              const HeaderWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
