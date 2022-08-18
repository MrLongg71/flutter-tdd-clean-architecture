import 'package:flutter_tdd_clean_architecture/core/network/client.dart';
import 'package:flutter_tdd_clean_architecture/feature/history/domain/repositories/history_repository.dart';
import 'package:flutter_tdd_clean_architecture/feature/history/domain/usecases/get_historys.dart';
import 'package:flutter_tdd_clean_architecture/feature/history/presentation/blocs/history_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../feature/history/data/repositories/history_repository_impl.dart';
import 'injection_container.config.dart';

final getIt = GetIt.instance;

// @InjectableInit()
// Future<void> configureDependencies() async => $initGetIt(getIt);
Future<void> configureDependencies() async {
  getIt.registerFactory(() => HistoryBloc(
    getHistorys: getIt()
  ));
  
  getIt.registerLazySingleton<GetHistorys>(() => GetHistorys(getIt()));
  getIt.registerLazySingleton<HistoryRepository>(() => HistoryRepositoryImpl(historyRemoteDataSource: getIt()));

  getIt.registerLazySingleton<AppClient>(() => AppClient());
  
}