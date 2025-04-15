// Components
import { useSelectStore } from "@/src/stores/select"
import BaseTaskBarButton from "./BaseTaskBarButton"

// Third-Party libraries
import { IconWorld } from "@tabler/icons-react"

export default function ButtonChangeLanguage() {
  const showChangeLanguageSelect = useSelectStore(
    state => state.showChangeLanguageSelect
  )
  const setShowChangeLanguageSelect = useSelectStore(
    state => state.setShowChangeLanguageSelect
  )

  const handleChangeLanguage = () => {
    setShowChangeLanguageSelect(!showChangeLanguageSelect)
  }

  return (
    <BaseTaskBarButton onClick={handleChangeLanguage}>
      <IconWorld size={20} />
    </BaseTaskBarButton>
  )
}
