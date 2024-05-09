// ignore_for_file: deprecated_member_use

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_flutter_level/constants.dart';

//import 'package:permission_handler/permission_handler.dart';

import 'app_router.gr.dart';
import 'globals.dart';
import 'models/preferences.dart';

void main() async {
  final appRouter = AppRouter();
  WidgetsFlutterBinding.ensureInitialized();
  global.preferences = await Preferences().read();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => runApp(
      DevicePreview(
        enabled: kDebugMode,
        builder: (context) => MaterialApp.router(
          title: 'Test Flutter Level',
          themeAnimationDuration: Duration.zero,
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
          useInheritedMediaQuery: true,
          theme: ThemeData.light().copyWith(
            useMaterial3: true,
            scaffoldBackgroundColor: Colors.white,
            primaryColor: COLOR_PRIMARY,
            appBarTheme: const AppBarTheme().copyWith(color: COLOR_PRIMARY),
          ),
        ),
      ),
    ),
  );
}
