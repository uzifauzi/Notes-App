import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/widgets/delete_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/note.dart';

class NoteDetailPage extends ConsumerWidget {
  final Note note;

  const NoteDetailPage({super.key, required this.note});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      onPopInvoked: (didPop) {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title:
              Text('Notes', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'Delete') {
                  showDialog(
                      context: context,
                      builder: (context) => DeleteDialog(note: note));
                } else if (value == 'Edit') {
                  context.goNamed('edit', pathParameters: {
                    'title': note.title,
                  });
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'Edit',
                  child: Row(
                    children: [
                      const Icon(Icons.edit),
                      Text(AppLocalizations.of(context)!.editNoteTitle),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'Delete',
                  child: Row(
                    children: [
                      const Icon(Icons.delete),
                      Text(AppLocalizations.of(context)!.deleteNoteTitle),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Text(
                note.content,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
