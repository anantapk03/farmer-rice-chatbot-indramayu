import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/util/state.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/dummy-item/presentation/dummy_item_state.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/dummy-item/repository/dummy_item_repository.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class DummyItemController extends GetxController {
  final DummyItemRepository _repository;
  DummyItemController(this._repository);

  final _logger = Logger();
  DummyItemState state = DummyItemStateIdle();
  final RxString idDummyItem = "".obs;

  @override
  void onInit() {
    super.onInit();
    idDummyItem.value = Get.arguments ?? "";
    _logger.i("Id Meal : ${idDummyItem.value}");
    if (idDummyItem.value.isNotEmpty) {
      _loadDummyItem();
    }
  }

  void _loadDummyItem() {
    state = DummyItemStateLoading();
    update();
    if (idDummyItem.value.isNotEmpty) {
      _repository.loadDummyItem(
          response: ResponseHandler(onSuccess: (dummyModel) {
            state = DummyItemStateSuccess(dummyModel);
          }, onFailed: (e, message) {
            state = DummyItemStateError();
            _logger.e(e);
          }, onDone: () {
            update();
          }),
          id: idDummyItem.value);
    } else {
      state = DummyItemStateError();
      update();
    }
  }
}
