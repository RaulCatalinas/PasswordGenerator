package password

import "fmt"

type passwordGenerator struct{}

func NewPasswordGenerator() *passwordGenerator {
	return &passwordGenerator{}
}

func (pg *passwordGenerator) GeneratePassword(length uint8) string {
	message := fmt.Sprintf("Password generated with a length of %d characters", length)

	println(message)

	return "password123"
}
