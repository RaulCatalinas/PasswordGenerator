// Store
import { useDarkModeStore } from "@/src/stores/dark-mode"
import { usePasswordStore } from "@/src/stores/password"

// Utils
import { copyPasswordToClipboard } from "@/src/utils/password"

export default function ButtonCopyPassWord() {
  const password = usePasswordStore(state => state.password)
  const darkModeActive = useDarkModeStore(state => state.darkModeActive)

  const handleClick = () => {
    copyPasswordToClipboard({ password, darkModeActive })
  }

  return (
    <button
      onClick={handleClick}
      className={`
        px-4 py-2 font-medium rounded-md border transition-colors duration-200
        hover:cursor-pointer focus:outline-none focus:ring-2 focus:ring-opacity-50
        
        ${darkModeActive ? "text-blue-400" : "text-blue-600"}
        ${darkModeActive ? "border-blue-400" : "border-blue-600"}
        ${darkModeActive ? "hover:bg-blue-500/10" : "hover:bg-blue-600/10"}
        ${darkModeActive ? "focus:ring-blue-400" : "focus:ring-blue-500"}
      `}
    >
      Copy password
    </button>
  )
}
