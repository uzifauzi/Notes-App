import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/add_note_page.dart';
import '../screens/detail_note_page.dart';
import '../screens/edit_note_page.dart';
import '../screens/home_page.dart';
import '../services/note_boxes.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'add',
          builder: (context, state) => const AddNotePage(),
        ),
        GoRoute(
          name: 'noteDetail',
          path: 'detail/:title',
          builder: (context, state) {
            final String title = state.pathParameters['title'] ?? '';
            final note = boxNotes.get(title);

            if (note != null) {
              return NoteDetailPage(note: note);
            } else {
              return const Scaffold(
                body: Center(child: Text('Note not found')),
              );
            }
          },
        ),
        GoRoute(
          name: 'edit',
          path: 'edit/:title',
          builder: (context, state) {
            final String title = state.pathParameters['title']!;
            final note = boxNotes.get(title); // Ambil note berdasarkan title

            if (note != null) {
              return EditNotePage(note: note);
            } else {
              return const Scaffold(
                body: Center(child: Text('Note not found')),
              );
            }
          },
        ),
      ],
    ),
  ],
);
