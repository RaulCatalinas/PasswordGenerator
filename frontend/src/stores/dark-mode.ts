// Third-Party libraries
import { create } from "zustand"

// Wailsjs
import { GetPreferences } from "@/wailsjs/user_preferences/userPreferencesGenerator"

interface DarkModeState {
  darkModeActive: boolean
  setDarkModeActive: (darkModeActive: boolean) => void
}

const { darkModeActive } = await GetPreferences()

export const useDarkModeStore = create<DarkModeState>()(set => ({
  darkModeActive,

  setDarkModeActive(darkModeActive) {
    set({ darkModeActive })
  }
}))
