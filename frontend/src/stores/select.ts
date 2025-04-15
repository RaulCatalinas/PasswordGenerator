import { create } from "zustand";

interface SelectState {
  showContactSelect: boolean
  showChangeLanguageSelect: boolean
  setShowContactSelect: (showContactSelect: boolean) => void
  setShowChangeLanguageSelect: (showChangeLanguageSelect: boolean) => void
}

export const useSelectStore = create<SelectState>()(set => ({
  showContactSelect: false,
  showChangeLanguageSelect: false,

  setShowContactSelect(showContactSelect) {
    set({ showContactSelect })
  },
  setShowChangeLanguageSelect(showChangeLanguageSelect) {
    set({ showChangeLanguageSelect })
  },
}))