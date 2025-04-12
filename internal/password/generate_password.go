package password

import (
	"math/rand"
	"strings"
	"time"

	"github.com/RaulCatalinas/PasswordGenerator/internal/constants"
)

type passwordGenerator struct{}

func NewPasswordGenerator() *passwordGenerator {
	return &passwordGenerator{}
}

func (pg *passwordGenerator) GeneratePassword(passwordLength int) string {
	totalChars := constants.LOWERCASE + constants.UPPERCASE + constants.SYMBOLS + constants.NUMBERS

	// Initialize random seed
	rand.New(rand.NewSource(time.Now().UnixNano()))

	var password strings.Builder

	password.Grow(passwordLength)

	for i := 0; i < passwordLength; i++ {
		randomIndex := rand.Intn(len(totalChars))
		password.WriteByte(totalChars[randomIndex])
	}

	return password.String()
}
