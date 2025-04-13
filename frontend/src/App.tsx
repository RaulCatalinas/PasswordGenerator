// Components
import ButtonCopyPassWord from "./components/buttons/ButtonCopyPassword"
import ButtonGeneratePassword from "./components/buttons/ButtonGeneratePassword"
import InputPassword from "./components/inputs/InputPassword"
import Slider from "./components/sliders/Slider"
import TaskBar from "./components/taskbar/Taskbar"

// Store
import { useDarkModeStore } from "./stores/dark-mode"

// Third-Party libraries
import { ToastContainer } from "react-toastify"

export default function App() {
  const darkModeActive = useDarkModeStore(state => state.darkModeActive)

  return (
    <>
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
          <TaskBar />

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

            <InputPassword />

            <div className="flex flex-row justify-center items-center gap-2 mt-6">
              <ButtonGeneratePassword />
              <ButtonCopyPassWord />
            </div>
          </div>
        </div>
      </div>
      <ToastContainer />
    </>
  )
}
