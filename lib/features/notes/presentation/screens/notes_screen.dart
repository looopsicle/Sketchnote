import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sama/features/notes/presentation/dialogs/add_note_dialog.dart';
import 'package:sama/features/notes/presentation/providers/note_provider.dart';
import 'package:sama/features/notes/presentation/widgets/cards/note_card.dart';

class NotesScreen extends ConsumerWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(notesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Notes')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: notes.isEmpty
            ? const Center(child: Text('No notes yet. Tap + to add one!'))
            : ListView.separated(
                itemCount: notes.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final note = notes[index];
                  return NoteCard(note: note);
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            showDialog(context: context, builder: (_) => const AddNoteDialog()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
