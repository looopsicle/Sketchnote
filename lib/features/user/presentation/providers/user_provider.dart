import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider untuk menyediakan data yang tidak berubah (read-only).
final userProvider = Provider<String>((ref) {
  return 'Reggy'; // hanya placeholder, di aplikasi nyata ini bisa dari API atau database.
});
