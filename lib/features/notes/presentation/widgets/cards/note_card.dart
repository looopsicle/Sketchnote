import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sama/features/notes/data/models/note_model.dart';
import 'package:sama/features/notes/presentation/providers/note_provider.dart';
import 'package:sama/features/notes/presentation/widgets/cards/text_note_card.dart';
import 'package:sama/features/notes/presentation/widgets/cards/voice_note_card.dart';
import 'package:sama/features/notes/presentation/widgets/cards/checklist_note_card.dart';
import 'package:sama/features/notes/presentation/widgets/cards/sketch_note_card.dart';
import 'package:sama/features/notes/presentation/dialogs/remove_note_dialog.dart';

class NoteCard extends ConsumerWidget {
  final Note note;
  final VoidCallback? onTap;

  const NoteCard({super.key, required this.note, this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Fungsi long press → buka dialog hapus
    Future<void> _handleLongPress() async {
      await showRemoveNoteDialog(context, () {
        ref.read(notesProvider.notifier).removeNote(note.id);
      });
    }

    // Pilih tampilan card berdasarkan tipe note
    Widget card;
    switch (note.type) {
      case NoteType.text:
        card = TextNoteCard(note: note);
        break;
      case NoteType.voice:
        card = VoiceNoteCard(note: note);
        break;
      case NoteType.checklist:
        card = ChecklistNoteCard(note: note);
        break;
      case NoteType.sketch:
        card = SketchNoteCard(note: note);
        break;
    }

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      onLongPress: _handleLongPress,
      child: card,
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:sama/features/notes/data/models/note_model.dart';

// class NoteCard extends StatelessWidget {
//   final Note note;
//   const NoteCard({super.key, required this.note});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: note.color,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               note.title,
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87,
//               ),
//             ),
//             if (note.content != null) ...[
//               const SizedBox(height: 8),
//               Text(
//                 note.content!,
//                 style: const TextStyle(color: Colors.black54),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }