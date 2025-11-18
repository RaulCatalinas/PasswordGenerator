import '/enums/user_preferences.dart' show UserPreferencesKeys;

final Map<UserPreferencesKeys, String> defaultUserPreferences = Map.from({
  UserPreferencesKeys.theme: 'light',
  UserPreferencesKeys.language: 'en',
});
