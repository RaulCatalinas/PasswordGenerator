import 'package:flutter/material.dart'
    show
        BuildContext,
        State,
        StatefulWidget,
        Widget,
        WidgetsFlutterBinding,
        runApp,
        AlignmentGeometry,
        WidgetsBindingObserver,
        Locale;
import 'package:flutter_themed/flutter_themed.dart'
    show Themed, ThemeStorageAdapter;
import 'package:flutter_themed/themed_app.dart' show ThemedApp;
import 'package:logkeeper/logkeeper.dart' show LogKeeper;
import 'package:toastification/toastification.dart'
    show ToastificationWrapper, ToastificationConfig;

import '/l10n/app_localizations.dart' show AppLocalizations;
import '/managers/user_preferences_managers/lanaguage_manager.dart'
    show LanguageManager;
import 'enums/user_preferences.dart' show UserPreferencesKeys;
import 'handlers/close_window.dart' show handleCloseWindow;
import 'managers/ui_managers/main_ui.dart' show MainUI;
import 'managers/user_preferences_managers/user_preferences_manager.dart'
    show UserPreferencesManager;
import 'managers/window_managers/window_manager.dart' show configureWindow;

class ThemeStorage implements ThemeStorageAdapter {
  @override
  Future<String?> loadTheme() async {
    return UserPreferencesManager.getPreference(UserPreferencesKeys.theme);
  }

  @override
  Future<void> saveTheme(String themeName) async {
    UserPreferencesManager.setPreference(UserPreferencesKeys.theme, themeName);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserPreferencesManager.initialize();

  await Themed.initialize(storageAdapter: ThemeStorage());

  await configureWindow();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late Locale _locale;

  @override
  void initState() {
    super.initState();

    _locale = LanguageManager.getInitialLocale();
    LanguageManager.setLanguageChangeCallback(_onLanguageChanged);

    LogKeeper.info('✅ UI ready - EasyViewer visible to user');
  }

  void _onLanguageChanged() {
    setState(() {
      _locale = LanguageManager.getCurrentLocale();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      config: ToastificationConfig(alignment: AlignmentGeometry.topRight),
      child: ThemedApp(
        title: 'PasswordGenerator',
        fontFamily: 'Inter',
        home: const MyHomePage(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: _locale,
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
