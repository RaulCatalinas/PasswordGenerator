// Components
import BaseTaskBarButton from "./BaseTaskBarButton"

// Third-Party libraries
import { IconAddressBook } from "@tabler/icons-react"

export default function ButtonChangeLanguage() {
  const handleContact = () => {
    console.log("Contacting...")
  }

  return (
    <BaseTaskBarButton onClick={handleContact}>
      <IconAddressBook size={20} />
    </BaseTaskBarButton>
  )
}
