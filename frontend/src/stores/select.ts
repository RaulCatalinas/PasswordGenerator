import { create } from "zustand";

interface SelectState {
  showContactSelect: boolean
  setShowContactSelect: (showContactSelect: boolean) => void
}

export const useSelectStore = create<SelectState>()(set => ({
  showContactSelect: false,
  setShowContactSelect(showContactSelect) {
    set({ showContactSelect })
  },
}))