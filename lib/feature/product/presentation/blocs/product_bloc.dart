import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/product.dart';
import '../../domain/usecases/get_products_usecase.dart';
import 'product_event.dart';
import 'product_state.dart';

@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  GetProductsUseCase? getProductsUseCase;

  ProductBloc({this.getProductsUseCase})
      : super(
          const ProductState(),
        ) {
    on(_onGetCompanyInformation);
  }

  void _onGetCompanyInformation(
      OnGetProductEvent event, Emitter<ProductState> emit) async {
    emit(
      state.copyWith(
        status: ProductStatus.loading,
      ),
    );

    try {
      final List<Product>? items = await getProductsUseCase?.call(Params(
        10,
        state.items.length,
      ));

      emit(state.copyWith(
        status: ProductStatus.success,
        items: items ?? [],
      ));
    } catch (e) {
      emit(
        state.copyWith(
          status: ProductStatus.failure,
        ),
      );
    }
  }
}
