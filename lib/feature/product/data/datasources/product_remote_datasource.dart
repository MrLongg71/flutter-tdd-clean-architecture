import 'package:injectable/injectable.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/client.dart';
import '../../domain/entities/product.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<Product>> getProducts({
    int skip = 0,
    int limit = 10,
  });

  Future<Product> getProduct({required int id});
}

@Injectable(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final AppClient? appClient;

  ProductRemoteDataSourceImpl({required this.appClient});

  @override
  Future<List<Product>> getProducts({
    int skip = 0,
    int limit = 10,
  }) async {
    final res = await appClient?.get(
      ApiConstants.products,
      queryParams: {
        'skip': skip,
        'limit': limit,
      },
    );

    final data = res?.data['products'] as List;
    return data.map((e) => ProductModel.fromJson(e)).toList();
  }

  @override
  Future<Product> getProduct({required int id}) async {
    final res = await appClient?.get('${ApiConstants.products}/$id');
    return ProductModel.fromJson(res?.data);
  }
}
