import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_app/provider/note_provider.dart';

class SearchNoteBar extends ConsumerStatefulWidget {
  const SearchNoteBar({super.key});

  @override
  ConsumerState<SearchNoteBar> createState() => _SearchNoteBarState();
}

class _SearchNoteBarState extends ConsumerState<SearchNoteBar> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _unfocusSearchBar() {
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _unfocusSearchBar,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          focusNode: _focusNode,
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: Theme.of(context).textTheme.labelMedium,
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
          onChanged: (query) {
            // Panggil fungsi pencarian pada provider
            ref.read(noteListProvider.notifier).searchNoteByTitle(query);
          },
        ),
      ),
    );
  }
}
