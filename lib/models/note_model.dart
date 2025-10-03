import 'package:flutter/material.dart';

enum NoteType {
  voice,
  text,
  checklist,
  sketch,
} // Enum untuk merepresentasikan tipe-tipe note yang berbeda

class Note {
  final String id;
  final NoteType type;
  final String title;
  final String? content;
  final Color color;
  final List<ChecklistItem>? checklist;
  final String? imagePath;

  Note({
    required this.id,
    required this.type,
    required this.title,
    this.content,
    required this.color,
    this.checklist,
    this.imagePath,
  });
}

// Model spesifik untuk item di dalam checklist
class ChecklistItem {
  final String text;
  final bool isCompleted;

  ChecklistItem({required this.text, required this.isCompleted});
}
