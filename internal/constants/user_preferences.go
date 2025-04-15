package constants

import "github.com/RaulCatalinas/PasswordGenerator/internal/types"

var DEFAULT_USER_PREFERENCES = types.UserPreferences{
	DarkModeActive: false,
	Language:       "english",
}

const USER_PREFERENCES_FILE = "password_generator_user_preferences.json"
