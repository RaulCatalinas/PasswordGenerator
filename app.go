package main

import (
	"context"
	"fmt"

	"github.com/wailsapp/wails/v2/pkg/runtime"

	"github.com/RaulCatalinas/PasswordGenerator/internal/enums"
	userPreferences "github.com/RaulCatalinas/PasswordGenerator/internal/user_preferences"
	"github.com/RaulCatalinas/PasswordGenerator/internal/utils"
)

var userPrefsGenerator = userPreferences.NewUserPreferencesGenerator()

// App struct
type App struct {
	ctx context.Context
}

// NewApp creates a new App application struct
func NewApp() *App {
	return &App{}
}

// startup is called at application startup
func (a *App) startup(ctx context.Context) {
	a.ctx = ctx
	userPreferences.InitPreferences()
}

// domReady is called after front-end resources have been loaded
func (a App) domReady(ctx context.Context) {
	// Add your action here
}

// beforeClose is called when the application is about to quit,
// either by clicking the window close button or calling runtime.Quit.
// Returning true will cause the application to continue, false will continue shutdown as normal.
func (a *App) beforeClose(ctx context.Context) (prevent bool) {
	var userPrefs = userPrefsGenerator.GetPreferences()

	i18nJson, err := utils.ReadI18NJson(userPrefs.Language)

	if err != nil {
		fmt.Println("Error: ", err)
	}

	selection, err := runtime.MessageDialog(a.ctx, runtime.MessageDialogOptions{
		Type:    runtime.QuestionDialog,
		Title:   i18nJson[enums.TRANSLATION_KEY_CLOSE_DIALOG_TITLE].(string),
		Message: i18nJson[enums.TRANSLATION_KEY_CLOSE_DIALOG_BODY].(string),
		Icon:    icon,
		Buttons: []string{"Yes", "No"},
	})

	if err != nil {
		fmt.Println("Error: ", err)

		return false
	}

	return selection == "No"
}

// shutdown is called at application termination
func (a *App) shutdown(ctx context.Context) {
	userPreferences.SavePreferences()
}

// Copies text to the user's clipboard
func (a *App) SetClipboard(text string) {
	runtime.ClipboardSetText(a.ctx, text)
}

func (a *App) OpenUrl(url string) {
	runtime.BrowserOpenURL(a.ctx, url)
}
