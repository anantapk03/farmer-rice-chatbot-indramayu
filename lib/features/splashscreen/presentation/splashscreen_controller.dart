import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/config/app_route.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class SplashScreenController extends GetxController {
  final _logger = Logger();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _delay();
  }

  void _delay() {
    _logger.i("SPLASH SCREN START!");
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Get.offNamed(AppRoute.chatRoomPage));
  }
}
