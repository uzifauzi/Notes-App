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
}

final noteListProvider = StateNotifierProvider<NoteNotifier, List<Note>>((ref) {
  return NoteNotifier();
});
