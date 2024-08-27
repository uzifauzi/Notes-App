import 'package:flutter/material.dart';

class SearchNoteBar extends StatelessWidget {
  // final ValueChanged<String> onChanged;

  const SearchNoteBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
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
        // onChanged: onChanged,
      ),
    );
  }
}
