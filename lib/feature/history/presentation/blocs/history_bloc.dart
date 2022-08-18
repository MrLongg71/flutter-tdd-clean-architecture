import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tdd_clean_architecture/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/history.dart';
import '../../domain/usecases/get_historys.dart';
part 'history_event.dart';

part 'history_state.dart';

@injectable

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  GetHistorys? getHistorys;

  HistoryBloc({this.getHistorys}) : super(HistoryInitial()) {
    on<HistoryEvent>((event, emit) async {
      if (event is HistoryFetchEvent) {
        try {
          emit(HistoryLoadingState());
          final List<History>? historys = await getHistorys?.call(NoParams());
          emit(HistorySuccessState(historys: historys ?? []));
        } catch (e) {
          emit(HistoryFailedState(errMsg: e.toString()));
        } finally {
          emit(const HistoryFailedState(errMsg: 'error'));
        }
      }
    });
  }
}
