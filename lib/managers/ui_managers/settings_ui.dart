import 'package:fluikit/widgets.dart'
    show FluiDrawer, FluiDropdown, FluiIconButton, FluiText, FluiDropdownState;
import 'package:flutter/material.dart'
    show
        BuildContext,
        ButtonStyle,
        Column,
        DropdownMenuEntry,
        GlobalKey,
        Icons,
        MainAxisAlignment,
        StatelessWidget,
        Widget,
        SizedBox,
        ValueListenableBuilder,
        Locale;
import 'package:flutter_themed/flutter_themed.dart' show Themed;

import '/constants/social_media.dart' show socialMedia;
import '/enums/social_media.dart' show SocialMedia;
import '/handlers/social_media.dart' show openUrl;
import '/l10n/app_localizations.dart' show AppLocalizations;
import '/managers/user_preferences_managers/lanaguage_manager.dart'
    show LanguageManager;

class SettingsUI extends StatelessWidget {
  static final _dropdownContactKey = GlobalKey<FluiDropdownState>();
  static final _dropdownChangeLanguageKey = GlobalKey<FluiDropdownState>();

  const SettingsUI({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Themed.instance.themeNotifier,
      builder: (_, _, _) {
        return FluiDrawer(
          height: 290,
          width: LanguageManager.getCurrentLocale() == const Locale('en')
              ? 250
              : 280,
          children: [
            FluiText(
              text: AppLocalizations.of(context)!.settings_menu_title,
              fontSize: 22,
            ),
            const SizedBox(height: 20),
            FluiIconButton(
              onPressed: () {
                Themed.toggleTheme();
              },
              icon: Themed.currentThemeName == 'dark'
                  ? Icons.light_mode
                  : Icons.dark_mode,
              tooltip: AppLocalizations.of(context)!.change_theme,
              iconSize: 28,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FluiIconButton(
                  onPressed: () {
                    _dropdownContactKey.currentState?.closeIfOpen();
                    _dropdownChangeLanguageKey.currentState?.toggleVisibility();
                  },
                  icon: Icons.language,
                  tooltip: AppLocalizations.of(context)!.change_language,
                  iconSize: 28,
                ),
                FluiDropdown(
                  key: _dropdownChangeLanguageKey,
                  initiallyVisible: false,
                  placeHolder: AppLocalizations.of(context)!.change_language,
                  dropdownMenuEntries: [
                    DropdownMenuEntry(
                      value: 'en',
                      label: AppLocalizations.of(context)!.english_language,
                      style: ButtonStyle(enableFeedback: true),
                    ),
                    DropdownMenuEntry(
                      value: 'es',
                      label: AppLocalizations.of(context)!.spanish_language,
                      style: ButtonStyle(enableFeedback: true),
                    ),
                  ],
                  onSelected: (value) {
                    LanguageManager.changeLanguage(value.toString());
                    _dropdownChangeLanguageKey.currentState?.closeIfOpen();
                  },
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FluiIconButton(
                  onPressed: () {
                    _dropdownChangeLanguageKey.currentState?.closeIfOpen();
                    _dropdownContactKey.currentState?.toggleVisibility();
                  },
                  icon: Icons.contacts,
                  tooltip: AppLocalizations.of(context)!.contact,
                  iconSize: 28,
                ),
                FluiDropdown(
                  key: _dropdownContactKey,
                  initiallyVisible: false,
                  placeHolder: AppLocalizations.of(context)!.social_media,
                  dropdownMenuEntries: [
                    DropdownMenuEntry(
                      value: SocialMedia.instagram,
                      label: 'Instagram',
                      style: ButtonStyle(enableFeedback: true),
                    ),
                    DropdownMenuEntry(
                      value: SocialMedia.twitter,
                      label: 'Twitter/X',
                      style: ButtonStyle(enableFeedback: true),
                    ),
                    DropdownMenuEntry(
                      value: SocialMedia.github,
                      label: 'GitHub',
                      style: ButtonStyle(enableFeedback: true),
                    ),
                  ],
                  onSelected: (value) async {
                    await openUrl(socialMedia[value].toString());
                    _dropdownContactKey.currentState?.toggleVisibility();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
