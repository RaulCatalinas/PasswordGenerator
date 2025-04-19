// Utils
import { getNotificationColors } from "./colors"

// Third-Party libraries
import { toast, TypeOptions } from "react-toastify"

interface NotifyProps {
  text: string
  type: TypeOptions
  darkModeActive: boolean
}

export function notify({ text, type, darkModeActive }: NotifyProps) {
  const { R, G, B } = getNotificationColors({ darkModeActive, type })

  toast(text, {
    closeOnClick: true,
    type,
    pauseOnHover: false,
    style: {
      backgroundColor: `
        rgb(${R}, ${G}, ${B})
      `,
      color: darkModeActive ? "white" : "rgb(15, 23, 42)"
    }
  })
}
