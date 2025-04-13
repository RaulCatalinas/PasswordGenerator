// Components
import ButtonChangeLanguage from "../buttons/ButtonChangeLanguage"
import ButtonChangeTheme from "../buttons/ButtonChangeTheme"
import ButtonContact from "../buttons/ButtonContact"

// Stores
import { useDarkModeStore } from "@/src/stores/dark-mode"

export default function TaskBar() {
  const darkModeActive = useDarkModeStore(state => state.darkModeActive)

  return (
    <header
      className={`
        fixed top-0 left-0 right-0 px-6 py-3 flex items-center justify-end gap-1.5
        ${darkModeActive ? "bg-gray-700/90" : "bg-white/90"}
        ${darkModeActive ? "text-white" : "text-gray-800"}
      `}
    >
      <ButtonChangeLanguage />
      <ButtonContact />
      <ButtonChangeTheme />
    </header>
  )
}
