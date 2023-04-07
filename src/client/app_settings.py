"""Set the app settings"""

from os import environ
from pathlib import Path

from dotenv import load_dotenv, set_key
from pandas import read_excel

_project_path = Path(__file__).parent.parent.parent
_config_path = _project_path.joinpath("config")
_languages_file_path = _config_path.joinpath("languages.xlsx")
_environment_variables_path = _config_path.joinpath(".env")

LANGUAGES = read_excel(_languages_file_path)

load_dotenv(_environment_variables_path)

print(LANGUAGES)


class AppSettings:
    """Read a JSON file and an Excel file, and return the value of a key to be able to configure the app"""

    def get_config_excel(self, excel_column_number: int) -> str:
        """
        Returns the value of the cell in the column of the excel file that corresponds to the language that the
        user has selected

        :param excel_column_number: The number of the column in the Excel file
        :return: The value of the cell in the column of the language being used.
        """

        LANGUAGE = self.get_language()
        return LANGUAGES.loc[excel_column_number][LANGUAGE]

    @staticmethod
    def set_language(language: str) -> None:
        """
        Sets the value of the LANGUAGE variable in the system environment variables

        :param language: The language to set
        """

        environ["LANGUAGE"] = language
        set_key(
            _environment_variables_path, key_to_set="LANGUAGE", value_to_set=language
        )

    @staticmethod
    def get_language() -> str:
        """Gets the language of the app saved in the environment variable"""

        LANGUAGE = environ.get("LANGUAGE")
        return LANGUAGE
