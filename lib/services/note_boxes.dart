import 'package:hive_flutter/hive_flutter.dart';

import '../models/note.dart';

late Box<Note> notePersons;

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  notePersons = await Hive.openBox<Note>('notesBox');
}
