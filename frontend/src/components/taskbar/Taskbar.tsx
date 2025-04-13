// Components
import ButtonChangeTheme from "../buttons/ButtonChangeTheme"

// Stores
import { useDarkModeStore } from "@/src/stores/dark-mode"

export default function TaskBar() {
  const darkModeActive = useDarkModeStore(state => state.darkModeActive)

  return (
    <header
      className={`
        fixed top-0 left-0 right-0 flex justify-end items-center 
        px-6 py-3
        ${darkModeActive ? "bg-gray-800/90" : "bg-white/90"}
        ${darkModeActive ? "text-white" : "text-gray-800"}
      `}
    >
      <ButtonChangeTheme />
    </header>
  )
}
