import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/widgets/note_card.dart';
import 'package:notes_app/widgets/search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notely',
          style:
              GoogleFonts.nunitoSans(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.more_horiz_rounded), onPressed: () {})
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            SearchNoteBar(),
            Expanded(child: NoteGrid()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class NoteGrid extends StatelessWidget {
  const NoteGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> notes = [
      {
        "title": "What is a Logo?",
        "content": "This question probably conjures..."
      },
      {"title": "Big Pimpin", "content": "Nigga, it's the big Southern rap..."},
      {"title": "Thoughts", "content": "For all we know, We might not see..."},
      {"title": "Idea", "content": "Create screens for note app before..."},
      {"title": "In My Mind", "content": "Sometimes I randomly like to..."},
      {
        "title": "List of groceries",
        "content": "-Tomatoes\n-Insecticide\n-Eggs..."
      },
      {"title": "Note 2", "content": "It is a process of reviewing..."},
      {"title": "Language cheat", "content": "-Spanish\n-Yoruba"},
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: notes.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return NoteCard(note: notes[index]);
        },
      ),
    );
  }
}
