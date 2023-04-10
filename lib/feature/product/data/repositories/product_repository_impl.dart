import '../datasources/product_remote_datasource.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDataSource historyRemoteDataSource;

  ProductRepositoryImpl({required this.historyRemoteDataSource});

  @override
  Future<List<Product>> getProducts({
    int skip = 0,
    int limit = 10,
  }) {
    return historyRemoteDataSource.getProducts(
      skip: 0,
      limit: 10,
    );
  }
}
