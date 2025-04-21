package utils

import (
	"encoding/json"
	"fmt"
	"os"

	"github.com/RaulCatalinas/PasswordGenerator/internal/enums"
	"github.com/RaulCatalinas/PasswordGenerator/internal/types"
)

func ReadI18NJson(language types.Language) (map[enums.TranslationKeys]interface{}, error) {
	var result map[enums.TranslationKeys]interface{}

	jsonPath := fmt.Sprintf("internal/locales/%s/translation.json", language)

	fileData, err := os.ReadFile(jsonPath)

	if err != nil {
		return nil, err
	}

	err = json.Unmarshal(fileData, &result)

	if err != nil {
		return nil, err
	}

	return result, nil
}
