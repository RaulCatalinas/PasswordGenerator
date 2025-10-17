import 'package:flutter/material.dart'
    show
        BuildContext,
        MaterialApp,
        State,
        StatefulWidget,
        StatelessWidget,
        ThemeData,
        Widget,
        WidgetsFlutterBinding,
        runApp,
        AlignmentGeometry;
import 'package:toastification/toastification.dart'
    show ToastificationWrapper, ToastificationConfig;

import 'handlers/close_window.dart' show handleCloseWindow;
import 'managers/ui_managers/main_ui.dart' show MainUI;
import 'managers/window_managers/window_manager.dart' show configureWindow;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureWindow();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      config: ToastificationConfig(alignment: AlignmentGeometry.topRight),
      child: MaterialApp(
        title: 'PasswordGenerator',
        theme: ThemeData(fontFamily: 'Inter'),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    handleCloseWindow(context);
  }

  @override
  Widget build(BuildContext context) {
    return MainUI();
  }
}
