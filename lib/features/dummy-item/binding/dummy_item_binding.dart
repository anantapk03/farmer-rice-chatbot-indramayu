import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/util/network.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/dummy-item/presentation/dummy_item_controller.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/dummy-item/repository/dummy_item_datasource.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/dummy-item/repository/dummy_item_repository.dart';
import 'package:get/get.dart';

class DummyItemBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => DummyItemDatasource(Network.dioClient()));
    Get.lazyPut(() => DummyItemRepository(Get.find()));
    Get.lazyPut(() => DummyItemController(Get.find()));
  }
}
