"""Build the app"""

from subprocess import run


def compile_app():
    """Compile the app to generate the executable file"""

    COMMAND = """flet pack src/client/main.py -n "Password Generator" --product-name "Password Generator" --product-version 1.0.0 --copyright "Copyright (c) 2023 Raul Catalinas Esteban" --add-data config;config --add-data src/app_logic;app_logic --add-data src/client;client --add-data"""

    execute = run(COMMAND, capture_output=True, check=True)

    if execute.returncode == 0:
        return print("App compiled successfully")

    return print(f"Could not compile, this is the reason: {execute.stderr}")


compile_app()
