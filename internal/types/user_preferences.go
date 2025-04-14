package types

type UserPreferencesKeys string

const (
	DarkModeActivePreference UserPreferencesKeys = "darkModeActive"
	LanguagePreference       UserPreferencesKeys = "language"
)

var AllUserPreferences = []struct {
	Value  UserPreferencesKeys
	TSName string
}{
	{DarkModeActivePreference, "DARK_MODE_ACTIVE"},
	{LanguagePreference, "LANGUAGE"},
}

type UserPreferences struct {
	DarkModeActive bool   `json:"darkModeActive"`
	Language       string `json:"language"`
}
