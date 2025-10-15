import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_window_close/flutter_window_close.dart'
    show FlutterWindowClose;

import '/components/dialogs/confirm_dialog.dart' show ConfirmDialog;

void handleCloseWindow(BuildContext context) {
  FlutterWindowClose.setWindowShouldCloseHandler(() async {
    return await ConfirmDialog.show(
      context,
      title: 'Exit App',
      content: 'Are you sure you wanna exit the app?',
    );
  });
}
