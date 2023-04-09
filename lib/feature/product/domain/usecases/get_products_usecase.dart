import 'package:flutter_tdd_clean_architecture/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

import '../entities/product.dart';
import '../repositories/product_repository.dart';

@injectable
class GetProductsUseCase implements UseCase<List<Product>, Params> {
  final ProductRepository productRepository;

  GetProductsUseCase(this.productRepository);

  @override
  Future<List<Product>> call(Params params) {
    return productRepository.getProducts(
      skip: params.skip,
      limit: params.limit,
    );
  }
}

class Params {
  final int limit;
  final int skip;

  Params(this.limit, this.skip);
}
