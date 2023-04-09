import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/product.dart';

part 'product_state.freezed.dart';

enum ProductStatus {
  loading,
  success,
  failure,
}

@freezed
class ProductState with _$ProductState {
  const factory ProductState({
    @Default(ProductStatus.loading) ProductStatus status,
    @Default([]) List<Product> items,
  }) = _ProductState;
}
