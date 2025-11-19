// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get placeholder_select_contact => 'Contáctame';

  @override
  String get placeholder_select_change_language => 'Cambiar idioma';

  @override
  String get placeholder_select_social_media => 'Redes sociales';

  @override
  String get placeholder_input_generated_password => 'Contraseña generada';

  @override
  String get spanish_language => 'Español';

  @override
  String get english_language => 'Inglés';

  @override
  String get button_generate_password => 'Generar contraseña';

  @override
  String get button_copy_password => 'Copiar contraseña';

  @override
  String get slider_password_length_text =>
      'Longitud de la contraseña (en caracteres):';

  @override
  String get error_copying_password => 'No has generado ninguna contraseña';

  @override
  String get password_copied_successfully =>
      'Contraseña copiada al portapapeles';

  @override
  String get error_while_copying_password_to_clipboard =>
      'Se ha producido un error al copiar la contraseña al portapapeles, inténtelo de nuevo más tarde.';

  @override
  String get close_dialog_title => 'Cerrar aplicación';

  @override
  String get close_dialog_body => '¿Seguro que quieres cerrar la aplicación?';

  @override
  String get settings_menu_title => 'Menú de configuración';

  @override
  String get settings_menu_icon_tooltip => 'Configuración';

  @override
  String get change_language => 'Cambiar idioma';

  @override
  String get contact => 'Contacto';

  @override
  String get social_media => 'Redes sociales';

  @override
  String get change_theme => 'Cambiar a claro/oscuro';
}
