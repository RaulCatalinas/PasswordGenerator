import 'package:flutter/services.dart' show Clipboard, ClipboardData;
import 'package:toastification/toastification.dart' show ToastificationType;

import 'notifications.dart' show notify;

Future<void> copyTextToClipboard(String textToCopy) async {
  try {
    await Clipboard.setData(ClipboardData(text: textToCopy));

    notify(
      text: 'Password copied to clipboard',
      notificationType: ToastificationType.success,
    );
  } catch (e) {
    print(
      "Error while copying the generated password to the user's clipboard: $e",
    );
    notify(
      text:
          'An error occurred while copying the password to the clipboard, try again later.',
      notificationType: ToastificationType.error,
    );
  }
}
