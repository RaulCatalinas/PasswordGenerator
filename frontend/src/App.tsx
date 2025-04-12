// Components
import ButtonGeneratePassword from "./components/buttons/ButtonGeneratePassword"
import InputPassword from "./components/inputs/InputPassword"
import Slider from "./components/sliders/Slider"

// Hooks
import { usePassword } from "./hooks/usePassword"

export default function App() {
  const { getPassword } = usePassword()

  return (
    <div
      className={`
        flex flex-col items-center justify-center h-screen 
      bg-gray-50 p-6 dark:bg-gray-900
      `}
    >
      <div
        className={`
          w-full max-w-3xl bg-white text-gray-800 
          rounded-xl shadow-lg p-8 space-y-8
          dark:bg-gray-800 dark:text-white
        `}
      >
        <h1
          className={`
            text-2xl font-bold text-center 
          text-gray-800 dark:text-white
          `}
        >
          Password Generator
        </h1>

        <div className="space-y-6">
          <InputPassword passwordGenerated={getPassword()} />

          <div className="space-y-2">
            <label
              className={`
                block text-sm font-medium 
              text-gray-700 dark:text-gray-300
              `}
            >
              Password Length:
            </label>
            <Slider />
          </div>

          <div className="flex justify-center mt-6">
            <ButtonGeneratePassword />
          </div>
        </div>
      </div>
    </div>
  )
}
