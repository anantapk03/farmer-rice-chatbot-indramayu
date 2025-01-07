import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/base/base_dio_data_source.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/ext/dio_ext.dart';

class ListClubDataSource extends BaseDioDataSource {
  ListClubDataSource(super.client);

  Future<String> apiListClub() async {
    String path = 'search_all_teams.php';
    Map<String, dynamic> queryParameters = {'l': 'English Premier League'};

    return get<String>(path, queryParameters: queryParameters).load();
  }
}
