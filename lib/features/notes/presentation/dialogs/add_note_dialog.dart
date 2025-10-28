import 'package:flutter/material.dart';

class AddNoteDialog extends StatelessWidget {
  const AddNoteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Note'),
      content: const TextField(
        decoration: InputDecoration(labelText: 'Note content'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(onPressed: () {}, child: const Text('Save')),
      ],
    );
  }
}
