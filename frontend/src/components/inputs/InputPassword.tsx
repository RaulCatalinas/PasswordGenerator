// Stores
import { useDarkModeStore } from "@/src/stores/dark-mode"
import { usePasswordStore } from "@/src/stores/password"

// Enums
import { TranslationKeys } from "@/src/enums/i18n"

// Third-Party libraries
import { useTranslation } from "react-i18next"

export default function InputPassword() {
  const darkModeActive = useDarkModeStore(state => state.darkModeActive)
  const password = usePasswordStore(state => state.password)
  const { t } = useTranslation()

  return (
    <div className="relative w-full max-w-xl">
      <input
        type="text"
        value={password}
        readOnly
        placeholder={t(TranslationKeys.PLACEHOLDER_INPUT_GENERATED_PASSWORD)}
        className={`
          w-full px-4 py-3 rounded-md border 0 focus:outline-none 
          focus:ring-2  focus:border-transparent font-mono text-lg shadow-sm
          text-center

          ${darkModeActive ? "bg-gray-700" : "bg-gray-200"}
          ${darkModeActive ? "text-gray-100" : "text-gray-600"}
          ${darkModeActive ? "border-white" : "border-gray-30"}
          ${darkModeActive ? "focus:ring-blue-400" : "focus:ring-blue-500"}
          ${darkModeActive ? "placeholder-gray-400" : "placeholder-gray-500"}
        `}
      />
    </div>
  )
}
