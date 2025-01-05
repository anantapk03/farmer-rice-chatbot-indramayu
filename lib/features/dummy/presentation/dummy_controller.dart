import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/util/state.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/dummy/presentation/dummy_state.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/dummy/repository/dummy_repository.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class DummyController extends GetxController {
  final DummyRepository _repository;
  DummyState dummyState = DummyStateIdle();
  final Logger _logger = Logger();
  DummyController(this._repository);

  // Showmore or Showless

  RxBool isShowMore = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _loadAllDummy();
  }

  void _loadAllDummy() {
    dummyState = DummyStateLoading();
    update();
    _repository.loadDummy(
        response: ResponseHandler(onSuccess: (listDummy) {
      dummyState = DummyStateSuccess(listDummy);
    }, onFailed: (e, message) {
      _logger.e(e);
      dummyState = DummyStateError();
    }, onDone: () {
      update();
    }));
  }

  void isShowMoreData(bool value) {
    if (isShowMore.value) {
      isShowMore.value = false;
    } else {
      isShowMore.value = true;
    }
  }
}
