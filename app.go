package main

import (
	"context"

	"github.com/wailsapp/wails/v2/pkg/runtime"

	userPreferences "github.com/RaulCatalinas/PasswordGenerator/internal/user_preferences"
)

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
	selection, _ := runtime.MessageDialog(a.ctx, runtime.MessageDialogOptions{
		Type:    runtime.QuestionDialog,
		Title:   "Close Application",
		Message: "Are you sure you wanna close the application?",
		Icon:    icon,
	})

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
