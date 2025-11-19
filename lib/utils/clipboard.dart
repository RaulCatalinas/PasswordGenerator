import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData;
import 'package:logkeeper/logkeeper.dart' show LogKeeper;
import 'package:passwordgenerator/l10n/app_localizations.dart';
import 'package:toastification/toastification.dart' show ToastificationType;

import 'notifications.dart' show notify;

Future<void> copyTextToClipboard({
  required String textToCopy,
  required BuildContext context,
}) async {
  try {
    await Clipboard.setData(ClipboardData(text: textToCopy));

    if (!context.mounted) return;

    notify(
      text: AppLocalizations.of(context)!.password_copied_successfully,
      notificationType: ToastificationType.success,
    );
  } catch (e) {
    LogKeeper.error(
      "Error while copying the generated password to the user's clipboard: $e",
    );
    notify(
      text: AppLocalizations.of(
        context,
      )!.error_while_copying_password_to_clipboard,
      notificationType: ToastificationType.error,
    );
  }
}
