import { create } from "zustand";

interface PasswordState {
  password: string
  passwordLength: number
  setPassword: (password: string) => void
  setPasswordLength: (passwordLength: number) => void
}

export const usePasswordStore = create<PasswordState>()(set => ({
  password: "",
  passwordLength: 8,
  setPassword(password) {
    set({ password })
  },
  setPasswordLength(passwordLength) {
    set({ passwordLength })
  },
}))