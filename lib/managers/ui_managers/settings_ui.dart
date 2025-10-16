import 'package:flutter/material.dart'
    show
        BuildContext,
        ButtonStyle,
        DropdownMenuEntry,
        GlobalKey,
        Icons,
        PreferredSizeWidget,
        Size,
        StatelessWidget,
        Widget,
        kToolbarHeight;

import '/components/widgets/app_bar.dart' show CreateAppBar;
import '/components/widgets/dropdown.dart'
    show CreateDropdown, CreateDropdownState;
import '/components/widgets/icon_button.dart' show CreateIconButton;
import '/enums/social_media.dart' show SocialMedia;

class SettingsUI extends StatelessWidget implements PreferredSizeWidget {
  static final _dropdownContactKey = GlobalKey<CreateDropdownState>();
  static final _dropdownChangeLanguageKey = GlobalKey<CreateDropdownState>();

  const SettingsUI({super.key});

  @override
  Widget build(BuildContext context) {
    return CreateAppBar(
      actions: [
        CreateIconButton(
          onPressed: () {
            print('Changing theme');
          },
          icon: Icons.dark_mode,
          tooltip: 'Change Theme',
          iconSize: 28,
        ),
        CreateIconButton(
          onPressed: () {
            _dropdownChangeLanguageKey.currentState?.toggleVisibility();
          },
          icon: Icons.language,
          tooltip: 'Change language',
          iconSize: 28,
        ),
        CreateDropdown(
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
        CreateIconButton(
          onPressed: () {
            _dropdownContactKey.currentState?.toggleVisibility();
          },
          icon: Icons.contacts,
          tooltip: 'Contact me',
          iconSize: 28,
        ),
        CreateDropdown(
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
            print('Opening $value...');
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
