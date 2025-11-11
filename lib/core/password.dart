import 'dart:math' show Random;

import '/constants/chars.dart' show lowercase, numbers, symbols, uppercase;

class PasswordGenerator {
  static final _instance = PasswordGenerator._internal();
  static final _random = Random();

  factory PasswordGenerator() {
    return _instance;
  }

  PasswordGenerator._internal();

  static String generatePassword(int passwordLength) {
    final totalChars = lowercase + uppercase + symbols + numbers;

    final password = StringBuffer();

    for (var i = 0; i < passwordLength; i++) {
      final randomIndex = _random.nextInt(totalChars.length);
      password.write(totalChars[randomIndex]);
    }

    return password.toString();
  }
}
