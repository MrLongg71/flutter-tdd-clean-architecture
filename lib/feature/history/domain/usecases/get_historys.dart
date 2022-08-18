import 'package:flutter_tdd_clean_architecture/core/usecases/usecase.dart';
import 'package:flutter_tdd_clean_architecture/feature/history/domain/repositories/history_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/history.dart';

@injectable
class GetHistorys implements UseCase<List<History>, NoParams> {
  final HistoryRepository historyRepository;

  GetHistorys(this.historyRepository);

  @override
  Future<List<History>> call(NoParams params) {
    return historyRepository.getHistorys();
  }
}
