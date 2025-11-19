// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get placeholder_select_contact => 'Contact me';

  @override
  String get placeholder_select_change_language => 'Change language';

  @override
  String get placeholder_select_social_media => 'Social media';

  @override
  String get placeholder_input_generated_password => 'Generated password';

  @override
  String get spanish_language => 'Spanish';

  @override
  String get english_language => 'English';

  @override
  String get button_generate_password => 'Generate password';

  @override
  String get button_copy_password => 'Copy password';

  @override
  String get slider_password_length_text => 'Password length (in characters):';

  @override
  String get error_copying_password => 'You haven\'t generated any passwords';

  @override
  String get password_copied_successfully => 'Password copied to clipboard';

  @override
  String get error_while_copying_password_to_clipboard =>
      'An error occurred while copying the password to the clipboard, try again later.';

  @override
  String get close_dialog_title => 'Close Application';

  @override
  String get close_dialog_body =>
      'Are you sure you wanna close the application?';

  @override
  String get settings_menu_title => 'Settings Menu';

  @override
  String get settings_menu_icon_tooltip => 'Settings';

  @override
  String get change_language => 'Change language';

  @override
  String get contact => 'Contact';

  @override
  String get social_media => 'Social Media';

  @override
  String get change_theme => 'Switch to light/dark';
}
