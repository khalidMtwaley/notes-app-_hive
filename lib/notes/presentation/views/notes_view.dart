// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:notesnotes/notes/presentation/cubit/notes_cubit_cubit.dart';
// import 'package:notesnotes/notes/presentation/views/add_note_form.dart';
// import 'package:notesnotes/notes/presentation/views/notes_list_view.dart';


// class NotesView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Notes')),
//       body: BlocBuilder<NotesCubit, NotesCubitState>(
//         builder: (context, state) {
//           if (state is NotesLoading) {
//             return Center(child: CircularProgressIndicator());
//           } else if (state is NotesLoaded) {
//             return NotesListView(notes: state.notes);
//           } else if (state is NotesError) {
//             return Center(child: Text(state.message));
//           }
//           return Center(child: Text('No notes available'));
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showModalBottomSheet(
//             context: context,
//             builder: (_) => AddNoteForm(),
//             isScrollControlled: true,
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:notesnotes/notes/presentation/views/add_note_form.dart';
import 'package:notesnotes/notes/presentation/views/notes_list_view.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            
            context: context,
            builder: (_) => const AddNoteForm(),
            isScrollControlled: true,
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(title: Text('Notes')),
      body: const Column(
        children: [
          Expanded(child:NotesSection() ),

        ],
        
      ),
    );
  }
}