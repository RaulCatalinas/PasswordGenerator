package main

import (
	"embed"

	"github.com/wailsapp/wails/v2"
	"github.com/wailsapp/wails/v2/pkg/options"

	appSettings "github.com/RaulCatalinas/PasswordGenerator/internal/app_settings"
	"github.com/RaulCatalinas/PasswordGenerator/internal/password"
	uiColors "github.com/RaulCatalinas/PasswordGenerator/internal/ui_colors"
)

//go:embed all:frontend/dist
var assets embed.FS

//go:embed build/appicon.png
var icon []byte

func main() {
	// Create an instance of the app structure
	app := NewApp()

	passwordGen := password.NewPasswordGenerator()
	uiColorsGen := uiColors.NewUiColorsGenerator()
	uiColors := uiColorsGen.GetThemeBackgroundColors(false)

	// Create application with options
	err := wails.Run(&options.App{
		Title:         appSettings.TITLE,
		Width:         appSettings.WIDTH,
		Height:        appSettings.HEIGHT,
		DisableResize: appSettings.DISABLE_RESIZE,
		Assets:        assets,
		BackgroundColour: &options.RGBA{
			R: uiColors.R,
			G: uiColors.G,
			B: uiColors.B,
			A: uiColors.A,
		},
		OnStartup: app.startup,
		Bind: []interface{}{
			app,
			passwordGen,
			uiColorsGen,
		},
	})

	if err != nil {
		println("Error:", err.Error())
	}
}
