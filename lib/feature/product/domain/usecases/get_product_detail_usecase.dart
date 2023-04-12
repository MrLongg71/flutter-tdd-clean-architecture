import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

@Injectable()
class GetProductDetailUseCase implements UseCase<Product, Params> {
  final ProductRepository? productRepository;

  GetProductDetailUseCase({required this.productRepository});

  @override
  Future<Product> call(Params params) {
    return productRepository!.getProduct(id: params.id!);
  }
}

class Params extends Equatable {
  final int? id;

  const Params({required this.id});

  @override
  List<Object?> get props => [id];
}
