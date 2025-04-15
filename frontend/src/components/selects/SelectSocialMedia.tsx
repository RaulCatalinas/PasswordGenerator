// Constants
import { SOCIAL_MEDIA } from "@/src/constants/social-media"

// Wailsjs
import { OpenUrl } from "@/wailsjs/main/App"

// React
import { ChangeEvent } from "react"

// Components
import BaseSelect from "./BaseSelect"
import SelectOption from "./SelectOption"

// Stores
import { useSelectStore } from "@/src/stores/select"

export default function SelectSocialMedia() {
  const showContactSelect = useSelectStore(state => state.showContactSelect)
  const setShowContactSelect = useSelectStore(
    state => state.setShowContactSelect
  )

  const handleChange = async ({ target }: ChangeEvent<HTMLSelectElement>) => {
    if (target.value === "placeholder") return

    await OpenUrl(target.value)
    setShowContactSelect(!showContactSelect)
  }

  return (
    <BaseSelect onChange={handleChange} defaultValue="placeholder">
      <SelectOption
        text="Contact me"
        value="placeholder"
        isPlaceholder={true}
      />

      {SOCIAL_MEDIA.map(({ id, name, url }) => (
        <SelectOption key={id} text={name} value={url} />
      ))}
    </BaseSelect>
  )
}
