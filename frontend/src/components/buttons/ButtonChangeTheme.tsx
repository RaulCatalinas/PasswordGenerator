// Store
import { useDarkModeStore } from "@/src/stores/dark-mode"

// Third-Party libraries
import { IconMoonFilled, IconSunFilled } from "@tabler/icons-react"

// Components
import BaseTaskBarButton from "./BaseTaskBarButton"

// Wailsjs
import { types } from "@/wailsjs/models"
import { SetPreference } from "@/wailsjs/user_preferences/userPreferencesGenerator"

export default function ButtonChangeTheme() {
  const darkModeActive = useDarkModeStore(state => state.darkModeActive)
  const setDarkModeActive = useDarkModeStore(state => state.setDarkModeActive)

  const toggleDarkModeActive = async () => {
    setDarkModeActive(!darkModeActive)

    await SetPreference(
      types.UserPreferencesKeys.DARK_MODE_ACTIVE,
      !darkModeActive
    )
  }

  return (
    <BaseTaskBarButton onClick={toggleDarkModeActive}>
      {darkModeActive ? (
        <IconSunFilled size={20} />
      ) : (
        <IconMoonFilled size={20} />
      )}
    </BaseTaskBarButton>
  )
}
