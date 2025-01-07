import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/util/network.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/presentation/list_club_controller.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/repository/list_club_datsource.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/list_club/repository/list_club_repository.dart';
import 'package:get/get.dart';

class ListClubBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ListClubDataSource(Network.dioClient()));
    Get.lazyPut(() => ListClubRepository(Get.find()));
    Get.lazyPut(() => ListClubController(Get.find()));
  }
}
