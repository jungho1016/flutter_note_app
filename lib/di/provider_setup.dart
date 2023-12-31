// import 'package:flutter_note_app/data/data_source/notoe_db.dart';
// import 'package:flutter_note_app/data/repository/note_repository_impl.dart';
// import 'package:flutter_note_app/doamin/repository/note_repository.dart';
// import 'package:flutter_note_app/doamin/use_case/add_note_use_case.dart';
// import 'package:flutter_note_app/doamin/use_case/delate_note_use_case.dart';
// import 'package:flutter_note_app/doamin/use_case/get_note_use_case.dart';
// import 'package:flutter_note_app/doamin/use_case/get_notes_use_case.dart';
// import 'package:flutter_note_app/doamin/use_case/update_note_use_case.dart';
// import 'package:flutter_note_app/doamin/use_case/use_cases.dart';
// import 'package:flutter_note_app/presentation/notes/notes_view_model.dart';
// import 'package:provider/provider.dart';
// import 'package:provider/single_child_widget.dart';
// import 'package:sqflite/sqflite.dart';
//
// Future<List<SingleChildWidget>> getProviders() async {
//   Database database =
//       await openDatabase('notes_db', version: 1, onCreate: (db, version) async {
//     await db.execute(
//       'CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, color INTEGER, timestamp INTEGER)',
//     );
//   });
//
//   NoteDbHelper noteDbHelper = NoteDbHelper(database);
//   NoteRepository repository = NoteRepositoryImpl(noteDbHelper);
//   UseCases useCases = UseCases(
//     addNote: AddNoteUseCase(repository),
//     deleteNote: DeleteNoteUseCase(repository),
//     getNote: GetNoteUseCase(repository),
//     getNotes: GetNotesUseCase(repository),
//     updateNote: UpdateNoteUseCase(repository),
//   );
//   NotesViewModel notesViewModel = NotesViewModel(
//     useCases,
//   );
//
//   return [
//     ChangeNotifierProvider(create: (_) => notesViewModel),
//     Provider(create: (_) => repository)
//   ];
// }
