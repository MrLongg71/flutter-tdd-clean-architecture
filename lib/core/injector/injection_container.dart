import 'package:flutter_tdd_clean_architecture/core/network/client.dart';
import 'package:get_it/get_it.dart';

import '../../feature/product/data/datasources/product_remote_datasource.dart';
import '../../feature/product/data/repositories/product_repository_impl.dart';
import '../../feature/product/domain/usecases/get_products_usecase.dart';
import '../../feature/product/presentation/blocs/product_bloc.dart';

final getIt = GetIt.instance;

// @InjectableInit()
// Future<void> configureDependencies() async => $initGetIt(getIt);
Future<void> configureDependencies() async {
  getIt.registerLazySingleton<AppClient>(() => AppClient());

  getIt.registerLazySingleton<ProductRemoteDataSourceImpl>(
      () => ProductRemoteDataSourceImpl(
            appClient: getIt.get<AppClient>(),
          ));

  getIt
      .registerLazySingleton<ProductRepositoryImpl>(() => ProductRepositoryImpl(
            historyRemoteDataSource: getIt.get<ProductRemoteDataSourceImpl>(),
          ));

  getIt.registerLazySingleton<GetProductsUseCase>(() => GetProductsUseCase(
        getIt.get<ProductRepositoryImpl>(),
      ));

  getIt.registerFactory(() => ProductBloc(
        getProductsUseCase: getIt.get<GetProductsUseCase>(),
      ));
}
