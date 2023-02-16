import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';

import '../../../data/provider/network_provider.dart';
import '../../services/database/database.dart';


final serviceLocator = GetIt.instance;
setupServiceLocator() {
  serviceLocator.registerSingletonAsync(() => SharedPreferences.getInstance());
  serviceLocator.registerLazySingleton(() => Logger());
  serviceLocator.registerLazySingleton(() => DatabaseService());
  serviceLocator.registerLazySingleton(() => NetworkProviderRest());
}
