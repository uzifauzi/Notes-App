import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/note.dart';
import '../services/note_boxes.dart';

class NoteNotifier extends StateNotifier<List<Note>> {
  NoteNotifier() : super([]) {
    loadNotes();
  }

  void loadNotes() {
    final notes = boxNotes.values.toList();
    state = notes;
  }

  void addNotes(Note note) {
    boxNotes.put(note.title, note);
    loadNotes();
  }

  void deleteNote(String title) {
    boxNotes.delete(title);
    loadNotes();
  }

  void updateNote(Note updatedNote) {
    boxNotes.put(updatedNote.title, updatedNote);
    loadNotes();
  }

  void searchNoteByTitle(String query) {
    if (query.isEmpty) {
      loadNotes(); // Jika query kosong, kembalikan semua note
    } else {
      state = boxNotes.values
          .where(
              (note) => note.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}

final noteListProvider = StateNotifierProvider<NoteNotifier, List<Note>>((ref) {
  return NoteNotifier();
});
