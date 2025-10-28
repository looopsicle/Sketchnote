import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sama/app/app.dart';

void main() {
  runApp(
    const ProviderScope(
      // ✅ supaya Riverpod bisa dipakai di seluruh app
      child: SketchNotesApp(),
    ),
  );
}
