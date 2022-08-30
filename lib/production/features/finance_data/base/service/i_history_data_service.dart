import 'package:finance_app/production/features/finance_data/base/i_data_service.dart';
import 'package:finance_app/production/features/finance_data/base/model/i_history_data.dart';
import 'package:finance_app/production/features/finance_data/base/model/info_model.dart';

abstract class IHistoryDataService extends IDataService {
  IHistoryDataService({required super.manager});

  Future<List<R>>
      getLast2HoursGraph<T extends InfoModel, R extends IHistoryData<R>>(
          T model, R parserModel);
  Future<List<R>> getDailyGraph<T extends InfoModel, R extends IHistoryData<R>>(
      T model, R parserModel);
  Future<List<R>>
      getGraphBetweenDate<T extends InfoModel, R extends IHistoryData<R>>(
          T model, R parserModel, DateTime startDate, DateTime endDate);
}
