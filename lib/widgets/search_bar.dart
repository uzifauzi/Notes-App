import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_app/provider/note_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchNoteBar extends ConsumerStatefulWidget {
  const SearchNoteBar({super.key});

  @override
  ConsumerState<SearchNoteBar> createState() => _SearchNoteBarState();
}

class _SearchNoteBarState extends ConsumerState<SearchNoteBar> {
  final FocusNode _focusNode = FocusNode();

  void _unfocusSearchBar() {
    _focusNode.unfocus();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _unfocusSearchBar,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          focusNode: _focusNode,
          cursorColor: Theme.of(context).colorScheme.secondary,
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.searchTitle,
            hintStyle: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.onSecondary),
            prefixIcon: Icon(Icons.search,
                color: Theme.of(context).colorScheme.onSecondary),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
          onChanged: (query) {
            ref.read(noteListProvider.notifier).searchNoteByTitle(query);
          },
        ),
      ),
    );
  }
}
