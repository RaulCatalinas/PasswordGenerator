import 'package:flutter/material.dart'
    show AlertDialog, BuildContext, ElevatedButton, Navigator, Text, showDialog;
import 'package:flutter_window_close/flutter_window_close.dart'
    show FlutterWindowClose;

void handleWidowClose(BuildContext context) {
  FlutterWindowClose.setWindowShouldCloseHandler(() async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Do you really want to quit?'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Yes'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  });
}
