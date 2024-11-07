// import 'package:get_it/get_it.dart';
// import 'package:injectable/injectable.dart';
// import 'package:notesnotes/core/di/service_locator.config.dart';

// final sl = GetIt.instance;

// @InjectableInit()
// Future<void> configureDependencies() async => sl.init();
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:notesnotes/core/di/service_locator.config.dart'; // Auto-generated DI config

final sl = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  await sl.init(); // This initializes the rest of the dependencies
}
