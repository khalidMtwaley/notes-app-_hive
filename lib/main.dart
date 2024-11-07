

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notesnotes/core/di/service_locator.dart'; // Your DI setup file
import 'package:notesnotes/notes/data/models/notes_model.dart';
import 'package:notesnotes/notes/presentation/cubit/notes_cubit_cubit.dart';
import 'package:notesnotes/notes/presentation/views/notes_view.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance; // Initialize GetIt

void main() async {
  
  // Initialize Flutter widgets and bindings
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Register the NoteModel Hive Adapter
  Hive.registerAdapter(NoteModelAdapter());

  // Open the Hive box for NoteModel
  final notesBox = await Hive.openBox<NoteModel>('notes_box');

  // Manually register the Hive box in GetIt before configuring other dependencies
  sl.registerSingleton<Box<NoteModel>>(notesBox);

  // Now configure the rest of your dependencies
  await configureDependencies();

  // Start the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider<NotesCubit>(
          create: (context) => sl.get<NotesCubit>()..fetchNotes(),
        ),
      ],
      child: MaterialApp(
        home: NotesView(),
      ),
    );
  }
}
