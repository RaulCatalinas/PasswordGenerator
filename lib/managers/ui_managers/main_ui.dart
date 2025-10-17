import 'package:flutter/material.dart'
    show
        BuildContext,
        Center,
        Column,
        MainAxisAlignment,
        Padding,
        Scaffold,
        StatelessWidget,
        Widget,
        EdgeInsets,
        GlobalKey,
        SizedBox,
        Row;

import '/components/widgets/input.dart'
    show CreateReadOnlyInput, CreateReadOnlyInputState;
import '/components/widgets/slider.dart' show CreateSlider, CreateSliderState;
import '/components/widgets/text_button.dart' show CreateTextButton;
import 'settings_ui.dart' show SettingsUI;
import '/core/password.dart' show PasswordGenerator;
import '/utils/clipboard.dart' show copyTextToClipboard;

class MainUI extends StatelessWidget {
  final _inputKey = GlobalKey<CreateReadOnlyInputState>();
  final _sliderKey = GlobalKey<CreateSliderState>();
  String password = '';

  MainUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SettingsUI(),
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
                  CreateSlider(
                    key: _sliderKey,
                    label: 'Password length (in characters)',
                    initialValue: 8,
                    minValue: 8,
                    maxValue: 128,
                  ),

                  const SizedBox(height: 16),

                  CreateReadOnlyInput(
                    key: _inputKey,
                    placeholder: 'Generated password',
                  ),
                ],
              ),

              const SizedBox(height: 17),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 16,
                children: [
                  CreateTextButton(
                    text: 'Generate password',
                    onPressed: () async {
                      final passwordLength = _sliderKey.currentState
                          ?.getValue();

                      password = PasswordGenerator.generatePassword(
                        passwordLength ?? 8,
                      );

                      _inputKey.currentState?.setText(password);

                      await copyTextToClipboard(password);
                    },
                  ),

                  CreateTextButton(
                    text: 'Copy password',
                    isOutlinedButton: true,
                    onPressed: () async {
                      await copyTextToClipboard(password);
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
