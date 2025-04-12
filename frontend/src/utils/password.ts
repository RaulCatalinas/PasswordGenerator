import { SetClipboard } from "@/wailsjs/main/App"

export function copyPasswordToClipboard(password: string) {
  SetClipboard(password)
}