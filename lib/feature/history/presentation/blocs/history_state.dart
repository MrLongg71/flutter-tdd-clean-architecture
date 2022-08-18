part of 'history_bloc.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();
}

class HistoryInitial extends HistoryState {
  @override
  List<Object> get props => [];
}

class HistoryLoadingState extends HistoryState {
  @override
  List<Object> get props => [];
}

class HistorySuccessState extends HistoryState {
  final List<History> historys;

  const HistorySuccessState({required this.historys});

  @override
  List<Object> get props => [historys];
}

class HistoryFailedState extends HistoryState {
  final String? errMsg;

  const HistoryFailedState({this.errMsg});

  @override
  List<Object> get props => [];
}
