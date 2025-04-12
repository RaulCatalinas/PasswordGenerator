package types

type RGBAColor struct {
	R uint8
	G uint8
	B uint8
	A uint8
}

type ThemeColors struct {
	LightMode RGBAColor
	DarkMode  RGBAColor
}
