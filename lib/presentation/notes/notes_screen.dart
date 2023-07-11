import 'package:flutter/material.dart';
import 'package:flutter_note_app/doamin/model/note.dart';
import 'package:flutter_note_app/presentation/notes/components/note_item.dart';
import 'package:flutter_note_app/ui/colors.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Your note',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.sort))],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            NoteItem(
              note: Note(
                  title:
                      'title 1 asdfasdfasdklfjaklsdjflkadsdasfasdfasdfasdfasdfdasfdasdfasdfasdfjklf',
                  content: 'content 1',
                  color: wisteria.value,
                  timestamp: 1),
            ),
            NoteItem(
              note: Note(
                  title: 'title 2',
                  content: 'content 1',
                  color: wisteria.value,
                  timestamp: 1),
            ),
          ],
        ),
      ),
    );
  }
}