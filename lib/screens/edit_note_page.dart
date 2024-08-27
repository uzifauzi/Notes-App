import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_app/provider/note_provider.dart';

import '../models/note.dart';

class EditNotePage extends ConsumerStatefulWidget {
  const EditNotePage({super.key, required this.note});

  final Note note;

  @override
  ConsumerState<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends ConsumerState<EditNotePage> {
  late TextEditingController titleController;
  late TextEditingController contentController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note.title);
    contentController = TextEditingController(text: widget.note.content);
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  void _saveNote() {
    final updatedNote = Note(
      title: titleController.text,
      content: contentController.text,
      createdAt:
          widget.note.createdAt, // Mempertahankan tanggal pembuatan yang asli
    );

    ref.read(noteListProvider.notifier).updateNote(updatedNote);
    Navigator.pop(context); // Kembali ke halaman detail setelah menyimpan
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveNote,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Title',
              ),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: contentController,
              decoration: const InputDecoration(
                hintText: 'Content',
              ),
              style: const TextStyle(
                fontSize: 18,
                height: 1.5,
              ),
              maxLines: null,
            ),
          ],
        ),
      ),
    );
  }
}
