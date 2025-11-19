import 'package:fluikit/widgets.dart'
    show
        FluiAppBar,
        FluiInput,
        FluiInputState,
        FluiSlider,
        FluiSliderState,
        FluiTextButton;
import 'package:flutter/material.dart'
    show
        BuildContext,
        Center,
        Column,
        EdgeInsets,
        GlobalKey,
        Icons,
        MainAxisAlignment,
        Padding,
        Row,
        Scaffold,
        SizedBox,
        StatelessWidget,
        Widget;
import 'package:toastification/toastification.dart' show ToastificationType;

import '/core/password.dart' show PasswordGenerator;
import '/l10n/app_localizations.dart' show AppLocalizations;
import '/utils/clipboard.dart' show copyTextToClipboard;
import '/utils/notifications.dart' show notify;
import 'settings_ui.dart' show SettingsUI;

// ignore: must_be_immutable
class MainUI extends StatelessWidget {
  final _inputKey = GlobalKey<FluiInputState>();
  final _sliderKey = GlobalKey<FluiSliderState>();
  String password = '';

  MainUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FluiAppBar(
        actions: [],
        drawerIcon: Icons.settings,
        drawerIconTooltip: AppLocalizations.of(
          context,
        )!.settings_menu_icon_tooltip,
      ),
      drawer: const SettingsUI(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 15,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FluiSlider(
                    key: _sliderKey,
                    label: AppLocalizations.of(
                      context,
                    )!.slider_password_length_text,
                    initialValue: 8,
                    minValue: 8,
                    maxValue: 128,
                  ),

                  const SizedBox(height: 16),

                  FluiInput(
                    key: _inputKey,
                    placeholder: AppLocalizations.of(
                      context,
                    )!.placeholder_input_generated_password,
                    readOnly: true,
                  ),
                ],
              ),

              const SizedBox(height: 17),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 16,
                children: [
                  FluiTextButton(
                    text: AppLocalizations.of(
                      context,
                    )!.button_generate_password,
                    onPressed: () async {
                      final passwordLength = _sliderKey.currentState
                          ?.getValue();

                      password = PasswordGenerator.generatePassword(
                        passwordLength ?? 8,
                      );

                      _inputKey.currentState?.setText(password);

                      await copyTextToClipboard(
                        textToCopy: password,
                        context: context,
                      );
                    },
                  ),

                  FluiTextButton(
                    text: AppLocalizations.of(context)!.button_copy_password,
                    isOutlinedButton: true,
                    onPressed: () async {
                      if (password.isEmpty) {
                        notify(
                          text: AppLocalizations.of(
                            context,
                          )!.error_copying_password,
                          notificationType: ToastificationType.error,
                        );

                        return;
                      }

                      await copyTextToClipboard(
                        textToCopy: password,
                        context: context,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
