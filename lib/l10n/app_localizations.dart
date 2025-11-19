import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @placeholder_select_contact.
  ///
  /// In en, this message translates to:
  /// **'Contact me'**
  String get placeholder_select_contact;

  /// No description provided for @placeholder_select_change_language.
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get placeholder_select_change_language;

  /// No description provided for @placeholder_select_social_media.
  ///
  /// In en, this message translates to:
  /// **'Social media'**
  String get placeholder_select_social_media;

  /// No description provided for @placeholder_input_generated_password.
  ///
  /// In en, this message translates to:
  /// **'Generated password'**
  String get placeholder_input_generated_password;

  /// No description provided for @spanish_language.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get spanish_language;

  /// No description provided for @english_language.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english_language;

  /// No description provided for @button_generate_password.
  ///
  /// In en, this message translates to:
  /// **'Generate password'**
  String get button_generate_password;

  /// No description provided for @button_copy_password.
  ///
  /// In en, this message translates to:
  /// **'Copy password'**
  String get button_copy_password;

  /// No description provided for @slider_password_length_text.
  ///
  /// In en, this message translates to:
  /// **'Password length (in characters):'**
  String get slider_password_length_text;

  /// No description provided for @error_copying_password.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t generated any passwords'**
  String get error_copying_password;

  /// No description provided for @password_copied_successfully.
  ///
  /// In en, this message translates to:
  /// **'Password copied to clipboard'**
  String get password_copied_successfully;

  /// No description provided for @error_while_copying_password_to_clipboard.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while copying the password to the clipboard, try again later.'**
  String get error_while_copying_password_to_clipboard;

  /// No description provided for @close_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Close Application'**
  String get close_dialog_title;

  /// No description provided for @close_dialog_body.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you wanna close the application?'**
  String get close_dialog_body;

  /// No description provided for @settings_menu_title.
  ///
  /// In en, this message translates to:
  /// **'Settings Menu'**
  String get settings_menu_title;

  /// No description provided for @settings_menu_icon_tooltip.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings_menu_icon_tooltip;

  /// No description provided for @change_language.
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get change_language;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @social_media.
  ///
  /// In en, this message translates to:
  /// **'Social Media'**
  String get social_media;

  /// No description provided for @change_theme.
  ///
  /// In en, this message translates to:
  /// **'Switch to light/dark'**
  String get change_theme;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
