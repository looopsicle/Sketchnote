import 'package:flutter/material.dart';

class FoldersSection extends StatelessWidget {
  const FoldersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'My Folders',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              FolderItem(
                imagePath: 'assets/images/folder_blue.png',
                label: 'Homeworks',
              ),
              SizedBox(width: 18),
              FolderItem(
                imagePath: 'assets/images/folder_yellow.png',
                label: 'Workouts',
              ),
              SizedBox(width: 18),
              FolderItem(
                imagePath: 'assets/images/folder_pink.png',
                label: 'Sports',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FolderItem extends StatelessWidget {
  final String imagePath;
  final String label;

  const FolderItem({super.key, required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imagePath, width: 110, height: 80),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }
}
