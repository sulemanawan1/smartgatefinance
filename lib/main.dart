import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';

import 'Routes/routes_management.dart';
import 'Routes/set_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(800, 600),
    minimumSize: Size(800, 600),
    fullScreen: false,
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,

    // titleBarStyle: TitleBarStyle.,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
    windowManager.popUpWindowMenu();
  });
  runApp(const MyApp());
}

class MyApp extends StatefulWidget with WindowListener {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WindowListener {
  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
    _init();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  void _init() async {
    await windowManager.setPreventClose(true);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(1440, 1024),
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: splash,
            getPages: RouteManagement.getPages(),
            // home: GenerateHouseBill(),
          );
        });
  }

  @override
  void onWindowClose() async {
    bool _isPreventClose = await windowManager.isPreventClose();

    if (_isPreventClose) {
      Get.defaultDialog(
          middleText: 'Are you sure you want to close this window?',
          actions: [
            ActionChip(
              label: const Text("Ok"),
              onPressed: () async {
                Get.back();
                await windowManager.destroy();
              },
            ),
            ActionChip(
              label: const Text("Cancel"),
              onPressed: () {
                Get.back();
              },
            ),
          ]);
    }
  }
}
