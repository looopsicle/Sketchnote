import 'package:flutter/material.dart';
import 'package:sama/features/notes/data/models/note_model.dart';

class SketchNoteCard extends StatelessWidget {
  final Note note;
  final VoidCallback? onTap;

  const SketchNoteCard({super.key, required this.note, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: note.color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 12),
              if (note.imagePath != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(note.imagePath!, fit: BoxFit.cover),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
