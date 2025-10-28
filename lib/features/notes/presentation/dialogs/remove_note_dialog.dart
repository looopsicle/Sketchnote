import 'package:flutter/material.dart';

Future<void> showRemoveNoteDialog(
  BuildContext context,
  VoidCallback onConfirm,
) async {
  return showDialog(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: const Text('Remove Note'),
      content: const Text('Are you sure you want to remove this note?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(dialogContext),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            onConfirm();
            Navigator.pop(dialogContext);
          },
          child: const Text('Remove'),
        ),
      ],
    ),
  );
}
