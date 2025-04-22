// Third-Party libraries
import i18n from "i18next"
import { initReactI18next } from "react-i18next"

// JSONs
import translationEN from "@/src/locales/en/translation.json"
import translationES from "@/src/locales/es/translation.json"

// Wailsjs
import { GetPreferences } from "@/wailsjs/user_preferences/userPreferencesGenerator"

const { language } = await GetPreferences()

await i18n.use(initReactI18next).init({
  resources: {
    en: {
      translation: translationEN
    },
    es: {
      translation: translationES
    }
  },

  fallbackLng: "en",

  interpolation: {
    escapeValue: false
  },

  lng: language
})

export default i18n
