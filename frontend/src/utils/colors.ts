// Constants
import { NOTIFICATION_COLORS } from "@/src/constants/colors"

// Types
import { RGBColor } from "@/src/types/colors"
import { TypeOptions } from "react-toastify"

interface GetNotificationColorsProps {
  darkModeActive: boolean
  type: TypeOptions
}

export function getNotificationColors({
  darkModeActive,
  type
}: GetNotificationColorsProps): RGBColor {
  const mode = darkModeActive ? "DarkMode" : "LightMode"
  const notificationType =
    type.toUpperCase() as keyof typeof NOTIFICATION_COLORS.DarkMode

  return NOTIFICATION_COLORS[mode][notificationType]
}
