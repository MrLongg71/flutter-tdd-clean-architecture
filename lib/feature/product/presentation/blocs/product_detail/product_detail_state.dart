import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/product.dart';

part 'product_detail_state.freezed.dart';

enum ProductDetailStatus {
  loading,
  success,
  failure,
}

@freezed
class ProductDetailState with _$ProductDetailState {
  const factory ProductDetailState({
    @Default(ProductDetailStatus.loading) ProductDetailStatus status,
    Product? item,
  }) = _ProductDetailState;
}
