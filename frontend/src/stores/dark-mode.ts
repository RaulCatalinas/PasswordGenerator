import { create } from "zustand"

interface DarkModeState {
  darkModeActive: boolean
  setDarkModeActive: (darkModeActive: boolean) => void
}

export const useDarkModeStore = create<DarkModeState>()(set => ({
  darkModeActive: false,

  setDarkModeActive(darkModeActive) {
    set({ darkModeActive })
  },
}))