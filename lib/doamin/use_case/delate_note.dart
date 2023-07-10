import 'package:flutter_note_app/doamin/repository/note_repository.dart';

import '../model/note.dart';

class DeleteNote {
  final NoteRepository repository;

  DeleteNote(this.repository);

  Future<void> call(Note note) async {
    await repository.deleteNote(note);
  }
}
