import 'package:fluikit/widgets.dart' show FluiText;
import 'package:toastification/toastification.dart'
    show toastification, ToastificationType, ToastificationStyle;

void notify({
  required String text,
  required ToastificationType notificationType,
}) {
  toastification.show(
    style: ToastificationStyle.minimal,
    type: notificationType,
    title: FluiText(text: text),
    autoCloseDuration: const Duration(seconds: 4),
    closeOnClick: true,
  );
}
