import 'package:flutter_note_app/data/data_source/notoe_db.dart';
import 'package:flutter_note_app/doamin/model/note.dart';
import 'package:flutter_note_app/doamin/repository/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteDb db;
  NoteRepositoryImpl(this.db);

  @override
  Future<void> deleteNote(Note note) {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<Note> getNoteById(int id) {
    // TODO: implement getNoteById
    throw UnimplementedError();
  }

  @override
  Future<List<Note>> getNotes() {
    // TODO: implement getNotes
    throw UnimplementedError();
  }

  @override
  Future<void> insertNote(Note note) {
    // TODO: implement insertNote
    throw UnimplementedError();
  }

  @override
  Future<void> updateNote(Note note) {
    // TODO: implement updateNote
    throw UnimplementedError();
  }
}
