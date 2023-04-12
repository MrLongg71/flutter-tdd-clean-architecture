import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_detail_event.freezed.dart';

@freezed
class ProductDetailEvent with _$ProductDetailEvent {
  const factory ProductDetailEvent.onStarted({required int id}) = OnGetProductDetailEvent;
}