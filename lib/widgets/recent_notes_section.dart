import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class RecentNotesSection extends StatelessWidget {
  const RecentNotesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 14),
        MasonryGridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          itemCount: 5, // Jumlah item notes
          itemBuilder: (context, index) {
            // Logika untuk menampilkan card yang berbeda-beda
            switch (index) {
              case 0:
                return const VoiceNoteCard();
              case 1:
                return const TextNoteCard(
                  color: Color(0xFF3B82F6),
                  title: 'Lecture 1',
                  content:
                      'how the lessons are structured, and what tools or materials you\'ll need. This lecture is designed to set the foundation, so feel free to take notes and ask questions.',
                );
              case 2:
                return const ShoppingListCard();
              case 3:
                return const TextNoteCard(
                  color: Color(0xFFF59E0B),
                  title: 'Lecture 2',
                  content:
                      'exploring the core ideas behind the subject and why it matters. Whether you\'re completely new or have some',
                );
              case 4:
                return const SketchCard();
              default:
                return Container();
            }
          },
        ),
      ],
    );
  }
}

// Masing-masing card dipecah menjadi widget sendiri agar rapi

class VoiceNoteCard extends StatelessWidget {
  const VoiceNoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF10B981),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        // <-- INI BAGIAN YANG DIPERBAIKI
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Voice Notes',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                  size: 36,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Image.asset(
                    'assets/images/waveform.png',
                    color: Color.fromRGBO(255, 255, 255, 0.8),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TextNoteCard extends StatelessWidget {
  final Color color;
  final String title;
  final String content;

  const TextNoteCard({
    super.key,
    required this.color,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.9)),
            ),
          ],
        ),
      ),
    );
  }
}

class ShoppingListCard extends StatelessWidget {
  const ShoppingListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFEC4899),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Shopping List',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 12),
            _buildChecklistItem('Canned Beans', false),
            _buildChecklistItem('Fettuccine', true),
            _buildChecklistItem('Toilet Paper', true),
            _buildChecklistItem('Oat Milk', false),
            _buildChecklistItem('Chocolate', false),
            _buildChecklistItem('Juice Box', false),
          ],
        ),
      ),
    );
  }

  Widget _buildChecklistItem(String item, bool checked) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(
            checked
                ? Icons.check_box_rounded
                : Icons.check_box_outline_blank_rounded,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(item, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

class SketchCard extends StatelessWidget {
  const SketchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Quick Sketch',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 12),
            Center(child: Image.asset('assets/images/sketch.png')),
          ],
        ),
      ),
    );
  }
}
