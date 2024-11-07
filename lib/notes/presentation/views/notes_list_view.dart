

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesnotes/notes/data/models/notes_model.dart';
import 'package:notesnotes/notes/presentation/cubit/notes_cubit_cubit.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListTile(
        leading: Column(
          children: [
            Text(
              note.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              note.subTitle,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        trailing: Column(
          children: [

           
            IconButton(
              icon: Icon(Icons.delete, color: Color(note.color),),
              onPressed: () {
                context.read<NotesCubit>().deleteNote(note);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NotesSection extends StatefulWidget {
  const NotesSection({super.key});

  @override
  State<NotesSection> createState() => _NotesSectionState();
}

class _NotesSectionState extends State<NotesSection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesCubitState>(
      builder: (context, state) {
        if (state is NotesLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is NotesError) {
          return Center(child: Text(state.message));
        } else if (state is NotesLoaded) {
          return ListView.builder(
            itemCount: state.notes.length,
            itemBuilder: (context, index) {
              final note = state.notes[index];
              return NotesItem(note: note);
            },
          );
        }
        return Center(
            child: Text(
          'Emoty notes',
          style: TextStyle(color: Colors.amber),
        ));
      },
    );
  }
}
