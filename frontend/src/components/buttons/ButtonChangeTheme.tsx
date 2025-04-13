// Store
import { useDarkModeStore } from "@/src/stores/dark-mode"

// Third-Party libraries
import { IconMoonFilled, IconSunFilled } from "@tabler/icons-react"

// Components
import BaseTaskBarButton from "./BaseTaskBarButton"

export default function ButtonChangeTheme() {
  const darkModeActive = useDarkModeStore(state => state.darkModeActive)
  const setDarkModeActive = useDarkModeStore(state => state.setDarkModeActive)

  const toggleDarkModeActive = () => {
    setDarkModeActive(!darkModeActive)
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
