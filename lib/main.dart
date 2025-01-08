import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/config/app_const.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/config/app_route.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/config/app_style.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/sevices/app_service.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/components/util/storage_util.dart';
import 'package:base_project_pelatihan_mobile_intermediate_polindra/notification_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final NotificationService notificationService = NotificationService();
  await notificationService.initNotification();
  await _dependencyInjection();
  await _notificationConfiguration();
  runApp(const MyApp());
}

Future<void> _notificationConfiguration() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    Logger().i("Izin Notifikasi diberikan");
  } else {
    Logger().i('Izin notifikasi ditolak');
  }
  messaging.getToken().then((String? token) {
    if (token != null) {
      Logger().i('FCM Token: $token');
    }
  });
}

/// ====== DI Section =====
/// Add dependency here when you need to use/available for all feature
/// ====== end =======
Future _dependencyInjection() async {
  final storage = StorageUtil(SecureStorage());
  Get.lazyPut(() => storage, fenix: true);
  Get.put(AppService(storage));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConst.appName,
      theme: ThemeData(
        primarySwatch: AppStyle.appTheme,
      ),
      initialRoute: AppRoute.defaultRoute,
      unknownRoute: GetPage(
          name: AppRoute.notFound, page: () => const UnknownRoutePage()),
      getPages: AppRoute.pages,
    );
  }
}

class UnknownRoutePage extends StatelessWidget {
  const UnknownRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('No route defined for this page')),
    );
  }
}
