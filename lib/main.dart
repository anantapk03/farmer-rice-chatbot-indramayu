import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/config/app_const.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/config/app_route.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/config/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConst.appName,
      theme: ThemeData(
        primarySwatch: AppStyle.appTheme,
      ),
      initialRoute: AppRoute.defaultRoute,
      getPages: AppRoute.pages,
    );
  }
}
