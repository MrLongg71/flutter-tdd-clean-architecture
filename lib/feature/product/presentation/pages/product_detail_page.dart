import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/injector/injection_container.dart';
import '../blocs/product_detail/product_detail_bloc.dart';
import '../blocs/product_detail/product_detail_event.dart';
import '../blocs/product_detail/product_detail_state.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final ProductDetailBloc _bloc = getIt<ProductDetailBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(OnGetProductDetailEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocProvider.value(
      value: _bloc,
      child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          return BlocBuilder<ProductDetailBloc, ProductDetailState>(
            builder: (context, state) {
              if (state.status == ProductDetailStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              }

              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        state.item?.thumbnail ?? '',
                      ),
                    ),
                    Text(state.item?.title ?? ''),
                    Text(state.item?.description ?? ''),
                    Text(state.item?.category ?? ''),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
