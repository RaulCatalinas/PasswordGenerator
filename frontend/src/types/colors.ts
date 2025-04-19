export interface RGBColor {
  R: number
  G: number
  B: number
}

interface NotificationColors {
  SUCCESS: RGBColor
  INFO: RGBColor
  WARNING: RGBColor
  ERROR: RGBColor
}

export interface NotificationsColors {
  DarkMode: NotificationColors
  LightMode: NotificationColors
}
