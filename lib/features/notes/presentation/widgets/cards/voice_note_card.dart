import 'package:flutter/material.dart';
import 'package:sama/features/notes/data/models/note_model.dart';

class VoiceNoteCard extends StatelessWidget {
  final Note note;
  final VoidCallback? onTap;

  const VoiceNoteCard({super.key, required this.note, this.onTap});

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
                      color: Colors.white.withValues(alpha: 0.8),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
