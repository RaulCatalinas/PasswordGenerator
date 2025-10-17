import 'package:toastification/toastification.dart'
    show toastification, ToastificationType, ToastificationStyle;

import '/components/widgets/text.dart' show CreateText;

void notify({
  required String text,
  required ToastificationType notificationType,
}) {
  toastification.show(
    style: ToastificationStyle.minimal,
    type: notificationType,
    title: CreateText(text: text),
    autoCloseDuration: const Duration(seconds: 4),
    closeOnClick: true,
  );
}
