// Stores
import { useDarkModeStore } from "@/src/stores/dark-mode"

// React
import { ReactNode } from "react"

interface BaseTaskBarButtonProps {
  children: ReactNode
  onClick: () => void
}

export default function BaseTaskBarButton({
  children,
  onClick
}: BaseTaskBarButtonProps) {
  const darkModeActive = useDarkModeStore(state => state.darkModeActive)

  return (
    <button
      onClick={onClick}
      className={`
        p-2 rounded-full transition-colors duration-200
        focus:outline-none focus:ring-2 focus:ring-opacity-50
        hover:cursor-pointer
        ${darkModeActive ? "bg-gray-600" : "bg-gray-200"}
        ${darkModeActive ? "hover:bg-gray-500" : "hover:bg-gray-300"}
      `}
    >
      {children}
    </button>
  )
}
