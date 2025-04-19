// Wailsjs
import { SetClipboard } from "@/wailsjs/main/App"

// Utils
import { notify } from "./notifications"

//Third-Party libraries
import i18next from 'i18next'

// Enums
import { TranslationKeys } from "@/src/enums/i18n"

interface CopyPasswordToClipboardProps {
  password: string
  darkModeActive: boolean
}

export async function copyPasswordToClipboard(
  { password, darkModeActive }: CopyPasswordToClipboardProps
) {
  try {
    if (password === "") {
      notify({
        text: i18next.t(TranslationKeys.ERROR_COPYING_PASSWORD),
        type: "error",
        darkModeActive
      })

      return
    }

    await SetClipboard(password)

    notify({
      text: i18next.t(TranslationKeys.PASSWORD_COPIED_SUCCESSFULLY),
      type: "success",
      darkModeActive
    })
  } catch {
    notify({
      text: i18next.t(TranslationKeys.ERROR_WHILE_COPYING_PASSWORD_TO_CLIPBOARD),
      type: "error",
      darkModeActive
    })
  }
}