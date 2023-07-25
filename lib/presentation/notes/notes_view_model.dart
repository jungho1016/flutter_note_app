import 'package:flutter/material.dart';
import 'package:flutter_note_app/doamin/model/note.dart';
import 'package:flutter_note_app/doamin/repository/title_repository.dart';
import 'package:flutter_note_app/doamin/use_case/use_cases.dart';
import 'package:flutter_note_app/doamin/util/note_order.dart';
import 'package:flutter_note_app/doamin/util/order_type.dart';
import 'package:flutter_note_app/presentation/notes/notes_event.dart';
import 'package:flutter_note_app/presentation/notes/notes_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class NotesViewModel with ChangeNotifier {
  final UseCases useCases;
  final TitleRepository titleRepository;

  NotesState _state = const NotesState(
      notes: [],
      noteOrder: NoteOrder.date(OrderType.descending()),
      isOrderSectionVisible: true);
  NotesState get state => _state;

  Note? _recentlyDeletedNote;

  NotesViewModel(this.useCases, this.titleRepository) {
    _loadNotes();
  }

  void onEvent(NotesEvent event) {
    event.when(
      loadNotes: _loadNotes,
      deleteNote: _deleteNote,
      restoreNote: _restoreNote,
      changeOrder: (NoteOrder noteOrder) {
        _state = state.copyWith(noteOrder: noteOrder);
        _loadNotes();
      },
      toggleOrderSection: () {
        _state =
            state.copyWith(isOrderSectionVisible: !state.isOrderSectionVisible);
        notifyListeners();
      },
    );
  }

  Future<void> _loadNotes() async {
    List<Note> notes = await useCases.getNotes(state.noteOrder);
    _state = state.copyWith(
      notes: notes,
    );
    notifyListeners();
  }

  Future<void> _deleteNote(Note note) async {
    await useCases.deleteNote(note);

    _recentlyDeletedNote = note;

    await _loadNotes();
  }

  Future<void> _restoreNote() async {
    if (_recentlyDeletedNote != null) {
      await useCases.addNote(_recentlyDeletedNote!);
      _recentlyDeletedNote = null;

      _loadNotes();
    }
  }
}

// 컴파일러 입장에서 인간이 놓칠 수 있는 입장으로 작성하면 안전
// 모든 상황에 대한 이벤트를 이벤트 클래스로 정의
