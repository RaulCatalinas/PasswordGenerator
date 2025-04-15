import { useDarkModeStore } from "@/src/stores/dark-mode"

interface SelectOptionProps {
  key?: string
  value: string
  text: string
  isPlaceholder?: boolean
}

export default function SelectOption({
  key,
  text,
  value,
  isPlaceholder
}: SelectOptionProps) {
  const darkModeActive = useDarkModeStore(state => state.darkModeActive)

  return (
    <option
      key={key}
      value={value}
      disabled={isPlaceholder}
      className={`
        ${darkModeActive ? "bg-gray-700" : "bg-white"}
      `}
    >
      {text}
    </option>
  )
}
