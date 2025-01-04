import 'dart:convert';

import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/base/base_repository.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/util/state.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/dummy-item/repository/dummy_item_datasource.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/dummy/model/dummy_model.dart';
import 'package:logger/logger.dart';

class DummyItemRepository extends BaseRepository {
  final _logger = Logger();
  final DummyItemDatasource _datasource;
  DummyItemRepository(this._datasource);

  void loadDummyItem(
      {required ResponseHandler<DummyModel> response, String? id}) async {
    try {
      final String apiResponse = await _datasource.apiDummyItem(id);

      final Map<String, dynamic> json = jsonDecode(apiResponse);

      final DummyModel dummyData = DummyModel.fromJson(json);

      _logger.i(apiResponse);
      response.onSuccess(dummyData);
      response.onDone.call();
    } catch (e) {
      _logger.e(e);
      response.onFailed(e, e.toString());
      response.onDone.call();
    }
  }
}
