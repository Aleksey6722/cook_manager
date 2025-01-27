import 'package:cook_manager/database/theme_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)

Future<void> configureDependencies() async {
  getIt.registerSingletonAsync<ThemeStorage>(()=>ThemeStorage.create());
  await getIt.allReady();
  getIt.init();
}
