import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sama/features/folders/data/models/folder_model.dart';
import 'package:sama/features/folders/presentation/providers/folder_provider.dart';

// import 'package:sama/models/folder_model.dart';
// import 'package:sama/providers/folder_provider.dart';

class FoldersSection extends ConsumerWidget {
  const FoldersSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Folder> folders = ref.watch(folderProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'My Folders',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 140,
          child: ListView.separated(
            itemCount: folders.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 18),
            itemBuilder: (context, index) {
              return FolderItem(folder: folders[index]);
            },
          ),
        ),
      ],
    );
  }
}

// FolderItem untuk menggunakan Image.asset
class FolderItem extends StatelessWidget {
  final Folder folder;
  const FolderItem({super.key, required this.folder});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          folder.iconAssetPath,
          width: 110,
          height: 80,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.error, size: 80, color: Colors.red);
          },
        ),
        const SizedBox(height: 4),
        Text(folder.name, style: const TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }
}
