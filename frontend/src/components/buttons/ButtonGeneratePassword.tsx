// Hooks
import { usePassword } from "@/src/hooks/usePassword"
import { usePasswordLength } from "@/src/hooks/usePasswordLength"

// Wailsjs
import { GeneratePassword } from "@/wailsjs/password/PasswordGenerator"

export default function ButtonGeneratePassword() {
  const { getPasswordLength } = usePasswordLength()
  const { setNewPassword } = usePassword()

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
        px-6 py-3 bg-blue-600 text-white font-medium 
        rounded-md shadow-sm hover:bg-blue-700 focus:outline-none 
        focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50 
        transition-colors duration-200 dark:bg-blue-500 
        dark:hover:bg-blue-600 dark:focus:ring-blue-400
      `}
    >
      Generate password
    </button>
  )
}
