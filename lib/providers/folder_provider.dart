import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sama/models/folder_model.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

const List<String> availableFolderIcons = [
  'assets/images/folder_blue.png',
  'assets/images/folder_yellow.png',
  'assets/images/folder_pink.png',
];

class FolderNotifier extends StateNotifier<List<Folder>> {
  FolderNotifier()
    : super([
        // Data awal menggunakan path aset
        Folder(
          id: uuid.v4(),
          name: 'Homeworks',
          iconAssetPath: availableFolderIcons[0],
        ),
        Folder(
          id: uuid.v4(),
          name: 'Workouts',
          iconAssetPath: availableFolderIcons[1],
        ),
        Folder(
          id: uuid.v4(),
          name: 'Sports',
          iconAssetPath: availableFolderIcons[2],
        ),
      ]);

  // MENAMBAH folder baru
  void addFolder(String name, String assetPath) {
    // <-- Terima path aset
    final newFolder = Folder(
      id: uuid.v4(),
      name: name,
      iconAssetPath: assetPath,
    );
    state = [...state, newFolder];
  }

  // MENGUBAH ikon folder (sebelumnya warna)
  void updateFolderIcon(String folderId, String newAssetPath) {
    // <-- Terima path aset baru
    state = [
      for (final folder in state)
        if (folder.id == folderId)
          Folder(id: folder.id, name: folder.name, iconAssetPath: newAssetPath)
        else
          folder,
    ];
  }

  // Menghapus folder (tetap sama)
  void removeFolder(String folderId) {
    state = state.where((folder) => folder.id != folderId).toList();
  }
}

final folderProvider = StateNotifierProvider<FolderNotifier, List<Folder>>((
  ref,
) {
  return FolderNotifier();
});
