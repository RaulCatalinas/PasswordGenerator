import 'package:flutter/services.dart' show Clipboard, ClipboardData;

Future<void> copyTextToClipboard(String textToCopy) async {
  await Clipboard.setData(ClipboardData(text: textToCopy));
}
