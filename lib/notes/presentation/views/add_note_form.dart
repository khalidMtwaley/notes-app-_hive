// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:notesnotes/notes/data/models/notes_model.dart';
// import 'package:notesnotes/notes/presentation/cubit/notes_cubit_cubit.dart';

// class AddNoteForm extends StatefulWidget {
//   @override
//   _AddNoteFormState createState() => _AddNoteFormState();
// }

// class _AddNoteFormState extends State<AddNoteForm> {
//   final _formKey = GlobalKey<FormState>();
//   String? title;
//   String? subTitle;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//       child: Form(
//         key: _formKey,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Title'),
//               onSaved: (value) {
//                 title = value;
//               },
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Subtitle'),
//               onSaved: (value) {
//                 subTitle = value;
//               },
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   _formKey.currentState!.save();
//                   final note = NoteModel(
//                     title: title!,
//                     subTitle: subTitle!,
//                     date: DateFormat('dd-MM-yyyy').format(DateTime.now()),
//                     color: Colors.blue.value,
//                   );
//                   context.read<NotesCubit>().addNote(note);
//                   Navigator.of(context).pop();
//                 }
//               },
//               child: Text('Add Note'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notesnotes/core/utils/widgets/custom_button.dart';
import 'package:notesnotes/core/utils/widgets/custom_text_form_field.dart';
import 'package:notesnotes/notes/data/models/notes_model.dart';
import 'package:notesnotes/notes/presentation/cubit/notes_cubit_cubit.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subTitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: 
        Column(
          children: [
            TextFormField(
 decoration: InputDecoration(
                hintText: "title"
              ),              controller: _titleController,
            
              
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                hintText: "subtitle"
              ),
              
              controller: _subTitleController,
            
              
            ),
            ElevatedButton(
              
            onPressed: (){
                if(_formKey.currentState!.validate()){
                  context.read<NotesCubit>().addNote(NoteModel(title: _titleController.text, subTitle: _subTitleController.text,
                   date:  DateFormat('dd-MM-yyyy').format(DateTime.now()), color: Colors.red.value));
                  Navigator.of(context).pop();
                }
              },
            
             child: Text("data"))
        
          ],
      
      
      
      
        ),
      ),
    );
  }
}



  