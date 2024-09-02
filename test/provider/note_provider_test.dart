import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_test/hive_test.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/provider/note_provider.dart';
import 'package:notes_app/services/note_boxes.dart';

void main() {
  late ProviderContainer container;

  setUpAll(() async {
    // Inisialisasi Hive di memori untuk pengujian
    await setUpTestHive();

    // Register Adapter
    Hive.registerAdapter(NoteAdapter());
    // Membuka boxNotes
    boxNotes = await Hive.openBox<Note>('notesBox_test');
    container = ProviderContainer();
  });

  tearDownAll(() async {
    // Tutup boxNotes dan bersihkan Hive setelah semua pengujian selesai
    await boxNotes.close();
    await tearDownTestHive(); // Membersihkan Hive di memori
  });

  group(
    'provider test',
    () {
      test('addNote should add a new note to the list', () {
        // Arrange
        final noteNotifier = container.read(noteListProvider.notifier);

        final newNote = Note(
          title: 'Test Note',
          content: 'This is a test note.',
          createdAt: DateTime.now(),
        );

        // Act
        noteNotifier.addNotes(newNote);

        // Assert
        final result = container.read(noteListProvider);
        expect(result.length, 1);
        expect(result.first.title, 'Test Note');
        expect(result.first.content, 'This is a test note.');
      });

      test('deleteNote should remove note from the list', () {
        // Arrange
        final noteNotifier = container.read(noteListProvider.notifier);

        final newNote = Note(
          title: 'Test Note',
          content: 'This is a test note.',
          createdAt: DateTime.now(),
        );
        noteNotifier.addNotes(newNote);

        // Act
        noteNotifier.deleteNote(newNote.title);

        // Assert
        final result = container.read(noteListProvider);
        expect(result.length, 0);
      });
    },
  );
}
