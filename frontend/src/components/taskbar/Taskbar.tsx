// Components
import ButtonChangeLanguage from "@/src/components/buttons/ButtonChangeLanguage"
import ButtonChangeTheme from "@/src/components/buttons/ButtonChangeTheme"
import ButtonContact from "@/src/components/buttons/ButtonContact"
import SelectSocialMedia from "@/src/components/selects/SelectSocialMedia"

// Stores
import { useDarkModeStore } from "@/src/stores/dark-mode"
import { useSelectStore } from "@/src/stores/select"

export default function TaskBar() {
  const darkModeActive = useDarkModeStore(state => state.darkModeActive)
  const showContactSelect = useSelectStore(state => state.showContactSelect)

  return (
    <header
      className={`
        fixed top-0 left-0 right-0 px-6 py-3 flex items-center justify-end gap-1.5
        ${darkModeActive ? "bg-gray-700/90" : "bg-white/90"}
        ${darkModeActive ? "text-white" : "text-gray-800"}
      `}
    >
      <ButtonChangeLanguage />
      <div className="relative">
        <ButtonContact />
        {showContactSelect && (
          <div className="absolute right-0 mt-1 w-48 z-10">
            <SelectSocialMedia />
          </div>
        )}
      </div>
      <ButtonChangeTheme />
    </header>
  )
}
