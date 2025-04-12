import { usePasswordLength } from "@/src/hooks/usePasswordLength"

export default function Slider() {
  const { setNewPasswordLength, getPasswordLength } = usePasswordLength()

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
            w-full h-2 bg-gray-200 rounded-lg 
            appearance-none cursor-pointer 
            dark:bg-gray-700
          `}
        />
        <span
          className={`
            slider-value bg-gray-100 text-gray-800 
            px-3 py-1 rounded-md min-w-[3rem] text-center 
            font-medium dark:bg-gray-800 dark:text-gray-200
          `}
        >
          {getPasswordLength()}
        </span>
      </div>
      <div
        className={`
          flex justify-between text-xs 
          text-gray-500 mt-1 dark:text-gray-400
        `}
      >
        <span>8</span>
        <span>128</span>
      </div>
    </div>
  )
}
