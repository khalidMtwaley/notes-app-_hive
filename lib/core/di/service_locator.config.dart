// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;
import 'package:notesnotes/notes/data/models/notes_model.dart' as _i151;
import 'package:notesnotes/notes/data/repo.dart' as _i353;
import 'package:notesnotes/notes/presentation/cubit/notes_cubit_cubit.dart'
    as _i128;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i353.NotesRepository>(
        () => _i353.NotesRepositoryImpl(gh<_i979.Box<_i151.NoteModel>>()));
    gh.factory<_i128.NotesCubit>(
        () => _i128.NotesCubit(gh<_i353.NotesRepository>()));
    return this;
  }
}
