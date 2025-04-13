// Store
import { useDarkModeStore } from "@/src/stores/dark-mode"

// Third-Party libraries
import { IconMoonFilled, IconSunFilled } from "@tabler/icons-react"

export default function ButtonChangeTheme() {
  const darkModeActive = useDarkModeStore(state => state.darkModeActive)
  const setDarkModeActive = useDarkModeStore(state => state.setDarkModeActive)

  const toggleDarkModeActive = () => {
    setDarkModeActive(!darkModeActive)
  }

  return (
    <button
      onClick={toggleDarkModeActive}
      className={`
        p-2 rounded-full transition-colors duration-200
        focus:outline-none focus:ring-2 focus:ring-opacity-50
        hover:cursor-pointer
        ${darkModeActive ? "bg-gray-700" : "bg-gray-200"}
        ${darkModeActive ? "hover:bg-gray-600" : "hover:bg-gray-300"}
      `}
    >
      {darkModeActive ? (
        <IconSunFilled size={20} />
      ) : (
        <IconMoonFilled size={20} />
      )}
    </button>
  )
}
