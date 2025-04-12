interface InputPasswordProps {
  passwordGenerated: string
}

export default function InputPassword(props: InputPasswordProps) {
  return (
    <div className="relative w-full max-w-xl">
      <input
        type="text"
        value={props.passwordGenerated}
        readOnly
        placeholder="Generated password"
        className={`
          w-full px-4 py-3 rounded-md border border-gray-300 focus:outline-none 
          focus:ring-2 focus:ring-blue-500 focus:border-transparent bg-white 
          text-gray-800 font-mono text-lg shadow-sm dark:bg-gray-800 
          dark:border-gray-700 dark:text-gray-100 dark:focus:ring-blue-400
        `}
      />
    </div>
  )
}
