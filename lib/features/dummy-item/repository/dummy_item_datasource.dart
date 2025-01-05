import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/base/base_dio_data_source.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/ext/dio_ext.dart';

class DummyItemDatasource extends BaseDioDataSource {
  DummyItemDatasource(super._client);

  Future<String> apiDummyItem(String? id) async {
    String path = 'lookup.php';
    Map<String, dynamic> queryParameters = {'i': int.parse(id ?? "")};

    return get<String>(path, queryParameters: queryParameters).load();
  }
}
