import { useState } from "react";

export function usePasswordLength() {
  const [passwordLength, setPasswordLength] = useState(8)

  const setNewPasswordLength = (newPasswordLength: number) => {
    setPasswordLength(newPasswordLength)
  }

  const getPasswordLength = () => {
    return passwordLength
  }

  return { setNewPasswordLength, getPasswordLength }
}