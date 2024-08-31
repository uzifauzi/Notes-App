import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../models/note.dart';
import '../provider/note_provider.dart';

class DeleteDialog extends ConsumerWidget {
  const DeleteDialog({super.key, required this.note});

  final Note note;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Text(
        'Delete Note',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      content: Text(
        'Are you sure want to delete this note?',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'No',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Theme.of(context).colorScheme.onPrimary),
            )),
        ElevatedButton(
            onPressed: () {
              ref.read(noteListProvider.notifier).deleteNote(note.title);
              context.go('/');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: Text('Delete',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary)))
      ],
    );
  }
}
