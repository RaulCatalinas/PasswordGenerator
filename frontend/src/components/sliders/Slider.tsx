// Hooks
import { usePasswordLength } from "@/src/hooks/usePasswordLength"

// Store
import { useDarkModeStore } from "@/src/stores/dark-mode"

export default function Slider() {
  const { setNewPasswordLength, getPasswordLength } = usePasswordLength()
  const darkModeActive = useDarkModeStore(state => state.darkModeActive)

  const handleChange = ({ target }: React.ChangeEvent<HTMLInputElement>) => {
    setNewPasswordLength(parseInt(target.value))
  }

  return (
    <div className="w-full max-w-xl">
      <div className="flex items-center space-x-4">
        <input
          type="range"
          min={8}
          max={128}
          defaultValue={8}
          onChange={handleChange}
          className={`
            w-full h-2 rounded-lg 
            appearance-none cursor-pointer 
            ${darkModeActive ? "bg-gray-700" : "bg-gray-200"}
          `}
        />
        <span
          className={`
            slider-value px-3 py-1 rounded-md min-w-[3rem] 
            text-center font-medium
            ${darkModeActive ? "bg-gray-800" : "bg-gray-100"}
            ${darkModeActive ? "text-gray-200" : "text-gray-800"}
          `}
        >
          {getPasswordLength()}
        </span>
      </div>
      <div
        className={`
          flex justify-between text-xs mt-1
          ${darkModeActive ? "text-gray-400" : "text-gray-500"}
        `}
      >
        <span>8</span>
        <span>128</span>
      </div>
    </div>
  )
}
