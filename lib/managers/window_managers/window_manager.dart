import 'dart:ui' show Size;

import 'package:window_manager/window_manager.dart'
    show WindowOptions, windowManager;

import '/app_settings/app_settings.dart' show WindowSettings;

Future<void> configureWindow() async {
  await windowManager.ensureInitialized();

  var windowOptions = const WindowOptions(
    size: Size(WindowSettings.width, WindowSettings.height),
    center: WindowSettings.centered,
    title: WindowSettings.title,
  );

  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.setResizable(WindowSettings.resizable);
    await windowManager.setMaximizable(WindowSettings.maximizable);
    await windowManager.show();
  });
}
