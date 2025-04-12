// Hooks
import { usePassword } from "@/src/hooks/usePassword"
import { usePasswordLength } from "@/src/hooks/usePasswordLength"

// Wailsjs
import { GeneratePassword } from "@/wailsjs/password/PasswordGenerator"

// Store
import { useDarkModeStore } from "@/src/stores/dark-mode"

export default function ButtonGeneratePassword() {
  const { getPasswordLength } = usePasswordLength()
  const { setNewPassword } = usePassword()
  const darkModeActive = useDarkModeStore(state => state.darkModeActive)

  const generatePassword = async () => {
    const passwordLength = getPasswordLength()
    console.log(passwordLength)
    const passwordGenerated = await GeneratePassword(passwordLength)

    setNewPassword(passwordGenerated)
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
