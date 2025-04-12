// Components
import ButtonGeneratePassword from "./components/buttons/ButtonGeneratePassword"
import InputPassword from "./components/inputs/InputPassword"
import Slider from "./components/sliders/Slider"

// Hooks
import { usePassword } from "./hooks/usePassword"

// Store
import { useDarkModeStore } from "./stores/dark-mode"

export default function App() {
  const { getPassword } = usePassword()
  const darkModeActive = useDarkModeStore(state => state.darkModeActive)

  return (
    <div
      className={`
        flex flex-col items-center justify-center h-screen
        ${darkModeActive ? "bg-gray-900" : "bg-gray-200 "}
      `}
    >
      <div
        className={`
          w-full max-w-3xl text-gray-800 
          rounded-xl shadow-lg p-8 space-y-8
          ${darkModeActive ? "bg-gray-800" : "bg-white"}
        `}
      >
        <h1
          className={`
            text-2xl font-bold text-center
            ${darkModeActive ? "text-white" : "text-gray-800"}
          `}
        >
          Password Generator
        </h1>

        <div className="space-y-6">
          <div className="space-y-2">
            <label
              className={`
                block text-sm font-medium
                ${darkModeActive ? "text-gray-300" : "text-gray-700"}
              `}
            >
              Password length (in characters):
            </label>
            <Slider />
          </div>

          <InputPassword passwordGenerated={getPassword()} />

          <div className="flex justify-center mt-6">
            <ButtonGeneratePassword />
          </div>
        </div>
      </div>
    </div>
  )
}
