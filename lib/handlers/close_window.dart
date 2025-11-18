import 'package:fluikit/dialogs.dart' show FluiConfirmDialog;
import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_window_close/flutter_window_close.dart'
    show FlutterWindowClose;
import 'package:passwordgenerator/managers/user_preferences_managers/user_preferemces_manager.dart';

void handleCloseWindow(BuildContext context) {
  FlutterWindowClose.setWindowShouldCloseHandler(() async {
    return await FluiConfirmDialog.show(
      context,
      title: 'Exit App',
      content: 'Are you sure you wanna exit the app?',
      onConfirmed: () async {
        await UserPreferencesManager.savePreferences();
      },
    );
  });
}
