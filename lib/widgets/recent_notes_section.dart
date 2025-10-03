import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sama/models/note_model.dart';
import 'package:sama/providers/note_provider.dart';

class RecentNotesSection extends ConsumerWidget {
  const RecentNotesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Note> notes = ref.watch(notesProvider);
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
          itemCount: notes.length,
          itemBuilder: (context, index) {
            final note = notes[index];
            switch (note.type) {
              case NoteType.voice:
                return VoiceNoteCard(note: note);
              case NoteType.text:
                return TextNoteCard(note: note);
              case NoteType.checklist:
                return ChecklistNoteCard(note: note);
              case NoteType.sketch:
                return SketchCard(note: note);
            }
          },
        ),
      ],
    );
  }
}

// Masing-masing card dipecah menjadi widget sendiri agar rapi

class VoiceNoteCard extends StatelessWidget {
  final Note note;
  const VoiceNoteCard({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: note.color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
  final Note note;
  const TextNoteCard({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: note.color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
            const SizedBox(height: 8),
            Text(
              note.content ??
                  '', // Tampilkan konten, atau string kosong jika null
              style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.8)),
            ),
          ],
        ),
      ),
    );
  }
}

class ChecklistNoteCard extends StatelessWidget {
  final Note note;
  const ChecklistNoteCard({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: note.color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
                  .map((item) => _buildChecklistItem(item))
                  .toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildChecklistItem(ChecklistItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
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
          Text(item.text, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

class SketchCard extends StatelessWidget {
  final Note note;
  const SketchCard({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: note.color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 12),
            if (note.imagePath != null)
              Center(child: Image.asset(note.imagePath!)),
          ],
        ),
      ),
    );
  }
}
