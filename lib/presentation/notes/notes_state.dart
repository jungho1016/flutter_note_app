import 'package:flutter_note_app/doamin/model/note.dart';
import 'package:flutter_note_app/doamin/util/note_order.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'notes_state.freezed.dart';

@freezed
class NotesState with _$NotesState {
  const factory NotesState(
      {required List<Note> notes,
      required NoteOrder noteOrder,
      required bool isOrderSectionVisible}) = _NotesState;
}
