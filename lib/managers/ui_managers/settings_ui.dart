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
        SizedBox;

import '/constants/social_media.dart' show socialMedia;
import '/enums/social_media.dart' show SocialMedia;
import '/handlers/social_media.dart' show openUrl;

class SettingsUI extends StatelessWidget {
  static final _dropdownContactKey = GlobalKey<FluiDropdownState>();
  static final _dropdownChangeLanguageKey = GlobalKey<FluiDropdownState>();

  const SettingsUI({super.key});

  @override
  Widget build(BuildContext context) {
    return FluiDrawer(
      height: 290,
      width: 180,
      children: [
        const FluiText(text: 'Settings Menu', fontSize: 22),
        const SizedBox(height: 20),
        FluiIconButton(
          onPressed: () {
            print('Changing theme');
          },
          icon: Icons.dark_mode,
          tooltip: 'Change Theme',
          iconSize: 28,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FluiIconButton(
              onPressed: () {
                _dropdownChangeLanguageKey.currentState?.toggleVisibility();
              },
              icon: Icons.language,
              tooltip: 'Change language',
              iconSize: 28,
            ),
            FluiDropdown(
              key: _dropdownChangeLanguageKey,
              initiallyVisible: false,
              placeHolder: 'Change language',
              dropdownMenuEntries: [
                DropdownMenuEntry(
                  value: 'en',
                  label: 'English',
                  style: ButtonStyle(enableFeedback: true),
                ),
                DropdownMenuEntry(
                  value: 'es',
                  label: 'Spanish',
                  style: ButtonStyle(enableFeedback: true),
                ),
              ],
              onSelected: (value) {
                print('Changing language to $value');
              },
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FluiIconButton(
              onPressed: () {
                _dropdownContactKey.currentState?.toggleVisibility();
              },
              icon: Icons.contacts,
              tooltip: 'Contact me',
              iconSize: 28,
            ),
            FluiDropdown(
              key: _dropdownContactKey,
              initiallyVisible: false,
              placeHolder: 'Contact me',
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
  }
}
