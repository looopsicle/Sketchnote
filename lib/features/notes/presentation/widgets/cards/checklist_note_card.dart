import 'package:flutter/material.dart';
import 'package:sama/features/notes/data/models/note_model.dart';

class ChecklistNoteCard extends StatelessWidget {
  final Note note;
  final VoidCallback? onTap;

  const ChecklistNoteCard({super.key, required this.note, this.onTap});

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
              if (note.checklist != null)
                ...note.checklist!
                    .take(4)
                    .map((item) => _buildChecklistItem(item)),
              if ((note.checklist?.length ?? 0) > 4)
                const Text('...', style: TextStyle(color: Colors.white70)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChecklistItem(ChecklistItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            item.isCompleted
                ? Icons.check_box_rounded
                : Icons.check_box_outline_blank_rounded,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              item.text,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
