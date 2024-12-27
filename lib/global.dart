import 'package:e_learning_klass/common/service/storage_service.dart';
import 'package:flutter/material.dart';

class Global {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static late StorageService storageService;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    storageService = await StorageService().init();
  }
}
