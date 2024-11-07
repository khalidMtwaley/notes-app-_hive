// import 'package:injectable/injectable.dart';
// import 'package:hive/hive.dart';
// import 'package:notesnotes/notes/data/models/notes_model.dart';

// abstract class NotesRepository {
//   Future<void> addNote(NoteModel note);
//   Future<List<NoteModel>> fetchAllNotes();
//   Future<void> deleteNote(NoteModel note);
//   Future<void> updateNote(NoteModel note);
// }

// @Singleton(as: NotesRepository)
// class NotesRepositoryImpl implements NotesRepository {

//   final Box<NoteModel> _notesBox;

//   NotesRepositoryImpl(this._notesBox);

//   @override
//   Future<void> addNote(NoteModel note) async {
//     await _notesBox.add(note); // Adds a note to the Hive box
//   }

//   @override
//   Future<List<NoteModel>> fetchAllNotes() async {
//     return _notesBox.values.toList(); // Fetches all notes from Hive
//   }

//   @override
//   Future<void> deleteNote(NoteModel note) async {
//     await note.delete();
//   }

//   @override
//   Future<void> updateNote(NoteModel note) async {
//     await note.save();
//   }
// }
import 'package:injectable/injectable.dart';
import 'package:hive/hive.dart';
import 'package:notesnotes/notes/data/models/notes_model.dart';

abstract class NotesRepository {
  Future<void> addNote(NoteModel note);
  Future<List<NoteModel>> fetchAllNotes();
  Future<void> deleteNote(NoteModel note);
  Future<void> updateNote(NoteModel note);
}

@LazySingleton(as: NotesRepository)
class NotesRepositoryImpl implements NotesRepository {
  final Box<NoteModel> _notesBox;

  // The box is injected via constructor
  NotesRepositoryImpl(this._notesBox);

  @override
  Future<void> addNote(NoteModel note) async {
    await _notesBox.add(note); // Adds a note to the Hive box
  }

  @override
  Future<List<NoteModel>> fetchAllNotes() async {
    return _notesBox.values.toList(); // Fetches all notes from Hive
  }

  @override
  Future<void> deleteNote(NoteModel note) async {
    await note.delete(); // Deletes a note
  }

  @override
  Future<void> updateNote(NoteModel note) async {
    await note.save(); // Updates a note
  }
}
