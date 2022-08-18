import 'package:flutter_tdd_clean_architecture/feature/history/data/models/history_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/client.dart';
import '../../domain/entities/history.dart';

abstract class HistoryRemoteDataSource {
  Future<List<History>> getHistorys();
}

@injectable
class HistoryRemoteDataSourceImpl extends HistoryRemoteDataSource {
  final AppClient? appClient;
  HistoryRemoteDataSourceImpl({this.appClient});
  @override
  Future<List<History>> getHistorys() async {
    final res = await appClient?.get(ApiConstants.history);

    final data = res?.data as List;
    return data.map((e) => HistoryModel.fromJson(e)).toList();
  }
}