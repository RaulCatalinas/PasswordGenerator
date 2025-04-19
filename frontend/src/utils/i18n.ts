// Types
import type { I18NLanguage } from "@/src/types/i18n";

// Wailsjs
import { types } from "@/wailsjs/models";

//Third-Party libraries
import i18next from 'i18next';

// Enums
import { TranslationKeys } from "@/src/enums/i18n";

export function getI18NLanguages(): I18NLanguage[] {
  return [
    {
      id: "english",
      name: i18next.t(TranslationKeys.ENGLISH_OPTION),
      value: types.Language.ENGLISH
    },
    {
      id: "spanish",
      name: i18next.t(TranslationKeys.SPANISH_OPTION),
      value: types.Language.SPANISH
    }
  ]
}