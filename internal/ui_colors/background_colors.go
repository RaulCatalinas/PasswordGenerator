package ui_colors

import "github.com/RaulCatalinas/PasswordGenerator/internal/types"

type uiColorsGenerator struct{}

func NewUiColorsGenerator() *uiColorsGenerator {
	return &uiColorsGenerator{}
}

func (uiColors *uiColorsGenerator) GetThemeBackgroundColors(darkMode bool) types.RGBAColor {
	colors := types.ThemeColors{}

	// Light mode: White with a touch of grey
	colors.LightMode.R = 245
	colors.LightMode.G = 246
	colors.LightMode.B = 250
	colors.LightMode.A = 1

	// Dark mode: Soft black
	colors.DarkMode.R = 18
	colors.DarkMode.G = 18
	colors.DarkMode.B = 18
	colors.DarkMode.A = 1

	if darkMode {
		return colors.DarkMode
	}

	return colors.LightMode
}
