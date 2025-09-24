import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:translator/translator.dart';

import '../../data/data_sources/fact_remote_data_source.dart';
import '../../data/data_sources/fact_remote_data_source_impl.dart';
import '../../data/repositories/fact_repository_impl.dart';
import '../../domain/repositories/fact_repository.dart';
import '../../domain/use_cases/get_random_fact_use_case.dart';
import '../../domain/use_cases/translator_use_case.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // HTTP Client
  getIt.registerLazySingleton<http.Client>(() => http.Client());

  // Translator
  getIt.registerLazySingleton<GoogleTranslator>(() => GoogleTranslator());

  // Datasource
  getIt.registerFactory<FactRemoteDataSource>(
        () => FactRemoteDataSourceImpl(getIt()),
  );

  // Repository
  getIt.registerFactory<FactRepository>(
        () => FactRepositoryImpl(getIt()),
  );

  // UseCase
  getIt.registerFactory<GetRandomFactUseCase>(
        () => GetRandomFactUseCase(getIt()),
  );
  getIt.registerFactory(() => TranslatorUseCase(getIt()));
}