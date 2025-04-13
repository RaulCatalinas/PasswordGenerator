// Components
import BaseTaskBarButton from "./BaseTaskBarButton"

// Third-Party libraries
import { IconWorld } from "@tabler/icons-react"

export default function ButtonChangeLanguage() {
  const handleChangeLanguage = () => {
    console.log("Changing language...")
  }

  return (
    <BaseTaskBarButton onClick={handleChangeLanguage}>
      <IconWorld size={20} />
    </BaseTaskBarButton>
  )
}
