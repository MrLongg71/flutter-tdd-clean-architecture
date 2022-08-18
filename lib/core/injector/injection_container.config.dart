// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../feature/history/data/datasources/history_remote_datasource.dart'
    as _i7;
import '../../feature/history/data/repositories/history_repository_impl.dart'
    as _i8;
import '../../feature/history/domain/repositories/history_repository.dart'
    as _i5;
import '../../feature/history/domain/usecases/get_historys.dart' as _i4;
import '../../feature/history/presentation/blocs/history_bloc.dart' as _i6;
import '../network/client.dart' as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);

  gh.factory<_i3.AppClient>(() => _i3.AppClient());
  gh.factory<_i4.GetHistorys>(
      () => _i4.GetHistorys(get<_i5.HistoryRepository>()));
  gh.factory<_i6.HistoryBloc>(
      () => _i6.HistoryBloc(getHistorys: get<_i4.GetHistorys>()));
  gh.factory<_i7.HistoryRemoteDataSourceImpl>(
      () => _i7.HistoryRemoteDataSourceImpl(appClient: get<_i3.AppClient>()));
  gh.factory<_i8.HistoryRepositoryImpl>(() => _i8.HistoryRepositoryImpl(
      historyRemoteDataSource: get<_i7.HistoryRemoteDataSource>()));
  return get;
}
