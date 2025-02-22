import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<Dio>(() => Dio());
}
