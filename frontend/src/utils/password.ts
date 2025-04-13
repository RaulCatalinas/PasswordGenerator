// Wailsjs
import { SetClipboard } from "@/wailsjs/main/App"

// Utils
import { notify } from "./notifications"

interface CopyPasswordToClipboardProps {
  password: string
  darkModeActive: boolean
}

export async function copyPasswordToClipboard({ password, darkModeActive }: CopyPasswordToClipboardProps) {
  try {
    if (password === "") {
      notify({
        text: "You haven't generated any passwords",
        type: "error",
        darkModeActive
      })

      return
    }

    await SetClipboard(password)

    notify({
      text: "Password copied to clipboard",
      type: "success",
      darkModeActive
    })
  } catch {
    notify({
      text: "An error occurred while copying the password to the clipboard, try again later.",
      type: "error",
      darkModeActive
    })
  }
}