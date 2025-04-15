package types

type UserPreferencesKeys string
type Language string

const (
	DarkModeActivePreference UserPreferencesKeys = "darkModeActive"
	LanguagePreference       UserPreferencesKeys = "language"
)

const (
	English Language = "english"
	Spanish Language = "spanish"
)

var AllUserPreferences = []struct {
	Value  UserPreferencesKeys
	TSName string
}{
	{DarkModeActivePreference, "DARK_MODE_ACTIVE"},
	{LanguagePreference, "LANGUAGE"},
}

var AllLanguages = []struct {
	Value  Language
	TSName string
}{
	{English, "ENGLISH"},
	{Spanish, "SPANISH"},
}

type UserPreferences struct {
	DarkModeActive bool     `json:"darkModeActive"`
	Language       Language `json:"language"`
}
