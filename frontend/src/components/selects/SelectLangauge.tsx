// Components
import BaseSelect from "./BaseSelect"
import SelectOption from "./SelectOption"

// Utils
import { getI18NLanguages } from "@/src/utils/i18n"

// React
import type { ChangeEvent } from "react"

// Stores
import { useSelectStore } from "@/src/stores/select"

// Third-Party libraries
import { useTranslation } from "react-i18next"

// Enums
import { TranslationKeys } from "@/src/enums/i18n"

//Wailsjs
import { types } from "@/wailsjs/models"
import { SetPreference } from "@/wailsjs/user_preferences/userPreferencesGenerator"

export default function SelectLanguage() {
  const languages = getI18NLanguages()

  const showChangeLanguageSelect = useSelectStore(
    state => state.showChangeLanguageSelect
  )
  const setShowChangeLanguageSelect = useSelectStore(
    state => state.setShowChangeLanguageSelect
  )

  const { i18n, t } = useTranslation()

  const handleChange = async ({ target }: ChangeEvent<HTMLSelectElement>) => {
    if (target.value === "placeholder") return

    i18n.changeLanguage(target.value)

    await SetPreference(types.UserPreferencesKeys.LANGUAGE, target.value)

    setShowChangeLanguageSelect(!showChangeLanguageSelect)
  }

  return (
    <BaseSelect onChange={handleChange} defaultValue="placeholder">
      <SelectOption
        text={t(TranslationKeys.PLACEHOLDER_SELECT_CHANGE_LANGUAGE)}
        value="placeholder"
        isPlaceholder={true}
      />

      {languages.map(({ id, name, value }) => (
        <SelectOption key={id} text={name} value={value} />
      ))}
    </BaseSelect>
  )
}
