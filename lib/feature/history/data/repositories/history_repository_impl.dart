import 'package:flutter_tdd_clean_architecture/feature/history/data/datasources/history_remote_datasource.dart';
import 'package:flutter_tdd_clean_architecture/feature/history/domain/entities/history.dart';
import 'package:flutter_tdd_clean_architecture/feature/history/domain/repositories/history_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class HistoryRepositoryImpl extends HistoryRepository {
  final HistoryRemoteDataSource historyRemoteDataSource;

  HistoryRepositoryImpl({required this.historyRemoteDataSource});

  @override
  Future<List<History>> getHistorys() {
    return historyRemoteDataSource.getHistorys();
  }
}
