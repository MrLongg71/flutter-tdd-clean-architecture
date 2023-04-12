import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tdd_clean_architecture/feature/product/domain/usecases/get_product_detail_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/product.dart';
import 'product_detail_event.dart';
import 'product_detail_state.dart';

@injectable
class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  GetProductDetailUseCase? getProductDetailUseCase;

  ProductDetailBloc({this.getProductDetailUseCase})
      : super(const ProductDetailState()) {
    on(_onGetProductEvent);
  }

  void _onGetProductEvent(
    OnGetProductDetailEvent event,
    Emitter<ProductDetailState> emit,
  ) async {
    emit(
      state.copyWith(
        status: ProductDetailStatus.loading,
      ),
    );

    try {
      final Product? item =
          await getProductDetailUseCase?.call(Params(id: event.id));

      emit(state.copyWith(
        status: ProductDetailStatus.success,
        item: item,
      ));
    } catch (e) {
      emit(
        state.copyWith(
          status: ProductDetailStatus.failure,
        ),
      );
    }
  }
}
