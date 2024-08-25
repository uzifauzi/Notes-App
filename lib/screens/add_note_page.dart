import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_app/provider/note_provider.dart';

import '../models/note.dart';

class AddNotePage extends ConsumerStatefulWidget {
  const AddNotePage({super.key});

  @override
  ConsumerState<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends ConsumerState<AddNotePage> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  void _saveNote() {
    final note = Note(
      title: titleController.text,
      content: contentController.text,
      createdAt: DateTime.now(),
    );

    ref.read(noteListProvider.notifier).addNotes(note);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: _saveNote,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Untitled',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TextField(
                controller: contentController,
                decoration: const InputDecoration(
                  hintText: 'Start typing...',
                  border: InputBorder.none,
                ),
                maxLines: null, // Makes the text field grow with content
                keyboardType: TextInputType.multiline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
