import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_app/services/note_boxes.dart';

import '../models/note.dart';

class NoteNotifier extends StateNotifier<List<Note>> {
  NoteNotifier() : super([]) {
    loadNotes();
  }

  void loadNotes() {
    final notes = notePersons.values.toList();
    state = notes;
  }

  void addNotes(Note note) {
    notePersons.put(note.title, note);
    loadNotes();
  }

  void deleteNote(String title) {
    notePersons.delete(title);
    loadNotes();
  }

  void updateNote(Note updatedNote) {
    notePersons.put(updatedNote.title, updatedNote);
    loadNotes();
  }

  void searchNoteByTitle(String query) {
    if (query.isEmpty) {
      loadNotes(); // Jika query kosong, kembalikan semua note
    } else {
      state = notePersons.values
          .where(
              (note) => note.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}

final noteListProvider = StateNotifierProvider<NoteNotifier, List<Note>>((ref) {
  return NoteNotifier();
});
