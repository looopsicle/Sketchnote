import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sama/features/notes/data/models/note_model.dart';

class NoteNotifier extends StateNotifier<List<Note>> {
  NoteNotifier() : super(_dummyNotes);

  void addNote(Note note) {
    state = [note, ...state]; // Tambah di awal list
  }

  void updateNote(Note updatedNote) {
    state = [
      for (final note in state)
        if (note.id == updatedNote.id) updatedNote else note,
    ];
  }

  void removeNote(String noteId) {
    state = state.where((note) => note.id != noteId).toList();
  }
}

final notesProvider = StateNotifierProvider<NoteNotifier, List<Note>>((ref) {
  return NoteNotifier();
});

// Data dummy
final List<Note> _dummyNotes = [
  Note(
    id: '1',
    type: NoteType.voice,
    title: 'Voice Notes',
    color: const Color(0xFF10B981),
  ),
  Note(
    id: '2',
    type: NoteType.text,
    title: 'Lecture 1',
    content:
        'how the lessons are structured, and what tools or materials you\'ll need. This lecture is designed to set the foundation, so feel free to take notes and ask questions.',
    color: const Color(0xFF3B82F6),
  ),
  Note(
    id: '3',
    type: NoteType.checklist,
    title: 'Shopping List',
    color: const Color(0xFFEC4899),
    checklist: [
      ChecklistItem(text: 'Canned Beans', isCompleted: false),
      ChecklistItem(text: 'Fettuccine', isCompleted: true),
      ChecklistItem(text: 'Toilet Paper', isCompleted: true),
      ChecklistItem(text: 'Oat Milk', isCompleted: false),
      ChecklistItem(text: 'Chocolate', isCompleted: false),
      ChecklistItem(text: 'Juice Box', isCompleted: false),
    ],
  ),
  Note(
    id: '4',
    type: NoteType.text,
    title: 'Lecture 2',
    content:
        'exploring the core ideas behind the subject and why it matters. Whether you\'re completely new or have some',
    color: const Color(0xFFF59E0B),
  ),
  Note(
    id: '5',
    type: NoteType.sketch,
    title: 'Quick Sketch',
    color: Colors.white,
    imagePath: 'assets/images/sketch.png',
  ),
];
