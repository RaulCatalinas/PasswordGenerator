import { useDarkModeStore } from "@/src/stores/dark-mode"

interface InputPasswordProps {
  passwordGenerated: string
}

export default function InputPassword(props: InputPasswordProps) {
  const darkModeActive = useDarkModeStore(state => state.darkModeActive)

  return (
    <div className="relative w-full max-w-xl">
      <input
        type="text"
        value={props.passwordGenerated}
        readOnly
        placeholder="Generated password"
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
