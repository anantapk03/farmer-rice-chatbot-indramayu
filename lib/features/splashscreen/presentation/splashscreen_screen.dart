import 'package:base_project_pelatihan_mobile_intermediate_polindra/features/splashscreen/presentation/splashscreen_controller.dart';
import 'package:flutter/material.dart';
// import 'spalashscreen';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _controller = SplashScreenController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff317C58),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo_app_green_with_text.png',
              width: MediaQuery.sizeOf(context).width / 2,
              height: MediaQuery.sizeOf(context).height / 3,
            ),
          ],
        ),
      ),
    );
  }
}
