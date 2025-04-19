package user_preferences

import (
	"encoding/json"
	"fmt"
	"os"
	"path/filepath"

	"github.com/RaulCatalinas/PasswordGenerator/internal/constants"
	"github.com/RaulCatalinas/PasswordGenerator/internal/types"
)

type userPreferencesGenerator struct{}

func NewUserPreferencesGenerator() *userPreferencesGenerator {
	return &userPreferencesGenerator{}
}

var currentPreferences types.UserPreferences
var configPath string

func InitPreferences() error {
	userConfigDir, err := os.UserConfigDir()
	if err != nil {
		return err
	}
	configPath = filepath.Join(userConfigDir, constants.USER_PREFERENCES_FILE)

	if err := loadPreferences(); err != nil {
		currentPreferences = constants.DEFAULT_USER_PREFERENCES
		return SavePreferences()
	}

	return nil
}

func loadPreferences() error {
	data, err := os.ReadFile(configPath)
	if err != nil {
		return err
	}

	return json.Unmarshal(data, &currentPreferences)
}

func SavePreferences() error {
	data, err := json.MarshalIndent(currentPreferences, "", "  ")
	if err != nil {
		return err
	}

	return os.WriteFile(configPath, data, 0644)
}

func (userPrefs *userPreferencesGenerator) GetPreferences() types.UserPreferences {
	return currentPreferences
}

func (userPrefs *userPreferencesGenerator) SetPreference(
	prefType types.UserPreferencesKeys,
	value interface{},
) error {
	switch prefType {
	case types.DarkModeActivePreference:
		if boolValue, ok := value.(bool); ok {
			currentPreferences.DarkModeActive = boolValue
		} else {
			return fmt.Errorf("value for darkMode must be boolean")
		}
	case types.LanguagePreference:
		if value, ok := value.(string); ok {
			if value != string(types.English) && value != string(types.Spanish) {
				value = string(types.English)
			}

			currentPreferences.Language = types.Language(value)
		} else {
			return fmt.Errorf("value for language must be string")
		}
	default:
		return fmt.Errorf("unknown preference type: %s", prefType)
	}

	return nil
}
