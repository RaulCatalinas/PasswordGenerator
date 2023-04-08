from os import chdir
from os.path import dirname


def get_files_path() -> tuple[str, str]:
    """
    This function returns the file paths for "languages.json" and ".env" files located in the current directory.

    :return: A tuple containing the file paths for "languages.json" and ".env".
    """
    chdir(dirname(__file__))

    return ("languages.json", ".env")
