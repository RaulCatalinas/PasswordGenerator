"""Set the app settings"""

from json import load
from os import environ
from threading import Lock, Thread

from dotenv import load_dotenv, set_key

from config.get_files import get_files_path

_languages_file_path, _environment_variables_path = get_files_path()

load_dotenv(_environment_variables_path)


class AppSettings:
    """Read a JSON file and an Excel file, and return the value of a key to be able to configure the app"""

    def __init__(self):
        self.lock = Lock()

        with open(_languages_file_path, mode="r", encoding="utf-8") as f:
            self.languages = load(f)

    def get_text_from_json(self, id: int) -> str:
        """
        This function returns the text of a JSON file based on a given id and language.

        :param id: The id parameter is an integer that represents the unique identifier of the text in a JSON file. The function uses this id to retrieve the corresponding text in the language user specified

        :type id: int

        :return: The text corresponding to the given `id` parameter in the language specified by the
        environment variable `LANGUAGE`. The text is retrieved from a dictionary called `languages` which maps
        language codes to dictionaries containing the text for each id.
        """

        LANGUAGE = self.get_language()
        return self.languages[LANGUAGE][str(id)]

    def set_language(self, language: str, page) -> None:
        """
        Sets the value of the LANGUAGE variable in the system environment variables

        :param language: The language to set
        """

        environ["LANGUAGE"] = language

        self.save(page=page, language=language)

        set_key(
            _environment_variables_path, key_to_set="LANGUAGE", value_to_set=language
        )

    @staticmethod
    def get_language() -> str:
        """Gets the language of the app saved in the environment variable"""

        LANGUAGE = environ.get("LANGUAGE")
        return LANGUAGE

    def save(self, page, language):
        with self.lock:
            Thread(
                target=page.client_storage.set,
                args=["language", language],
                daemon=False,
            ).start()

    def set_environment_variable(self, page):
        LANGUAGE = page.client_storage.get("language") or "English"

        environ["LANGUAGE"] = LANGUAGE

        set_key(
            _environment_variables_path,
            key_to_set="LANGUAGE",
            value_to_set=LANGUAGE,
        )
