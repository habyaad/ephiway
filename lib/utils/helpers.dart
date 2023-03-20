import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final getIt = GetIt.instance;

    Future<void> setupLocator() async {
      getIt.registerLazySingleton(() => Logger());

// Alternatively you could write it if you don't like global variables
    // GetIt.I.registerSingleton<AppModel>(AppModel());
}
