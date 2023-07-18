import 'package:flutter_note_app/doamin/model/note.dart';
import 'package:flutter_note_app/doamin/repository/note_repository.dart';

class GetNotesUseCase {
  // 모든 method의 call을 재정의
  final NoteRepository repository;

  GetNotesUseCase(this.repository);

  Future<List<Note>> call() async {
    List<Note> notes = await repository.getNotes();
    notes.sort((a, b) => -a.timestamp.compareTo(b.timestamp));
    return notes;
  }
}
