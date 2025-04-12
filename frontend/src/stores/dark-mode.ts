import { create } from "zustand"

interface DarkModeState {
  darkModeActive: boolean
  setDarkModeActive: (darkModeActive: boolean) => void
}

const useDarkModeState = create<DarkModeState>()(set => ({
  darkModeActive: false,

  setDarkModeActive(darkModeActive) {
    set({ darkModeActive })
  },
}))

export function getDarkModeActive() {
  const { darkModeActive } = useDarkModeState.getState()

  return darkModeActive
}

export function setDarkModeActive(darkModeActive: boolean) {
  const { setDarkModeActive } = useDarkModeState.getState()

  setDarkModeActive(darkModeActive)
}