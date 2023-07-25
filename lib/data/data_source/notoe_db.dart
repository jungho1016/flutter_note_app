import 'package:flutter_note_app/doamin/model/note.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

// SQL helper ??
@singleton
class NoteDbHelper {
  Database db;

  NoteDbHelper(this.db) {
    _createNoteTable(); // Call the function to create the table
  }

  Future<void> _createNoteTable() async {
    await db.execute('''
    CREATE TABLE IF NOT EXISTS note(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT,
      content TEXT,
      color INTEGER,
      timestamp INTEGER
    )
  ''');
  }

  Future<Note?> getNoteById(int id) async {
    // SELECT * FROM note WHERE id = 1
    final List<Map<String, dynamic>> maps = await db.query(
      'note',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Note.fromJson(maps.first); // 하나만 들어있다???
    }
    return null;
  }

  Future<List<Note>> getNotes() async {
    final maps = await db.query('note'); // 조건 없이 쓰면 다가져오겠다?, json 덩어리?
    return maps.map((e) => Note.fromJson(e)).toList();
  }

  Future<void> insertNote(Note note) async {
    await db.insert('note', note.toJson()); // 추가된 객체의 id를 return? 값 활용
  }

  Future<void> updateNote(Note note) async {
    await db.update(
      'note',
      note.toJson(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<void> deleteNote(Note note) async {
    await db.delete(
      'note',
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }
}
