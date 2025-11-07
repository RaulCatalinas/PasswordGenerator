import 'package:fluikit/widgets.dart'
    show
        FluiAppBar,
        FluiReadOnlyInput,
        FluiReadOnlyInputState,
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
        MainAxisAlignment,
        Padding,
        Row,
        Scaffold,
        SizedBox,
        StatelessWidget,
        Widget;
import 'package:toastification/toastification.dart' show ToastificationType;

import '/core/password.dart' show PasswordGenerator;
import '/utils/clipboard.dart' show copyTextToClipboard;
import '/utils/notifications.dart' show notify;
import 'settings_ui.dart' show SettingsUI;

// ignore: must_be_immutable
class MainUI extends StatelessWidget {
  final _inputKey = GlobalKey<FluiReadOnlyInputState>();
  final _sliderKey = GlobalKey<FluiSliderState>();
  String password = '';

  MainUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FluiAppBar(actions: []),
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
                    label: 'Password length (in characters)',
                    initialValue: 8,
                    minValue: 8,
                    maxValue: 128,
                  ),

                  const SizedBox(height: 16),

                  FluiReadOnlyInput(
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
                  FluiTextButton(
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

                  FluiTextButton(
                    text: 'Copy password',
                    isOutlinedButton: true,
                    onPressed: () async {
                      if (password.isEmpty) {
                        notify(
                          text: "You haven't generated any passwords",
                          notificationType: ToastificationType.error,
                        );

                        return;
                      }

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
