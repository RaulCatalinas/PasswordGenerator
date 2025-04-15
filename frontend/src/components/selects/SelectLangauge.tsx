// Components
import BaseSelect from "./BaseSelect"
import SelectOption from "./SelectOption"

// Constants
import { I18N_LANGUAGES } from "@/src/constants/i18n"

// React
import type { ChangeEvent } from "react"

// Stores
import { useSelectStore } from "@/src/stores/select"

export default function SelectLanguage() {
  const showChangeLanguageSelect = useSelectStore(
    state => state.showChangeLanguageSelect
  )
  const setShowChangeLanguageSelect = useSelectStore(
    state => state.setShowChangeLanguageSelect
  )

  const handleChange = ({ target }: ChangeEvent<HTMLSelectElement>) => {
    if (target.value === "placeholder") return

    console.log(`Changing language to: ${target.value}`)

    setShowChangeLanguageSelect(!showChangeLanguageSelect)
  }

  return (
    <BaseSelect onChange={handleChange} defaultValue="placeholder">
      <SelectOption
        text="Change language"
        value="placeholder"
        isPlaceholder={true}
      />

      {I18N_LANGUAGES.map(({ id, name, value }) => (
        <SelectOption key={id} text={name} value={value} />
      ))}
    </BaseSelect>
  )
}
