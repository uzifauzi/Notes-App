import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note});

  final Map<String, String> note;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.deepPurple[100],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            note["title"]!,
            style: GoogleFonts.nunitoSans(
                fontWeight: FontWeight.w700, fontSize: 18),
          )
        ],
      ),
    );
  }
}
