import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:notesnotes/notes/data/models/notes_model.dart';
import 'package:notesnotes/notes/data/repo.dart';

part 'notes_cubit_state.dart';

@injectable
class NotesCubit extends Cubit<NotesCubitState> {
  NotesCubit(this._notesRepository) : super(NotesCubitInitial());
  final NotesRepository _notesRepository;
  void fetchNotes() async {
    emit(NotesLoading());
    try {
      final notes = await _notesRepository.fetchAllNotes();
      emit(NotesLoaded(notes));
    } catch (e) {
      emit(NotesError(e.toString()));
    }
  }

  void addNote(NoteModel note) async {
    try {
      await _notesRepository.addNote(note);
      fetchNotes();///
    } catch (e) {
      emit(NotesError(e.toString()));
    }
  }

  void deleteNote(NoteModel note) async {
    try {
      await _notesRepository.deleteNote(note);
      fetchNotes();///
    } catch (e) {
      emit(NotesError(e.toString()));
    }
  }

  void updateNote(NoteModel note) async {
    try {
      await _notesRepository.updateNote(note);
      fetchNotes();
    } catch (e) {
      emit(NotesError(e.toString()));
    }
  }
}
