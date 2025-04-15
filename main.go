package main

import (
	"embed"
	"fmt"
	"net/http"
	"os"
	"strings"

	"github.com/wailsapp/wails/v2"
	"github.com/wailsapp/wails/v2/pkg/options"
	"github.com/wailsapp/wails/v2/pkg/options/assetserver"

	appSettings "github.com/RaulCatalinas/PasswordGenerator/internal/app_settings"
	"github.com/RaulCatalinas/PasswordGenerator/internal/password"
	"github.com/RaulCatalinas/PasswordGenerator/internal/types"
	userPreferences "github.com/RaulCatalinas/PasswordGenerator/internal/user_preferences"
)

//go:embed all:frontend/dist
var assets embed.FS

//go:embed build/appicon.png
var icon []byte

type FileLoader struct {
	http.Handler
}

func NewFileLoader() *FileLoader {
	return &FileLoader{}
}

func (h *FileLoader) ServeHTTP(res http.ResponseWriter, req *http.Request) {
	var err error
	requestedFilename := strings.TrimPrefix(req.URL.Path, "/")
	println("Requesting file:", requestedFilename)
	fileData, err := os.ReadFile(requestedFilename)
	if err != nil {
		res.WriteHeader(http.StatusBadRequest)
		res.Write([]byte(fmt.Sprintf("Could not load file %s", requestedFilename)))
	}

	res.Write(fileData)
}

func main() {
	// Create an instance of the app structure
	app := NewApp()

	passwordGen := password.NewPasswordGenerator()
	userPreferencesGen := userPreferences.NewUserPreferencesGenerator()

	// Create application with options
	err := wails.Run(&options.App{
		Title:         appSettings.TITLE,
		Width:         appSettings.WIDTH,
		Height:        appSettings.HEIGHT,
		DisableResize: appSettings.DISABLE_RESIZE,
		AssetServer: &assetserver.Options{
			Assets:  assets,
			Handler: NewFileLoader(),
		},
		OnStartup:  app.startup,
		OnShutdown: app.shutdown,
		Bind: []interface{}{
			app,
			passwordGen,
			userPreferencesGen,
		},
		EnumBind: []interface{}{
			types.AllUserPreferences,
			types.AllLanguages,
		},
	})

	if err != nil {
		println("Error:", err.Error())
	}
}
