// Wailsjs
import { GeneratePassword } from "@/wailsjs/password/PasswordGenerator"

// Store
import { useDarkModeStore } from "@/src/stores/dark-mode"
import { usePasswordStore } from "@/src/stores/password"

// Utils
import { copyPasswordToClipboard } from "@/src/utils/password"

export default function ButtonGeneratePassword() {
  const passwordLength = usePasswordStore(state => state.passwordLength)
  const setPassword = usePasswordStore(state => state.setPassword)
  const darkModeActive = useDarkModeStore(state => state.darkModeActive)

  const generatePassword = async () => {
    const passwordGenerated = await GeneratePassword(passwordLength)

    setPassword(passwordGenerated)

    copyPasswordToClipboard(passwordGenerated)
  }

  return (
    <button
      onClick={generatePassword}
      className={`
        px-6 py-3 text-white font-medium
        hover:cursor-pointer rounded-md shadow-s
        focus:outline-none focus:ring-2 focus:ring-opacity-50
        transition-colors duration-200 
        
        ${darkModeActive ? "bg-blue-500" : "bg-blue-600"}
        ${darkModeActive ? "hover:bg-blue-600" : "hover:bg-blue-700"}
        ${darkModeActive ? "focus:ring-blue-400" : "focus:ring-blue-500"}
      `}
    >
      Generate password
    </button>
  )
}
