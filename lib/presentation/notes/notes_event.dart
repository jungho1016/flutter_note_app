import 'package:flutter_note_app/doamin/model/note.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'notes_event.freezed.dart';

@freezed
sealed class NotesEvent with _$NotesEvent {
  const factory NotesEvent.loadNotes() = LoadNotes;
  const factory NotesEvent.deleteNote(Note note) = DeleteNote;
  const factory NotesEvent.restoreNote() = RestoreNote;
}
