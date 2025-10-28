import 'package:flutter/material.dart';
import 'package:sama/features/notes/data/models/note_model.dart';

extension ColorX on Color {
  /// Mengembalikan `Colors.black` jika background terang, atau `Colors.white` jika background gelap.
  Color get getContrastingColor {
    return computeLuminance() > 0.5 ? Colors.black : Colors.white;
  }
}

class TextNoteCard extends StatelessWidget {
  final Note note;
  final VoidCallback? onTap;

  const TextNoteCard({super.key, required this.note, this.onTap});

  @override
  Widget build(BuildContext context) {
    final textColor = note.color.getContrastingColor;
    final textTheme = Theme.of(context).textTheme;

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
                style: textTheme.titleMedium?.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              if (note.content != null && note.content!.isNotEmpty)
                Text(
                  note.content!,
                  style: textTheme.bodyMedium?.copyWith(
                    color: textColor.withValues(alpha: 0.8),
                  ),
                  maxLines: 5, // Batasi jumlah baris agar rapi
                  overflow: TextOverflow.ellipsis,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
