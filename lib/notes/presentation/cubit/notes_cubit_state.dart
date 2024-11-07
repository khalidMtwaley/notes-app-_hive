part of 'notes_cubit_cubit.dart';

@immutable
sealed class NotesCubitState {}

final class NotesCubitInitial extends NotesCubitState {}
class NotesLoading extends NotesCubitState {}
class NotesLoaded extends NotesCubitState {
  final List<NoteModel> notes;
  NotesLoaded(this.notes);
}
class NotesError extends NotesCubitState {
  final String message;
  NotesError(this.message);
}
