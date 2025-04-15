// Components
import BaseTaskBarButton from "./BaseTaskBarButton"

// Third-Party libraries
import { IconAddressBook } from "@tabler/icons-react"

// Stores
import { useSelectStore } from "@/src/stores/select"

export default function ButtonChangeLanguage() {
  const showContactSelect = useSelectStore(state => state.showContactSelect)
  const setShowContactSelect = useSelectStore(
    state => state.setShowContactSelect
  )

  const handleContact = () => {
    setShowContactSelect(!showContactSelect)
  }

  return (
    <BaseTaskBarButton onClick={handleContact}>
      <IconAddressBook size={20} />
    </BaseTaskBarButton>
  )
}
