import { useState } from "react"

export function usePassword() {
  const [password, setPassword] = useState("")

  const setNewPassword = (newPassword: string) => {
    setPassword(newPassword)
  }

  const getPassword = () => {
    return password
  }

  return { setNewPassword, getPassword }
}