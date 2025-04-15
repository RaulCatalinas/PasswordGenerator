// Stores
import { useDarkModeStore } from "@/src/stores/dark-mode"

// React
import type { ChangeEventHandler, ReactNode } from "react"

interface BaseSelectProps {
  children: ReactNode
  onChange: ChangeEventHandler<HTMLSelectElement>
  defaultValue?: string
}

export default function BaseSelect({
  children,
  onChange,
  defaultValue
}: BaseSelectProps) {
  const darkModeActive = useDarkModeStore(state => state.darkModeActive)

  return (
    <select
      className={`
        w-full px-3 py-2 rounded-md 
        border focus:outline-none
        focus:ring-2 focus:ring-blue-500 focus:border-transparent
        appearance-none bg-no-repeat bg-right
        transition-colors duration-200
        hover:cursor-pointer
        ${darkModeActive ? "bg-gray-700" : "bg-white"}
        ${darkModeActive ? "text-gray-200" : "border-gray-300"}
        ${darkModeActive ? "border-gray-600" : "text-gray-800 "}
      `}
      onChange={onChange}
      defaultValue={defaultValue}
    >
      {children}
    </select>
  )
}
