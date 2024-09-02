import 'package:hive_flutter/hive_flutter.dart';

import '../models/note.dart';

late Box<Note> boxNotes;

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  boxNotes = await Hive.openBox<Note>('notesBox');
}
